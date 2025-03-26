from ultralytics import YOLO

if __name__ == '__main__':
    # Specify the dataset path
    dataset_path = "dataset"  # Update if necessary

    # Load and train YOLOv8 model
    model = YOLO("yolov8s.pt")

    # Train the model using GPU
    model.train(
        data=f"{dataset_path}/data.yaml",
        epochs=25,
        batch=16,
        imgsz=800,
        plots=True,
        device=0  # Use GPU (0 refers to the first GPU)
    )