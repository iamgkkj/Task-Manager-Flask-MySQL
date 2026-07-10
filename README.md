# Task Manager - Admin Task Management System

### Name: Gopal Krishn Khoth
### Reg. No: 23BCE10669
### Application Number: IN26011759
A simple Flask web application for Admin Task Management. The application allows admin users to login and assign tasks to subordinates.

## Tech Stack

- **Frontend**: Vanilla HTML and basic CSS
- **Backend**: Python (Flask)
- **Database**: MySQL (using mysql-connector-python)

## Features

1. **Login Page (`/`)**: Admin login with username and password
2. **Task Management Page (`/tasks`)**: 
   - Form to assign tasks to subordinates
   - Fields: Employee Name, Task Title (dropdown), Completed (boolean)
   - Displays all existing tasks in a table

## Database Schema

- **admin_users**: id, username, password
- **tasks**: task_id (PK, Auto Increment), employee_name, task_title, is_completed (Boolean/TinyInt)

## Default Credentials

- **Admin Login**: Username: `admin`, Password: `admin`
- **Database**: User: `taskmanager`, Password: `taskmanager123`

## Project Structure

```
/TaskManager
  ├── app.py                 # Main Flask application
  ├── requirements.txt       # Python dependencies
  ├── setup_db.sql          # MySQL database setup script
  ├── setup.sh              # Automated setup script (Linux/macOS)
  ├── static/
  │   └── style.css         # CSS styles
  ├── templates/
  │   ├── login.html        # Login page template
  │   └── tasks.html        # Task management page template
  └── README.md             # This file
```

## Setup Instructions

### Prerequisites

- Python 3.8 or higher
- MySQL Server 5.7 or higher
- pip (Python package manager)

### Linux/macOS Setup

#### Option 1: Automated Setup (Recommended)

The project includes an automated setup script (`setup.sh`) that handles the entire setup process:

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd TaskManager
   ```

2. **Make the setup script executable**
   ```bash
   chmod +x setup.sh
   ```

3. **Run the automated setup script**
   ```bash
   ./setup.sh
   ```

   **What the script does:**
   - Creates a Python virtual environment if it doesn't exist
   - Activates the virtual environment
   - Installs all required dependencies from `requirements.txt`
   - Sets up the MySQL database using `setup_db.sql`
   - Creates a dedicated MySQL user (`taskmanager`) with appropriate permissions
   - Starts the Flask development server

   **Note:** You will be prompted for your MySQL root password during database setup. If your MySQL root user has no password, just press Enter.

4. **Access the application**
   Open your browser and navigate to: `http://localhost:5000`

#### Option 2: Manual Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd TaskManager
   ```

2. **Create and activate virtual environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Setup MySQL database**
   ```bash
   sudo mysql -u root -p < setup_db.sql
   ```
   Enter your MySQL root password when prompted.

5. **Run the application**
   ```bash
   python app.py
   ```

6. **Access the application**
   Open your browser and navigate to: `http://localhost:5000`

### Windows Setup

#### Option 1: Automated Setup (PowerShell)

1. **Clone the repository**
   ```powershell
   git clone <repository-url>
   cd TaskManager
   ```

2. **Run the setup script**
   ```powershell
   .\setup.ps1
   ```
   *(Note: You may need to run PowerShell as Administrator)*

   **What the script does:**
   - Creates a Python virtual environment if it doesn't exist
   - Activates the virtual environment
   - Installs all required dependencies from `requirements.txt`
   - Sets up the MySQL database using `setup_db.sql`
   - Creates a dedicated MySQL user (`taskmanager`) with appropriate permissions
   - Starts the Flask development server

   **Note:** You will be prompted for your MySQL root password during database setup. If your MySQL root user has no password, just press Enter.

3. **Access the application**
   Open your browser and navigate to: `http://localhost:5000`

#### Option 2: Manual Setup

1. **Clone the repository**
   ```powershell
   git clone <repository-url>
   cd TaskManager
   ```

