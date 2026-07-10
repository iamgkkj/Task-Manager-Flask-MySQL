#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting setup process..."

# 1. Create and activate the virtual environment
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
else
    echo "📦 Virtual environment already exists."
fi

echo "🔄 Activating virtual environment..."
source venv/bin/activate

# 2. Install dependencies
echo "⬇️  Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

# 3. Setup MySQL database
echo "🗄️  Setting up MySQL database..."
echo "⚠️  Please enter your MySQL root password when prompted (or just press Enter if you don't have one):"
sudo mysql -u root -p < setup_db.sql

# 4. Run the application
echo "✅ Setup complete!"
echo "🌐 Access your application at: http://localhost:5000"
echo "Starting Flask server..."

python app.py