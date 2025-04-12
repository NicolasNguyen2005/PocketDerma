# Acne Detection & Skincare Recommendation System

A Streamlit-based web application that uses computer vision and machine learning to detect acne and provide personalized skincare recommendations.

## Features

- Real-time acne detection using YOLO model
- Acne severity analysis
- Personalized skincare product recommendations
- Detailed ingredient information
- Usage instructions for recommended products

## Installation

1. Clone the repository:
```bash
git clone [your-repository-url]
cd [repository-name]
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
.\venv\Scripts\activate  # On Windows
source venv/bin/activate  # On Unix/MacOS
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

## Usage

1. Start the Streamlit application:
```bash
streamlit run app.py
```

2. Open your web browser and navigate to `http://localhost:8501`

3. Upload an image of your face to get started

## Requirements

- Python 3.8+
- See `requirements.txt` for detailed package dependencies

## Project Structure

- `app.py`: Main application file
- `requirements.txt`: Python package dependencies
- `runs/`: Directory containing trained model weights

## License

[Your chosen license]

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 