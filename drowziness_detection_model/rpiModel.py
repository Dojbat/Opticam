'''This program is created to use the Drowsy detection model
   from Opticam to run on Raspberry Pi 5 with Camera Module 3
   Created By Phurich Amornnara 3rd May 2025
'''
import os
import cv2
import time
import numpy as np
from ultralytics import YOLO
from picamera2 import Picamera2 # import to access camera module 3
import RPi.GPIO as GPIO # import to access the GPIO pins for LED output

# Load YOLOv8 model
model_path = "best.pt"
if not os.path.exists(model_path):
    raise FileNotFoundError(f"Model weights not found at: {model_path}")
model = YOLO(model_path)

# Class-specific colors
class_colors = {
    "awake": (0, 255, 0),
    "drowsy": (0, 0, 255),
    "yawning": (255, 255, 0),
}

def apply_night_vision(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    enhanced = clahe.apply(gray)
    blurred = cv2.GaussianBlur(enhanced, (5, 5), 0)
    return cv2.cvtColor(blurred, cv2.COLOR_GRAY2BGR)

def measure_brightness(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    return np.mean(gray)

def adjust_gamma(frame, gamma):
    inv_gamma = 1.0 / gamma
    table = np.array([((i / 255.0) ** inv_gamma) * 255 for i in range(256)]).astype("uint8")
    return cv2.LUT(frame, table)

# Setting up Raspberry Pi In/Out
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.OUT) # pin number 17

# Setting up Camera
picam2 = Picamera2()
picam2.configure(picam2.create_video_configuration(main={"size": (640,480)}))
picam2.start()

time.sleep(2)

print("Camera initialized. Press 'q' to exit.")

drowsy_start_time = None
alert_triggered = False
brightness_threshold = 100

while True:
    frame = picam2.capture_array("main")[:, :, :3].copy()
    frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB) # convert to the RGB color
    
    brightness = measure_brightness(frame_rgb)
    print(f"Brightness: {brightness:.2f}")

    if brightness < brightness_threshold:
        print("Low light detected. Applying gamma correction.")
        frame = adjust_gamma(frame_rgb, gamma=2)
    else:
        print("Sufficient lighting detected.")

    results = model.predict(source=frame_rgb, stream=True, conf=0.5)

    for result in results:
        for box in result.boxes.data.tolist():
            x1, y1, x2, y2, conf, cls = map(int, box[:6])
            class_name = model.names[cls]
            label = f"{class_name} {conf:.2f}"
            color = class_colors.get(class_name, (255, 255, 255))

            if class_name == "drowsy":
                alert_triggered = True
                if alert_triggered == True:
                    for i in range(5): #Blink the LED
                        GPIO.output(17, GPIO.HIGH)
                        time.sleep(0.3)
                        GPIO.output(17, GPIO.LOW)
                        time.sleep(0.3)
                    
                    print("Drowsiness Alert Triggered!")
            else:
                alert_triggered = False

            cv2.rectangle(frame_rgb, (x1, y1), (x2, y2), color, 2)
            cv2.putText(frame_rgb, label, (x1, max(y1 - 10, 20)), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)

            # Show zoomed face
            face_crop = frame_rgb[y1:y2, x1:x2]
            if face_crop.size > 0:
                zoomed_face = cv2.resize(face_crop, (640, 480))
                cv2.imshow("Zoomed Face", zoomed_face)

    cv2.imshow("Processed Frame", frame_rgb)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        print("Quitting...")
        break

cv2.destroyAllWindows()
picam2.close()
GPIO.cleanup()