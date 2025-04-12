#!/bin/bash

# Install system dependencies
apt-get update
apt-get install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxext6 libxrender-dev

# Create necessary directories
mkdir -p runs/detect/train/weights

# Install Python dependencies
pip install -r requirements.txt

# Download model file if it doesn't exist
if [ ! -f "runs/detect/train/weights/best.pt" ]; then
    echo "Downloading model file..."
    # Add your model download command here
    # For example, if your model is stored in a public URL:
    # wget -O runs/detect/train/weights/best.pt "YOUR_MODEL_URL"
fi

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Starting the app..."
streamlit run app.py 