# PowerShell Setup Script for Task Manager
# This script automates the setup process for Windows users

Write-Host "🚀 Starting setup process..." -ForegroundColor Green

# 1. Create and activate the virtual environment
if (-not (Test-Path "venv")) {
    Write-Host "📦 Creating virtual environment..." -ForegroundColor Yellow
    python -m venv venv
} else {
    Write-Host "📦 Virtual environment already exists." -ForegroundColor Yellow
}

Write-Host "🔄 Activating virtual environment..." -ForegroundColor Yellow
& .\venv\Scripts\Activate.ps1

# 2. Install dependencies
Write-Host "⬇️  Installing dependencies from requirements.txt..." -ForegroundColor Yellow
pip install --upgrade pip
pip install -r requirements.txt

# 3. Setup MySQL database
Write-Host "🗄️  Setting up MySQL database..." -ForegroundColor Yellow
Write-Host "⚠️  Please enter your MySQL root password when prompted (or just press Enter if you don't have one):" -ForegroundColor Red
mysql -u root -p < setup_db.sql

# 4. Run the application
Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host "🌐 Access your application at: http://localhost:5000" -ForegroundColor Cyan
Write-Host "Starting Flask server..." -ForegroundColor Cyan

python app.py
