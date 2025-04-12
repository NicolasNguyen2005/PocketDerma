#!/bin/bash

# Create necessary directories first
echo "Creating directories..."
mkdir -p runs/detect/train/weights

# Download the model file from GitHub release
echo "Downloading model file..."
curl -L -o runs/detect/train/weights/best.pt "https://github.com/NicolasNguyen2005/PocketDerma/releases/download/v1.0.0/best.pt"

# Verify model file exists
if [ -f "runs/detect/train/weights/best.pt" ]; then
    echo "Model file successfully downloaded"
    ls -la runs/detect/train/weights/
else
    echo "Error: Model file not found"
    exit 1
fi

# Install Git LFS
echo "Installing Git LFS..."
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install -y git-lfs
git lfs install

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt 