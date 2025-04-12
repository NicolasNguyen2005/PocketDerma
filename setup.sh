#!/bin/bash

# Create necessary directories first
echo "Creating directories..."
mkdir -p runs/detect/train/weights

# Show current directory and contents
echo "Current directory: $(pwd)"
echo "Directory contents:"
ls -la

# Get the release asset URL using GitHub API
echo "Getting release asset URL..."
ASSET_URL=$(curl -s https://api.github.com/repos/NicolasNguyen2005/PocketDerma/releases/latest | grep -o 'https://.*/best.pt' | head -n 1)
echo "Asset URL: $ASSET_URL"

# Download the model file using the asset URL
echo "Downloading model file..."
curl -L -H "Accept: application/octet-stream" -o runs/detect/train/weights/best.pt "$ASSET_URL"

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