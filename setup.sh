#!/bin/bash

# Install Git LFS
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get install -y git-lfs
git lfs install

# Create necessary directories
mkdir -p runs/detect/train/weights

# Install Python dependencies
pip install -r requirements.txt

# Clone the repository to get the model file
git clone https://github.com/NicolasNguyen2005/PocketDerma.git temp_repo
cp temp_repo/runs/detect/train/weights/best.pt runs/detect/train/weights/
rm -rf temp_repo

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