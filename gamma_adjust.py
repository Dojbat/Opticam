# This program will adjust the gamma value of photo to prepare to train the model in roboflow :)
# Created 1st March 2025

import os
import cv2
import numpy as np

def adjust_gamma(image, gamma):
    inv_gamma = 1.0 / gamma # 1.0 / 2 = 1/2 or 0.5
    table = np.array([(i / 255.0) ** inv_gamma * 255 for i in np.arange(0, 256)]).astype("uint8")
    return cv2.LUT(image, table)

def process_images(input_folder, output_folder, gamma_value=2):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    
    for filename in os.listdir(input_folder):
        input_path = os.path.join(input_folder, filename)
        output_path = os.path.join(output_folder, filename)
        
        print(f"Checking file: {filename}")  # Debugging line
        
        if os.path.isfile(input_path) and filename.lower().endswith((".jpg", ".jpeg", ".png")): # The file type need to match
            print(f"Processing: {filename}")  # Debugging line
            image = cv2.imread(input_path)
            if image is None: # If the image is NULL
                print(f"---Error loading image: {filename}")
                continue
            
            adjusted_image = adjust_gamma(image, gamma_value)
            cv2.imwrite(output_path, adjusted_image)
            print(f"Processed: {filename} -> {output_path}")
        else:
            print(f"Skipping non-image file: {filename}")  # Debugging line

if __name__ == "__main__":
    input_folder = "input_images"  # Put you folder with input images here!!
    output_folder = "output_images"  # Folder to save gamma-adjusted images!!
    gamma_value = 2  # Gamma value that we will use is 1/2 or 0.5 therefore gamma value is 2
    
    process_images(input_folder, output_folder, gamma_value)
