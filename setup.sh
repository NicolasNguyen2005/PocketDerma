#!/bin/bash

# Create necessary directories first
echo "Creating directories..."
mkdir -p runs/detect/train/weights

# Show current directory and contents
echo "Current directory: $(pwd)"
echo "Directory contents:"
ls -la

# Download the model file from GitHub release
echo "Downloading model file..."
wget --no-check-certificate -O runs/detect/train/weights/best.pt "https://github.com/NicolasNguyen2005/PocketDerma/releases/download/v1.0.0/best.pt"

# Show download result
echo "Download exit code: $?"
echo "Model file size: $(ls -lh runs/detect/train/weights/best.pt 2>/dev/null || echo 'File not found')"

# Verify model file exists
if [ -f "runs/detect/train/weights/best.pt" ]; then
    echo "Model file successfully downloaded"
    echo "Model file details:"
    ls -la runs/detect/train/weights/
else
    echo "Error: Model file not found"
    echo "Directory contents:"
    ls -la runs/detect/train/weights/
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