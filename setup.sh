#!/bin/bash

# Create necessary directories
mkdir -p runs/detect/train/weights

# Install Python dependencies
pip install -r requirements.txt

# Copy model file to the correct location
cp -r /mount/src/pocketderma/runs/detect/train/weights/best.pt runs/detect/train/weights/

# Verify model file exists
if [ -f "runs/detect/train/weights/best.pt" ]; then
    echo "Model file successfully copied"
else
    echo "Error: Model file not found"
    exit 1
fi

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Starting the app..."
streamlit run app.py 