2. **Create and activate virtual environment**
   ```powershell
   python -m venv venv
   venv\Scripts\activate
   ```

3. **Install dependencies**
   ```powershell
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Setup MySQL database**
   ```powershell
   mysql -u root -p < setup_db.sql
   ```
   Enter your MySQL root password when prompted.

5. **Run the application**
   ```powershell
   python app.py
   ```

6. **Access the application**
   Open your browser and navigate to: `http://localhost:5000`

## Running the Application

After setup, you can run the application anytime:

### Linux/macOS
```bash
source venv/bin/activate
python app.py
```

### Windows
```powershell
venv\Scripts\activate
python app.py
```

The application will start on `http://localhost:5000` with debug mode enabled.

## Database Configuration

The application uses the following database configuration (defined in `app.py`):

```python
db_config = {
    'host': 'localhost',
    'user': 'taskmanager',
    'password': 'taskmanager123',
    'database': 'task_manager'
}
```

If you need to modify these settings:
1. Update the credentials in `app.py`
2. Ensure the MySQL user exists and has the necessary permissions
3. Update the `setup_db.sql` if you want to create a different user during setup

## Troubleshooting

### MySQL Connection Errors

**Error:** `Access denied for user 'root'@'localhost'`

**Solution:** This occurs when MySQL uses auth_socket authentication. The setup script creates a dedicated user `taskmanager` to avoid this issue. If you still encounter this error:

1. Verify MySQL is running:
   ```bash
   sudo systemctl status mysql  # Linux
   ```

2. Try connecting to MySQL manually to verify credentials:
   ```bash
   mysql -u taskmanager -p taskmanager123
   ```

3. Recreate the database user if needed:
   ```sql
   DROP USER IF EXISTS 'taskmanager'@'localhost';
   CREATE USER 'taskmanager'@'localhost' IDENTIFIED BY 'taskmanager123';
   GRANT ALL PRIVILEGES ON task_manager.* TO 'taskmanager'@'localhost';
   FLUSH PRIVILEGES;
   ```

### "Unread result found" Error

**Error:** `mysql.connector.errors.InternalError: Unread result found`

**Solution:** This has been fixed in the current version by using buffered cursors. Ensure you're using the latest version of `app.py`.

### Port Already in Use

**Error:** `Address already in use`

**Solution:** Either stop the process using port 5000 or run the app on a different port:
```bash
python app.py --port 5001
```

Or modify `app.py` to use a different port:
```python
if __name__ == '__main__':
    app.run(debug=True, port=5001)
```

## Development

### Adding New Features

1. Add new routes in `app.py`
2. Create corresponding HTML templates in the `templates/` directory
3. Add CSS styles in `static/style.css`
4. Update the database schema in `setup_db.sql` if needed

### Database Schema Changes

If you modify the database schema:

1. Update `setup_db.sql` with your changes
2. Recreate the database:
   ```bash
   sudo mysql -u root -p < setup_db.sql
   ```

## Security Notes

⚠️ **Important Security Considerations:**

- The application uses a hardcoded secret key. In production, use environment variables:
  ```python
  app.secret_key = os.environ.get('SECRET_KEY', 'dev-key')
  ```
- The admin password is stored in plain text. In production, use password hashing (e.g., bcrypt)
- The development server should not be used in production. Use a WSGI server like Gunicorn or uWSGI
- MySQL credentials should be stored in environment variables or a configuration file
- Enable HTTPS in production

## Production Deployment

For production deployment, consider:

1. **Use a production WSGI server:**
   ```bash
   pip install gunicorn
   gunicorn -w 4 -b 0.0.0.0:5000 app:app
   ```

2. **Use environment variables for sensitive data:**
   ```bash
   export SECRET_KEY='your-secret-key'
   export DB_USER='taskmanager'
   export DB_PASSWORD='your-db-password'
   export DB_NAME='task_manager'
   ```

3. **Set up a reverse proxy** (nginx, Apache) for SSL/TLS termination

4. **Use a process manager** (systemd, supervisor) to keep the application running

## License

This project is open source and available under the MIT License.


