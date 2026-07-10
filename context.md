# Task Manager - Admin Task Management System

## Project Overview
A simple Flask web application for Admin Task Management. The application allows admin users to login and assign tasks to subordinates.

## Tech Stack
- **Frontend**: Vanilla HTML and basic CSS
- **Backend**: Python (Flask)
- **Database**: MySQL (using mysql-connector-python)

## Project Structure
```
/project_root
  ├── app.py
  ├── requirements.txt
  ├── setup_db.sql
  ├── static/
  │   └── style.css
  └── templates/
      ├── login.html
      └── tasks.html
```

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
- Username: admin
- Password: admin

## Setup Instructions
1. Install dependencies: `pip install -r requirements.txt`
2. Setup MySQL database: Run the SQL commands in `setup_db.sql`
3. Update database credentials in `app.py` if needed (host, user, password)
4. Run the application: `python app.py`
5. Access at: http://localhost:5000

## Goals
- [x] Create project structure
- [x] Implement login functionality
- [x] Implement task management functionality
- [x] Create database schema
- [x] Add basic styling
