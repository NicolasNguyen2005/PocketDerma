#!/bin/bash

# Install system dependencies
apt-get update
apt-get install -y libgl1-mesa-glx libglib2.0-0

# Install Python dependencies
pip install -r requirements.txt

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Starting the app..."
streamlit run app.py 