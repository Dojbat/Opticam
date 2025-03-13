import os
import cv2
import time
import numpy as np
from ultralytics import YOLO
#import winsound  # For sound alerts (Windows only)

# Define the path to the model weights file
file_path = "best.pt"  # Ensure this path is correct

# Check if the model weights file exists
if not os.path.exists(file_path):
    print(f"Error: The model weights file does not exist at the specified path: {file_path}")
else:
    # Load the YOLO model
    model = YOLO(file_path)  # Load custom YOLO model

    # Define colors for each class
    class_colors = {
        "awake": (0, 255, 0),  # Green
        "drowsy": (0, 0, 255),  # Red
        "yawning": (255, 255, 0),  # Cyan
        "Look_Forward": (255, 0, 255),  # Yellow
    }

    # Function to apply grey-scale night vision preprocessing
    def apply_night_vision(frame):
        # Convert to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        # Apply CLAHE for contrast enhancement
        clahe = cv2.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
        enhanced = clahe.apply(gray)
        
        # Apply Gaussian blur to reduce noise
        blurred = cv2.GaussianBlur(enhanced, (5, 5), 0)
        
        # Convert back to BGR for compatibility with YOLOv8
        night_vision_frame = cv2.cvtColor(blurred, cv2.COLOR_GRAY2BGR)
        
        return night_vision_frame

    # Function to measure the average brightness of a frame
    def measure_brightness(frame):
        # Convert to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        # Calculate the average brightness
        brightness = np.mean(gray)
        return brightness
    
    def adjust_gamma(frame, gamma):
        inv_gamma = 1.0 / gamma
        table = np.array([(i / 255.0) ** inv_gamma * 255 for i in np.arange(0, 256)]).astype("uint8")
        return cv2.LUT(frame, table)

    # Open the webcam
    webcamera = cv2.VideoCapture(0)

    # Check if the webcam is opened successfully
    if not webcamera.isOpened():
        print("Error: Could not open webcam.")
    else:
        print("Webcam opened. Press 'q' to quit.")

        # Variables for drowsiness tracking
        drowsy_start_time = None  # Start time of the drowsy detection
        alert_triggered = False  # Flag to prevent multiple alerts

        # Brightness threshold for enabling night vision mode
        brightness_threshold = 100  # Adjust this value as needed

        while True:
            ret, frame = webcamera.read()  # Capture a frame from the webcam
            if not ret:
                print("Error: Failed to capture frame from webcam.")
                break

            # Resize the frame for faster processing (optional)
            frame = cv2.resize(frame, (640, 480))

            # Measure the brightness of the frame
            brightness = measure_brightness(frame)
            print(f"Brightness: {brightness}")

            # Enable night vision mode if brightness is below the threshold
            if brightness < brightness_threshold:
                # print("Low light detected. Enabling grey-scale.")
                # processed_frame = apply_night_vision(frame)
                print("Low light detected. Enabling gamma correction.")
                gamma_value = 2  # Adjust gamma value for dark scenes currently set to 2
                processed_frame = adjust_gamma(frame, gamma_value)
            else:
                print("Adequate light. Using normal mode.")
                processed_frame = frame

            # Ensure the processed frame is in BGR format (3 channels)
            if len(processed_frame.shape) == 2:  # If grayscale, convert to BGR
                processed_frame = cv2.cvtColor(processed_frame, cv2.COLOR_GRAY2BGR)

            # Run YOLO inference on the processed frame
            results = model.predict(source=processed_frame, stream=True, conf=0.5)  # Adjust confidence threshold as needed

            # Draw detections, track drowsiness, and zoom into faces
            for result in results:
                for box in result.boxes.data.tolist():  # Loop through detected boxes
                    x1, y1, x2, y2, conf, cls = box[:6]
                    x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)  # Ensure coordinates are integers
                    conf = float(conf)  # Ensure confidence is a float
                    cls = int(cls)  # Ensure class is an integer
                    class_name = model.names[cls]  # Get the class name
                    if class_name == "yelling":
                        class_name = "yawning"
                    label = f"{class_name} {conf:.2f}"  # Class name and confidence

                    # Get the color for the class
                    box_color = class_colors.get(class_name, (255, 255, 255))  # Default to white if class not found

                    # Check if the detected class is "drowsy"
                    if class_name == "drowsy":
                        if drowsy_start_time is None:
                            drowsy_start_time = time.time()  # Start the timer
                        elif time.time() - drowsy_start_time >= 2:  # Check if 2 seconds have passed
                            if not alert_triggered:
                                print("Alert: User has been drowsy for 2 seconds!")
                                # winsound.Beep(1000, 1000)  # Beep sound (frequency: 1000 Hz, duration: 1 second)
                                alert_triggered = True
                    else:
                        drowsy_start_time = None  # Reset the timer if "drowsy" is not detected
                        alert_triggered = False  # Reset the alert flag

                    # Draw bounding box on the processed frame
                    cv2.rectangle(processed_frame, (x1, y1), (x2, y2), (255, 0, 0), 2)

                    # Draw text label above the bounding box on the processed frame
                    text_size, _ = cv2.getTextSize(label, cv2.FONT_HERSHEY_SIMPLEX, 0.5, 1)
                    text_width, text_height = text_size
                    text_x, text_y = x1, y1 - 10
                    if text_y < 0:
                        text_y = y1 + text_height + 10

                    # Draw background for text on the processed frame
                    cv2.rectangle(
                        processed_frame,
                        (text_x, text_y - text_height - 5),
                        (text_x + text_width + 5, text_y),
                        box_color,  # Same color as the bounding box
                        -1  # Filled rectangle
                    )

                    # Put the text on the processed frame
                    cv2.putText(
                        processed_frame,
                        label,
                        (text_x, text_y - 5),
                        cv2.FONT_HERSHEY_SIMPLEX,
                        0.5,
                        (255, 255, 255),  # White text
                        1
                    )

                    # Crop and zoom into the detected face
                    face_crop = processed_frame[y1:y2, x1:x2]  # Crop the face from the processed frame
                    if face_crop.size > 0:  # Ensure the crop is valid
                        zoomed_face = cv2.resize(face_crop, (640, 480))  # Resize to fill the frame
                        cv2.imshow("Zoomed Face", zoomed_face)  # Show the zoomed-in face

            # Display the processed frame with detections
            cv2.imshow("Processed Frame", processed_frame)

            # Wait for a short period and allow user to quit with 'q'
            key = cv2.waitKey(1) & 0xFF
            if key == ord('q'):
                print("Quitting...")
                break

        # Release the webcam and close all OpenCV windows
        webcamera.release()
        cv2.destroyAllWindows()