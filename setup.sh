#!/bin/bash

# Install system dependencies for OpenCV
apt-get update
apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgl1 \
    libglib2.0-0 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libglu1-mesa \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libgstreamer1.0-0 \
    libgstreamer-plugins-base1.0-0 \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    gfortran \
    openexr \
    libatlas-base-dev \
    libtbb2 \
    libtbb-dev \
    libdc1394-22-dev \
    libopenexr-dev \
    libgstreamer-plugins-base1.0-dev \
    libavutil-dev \
    libavfilter-dev \
    libavresample-dev \
    libavdevice-dev

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