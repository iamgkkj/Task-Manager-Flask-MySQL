CREATE DATABASE IF NOT EXISTS task_manager;
USE task_manager;

CREATE USER IF NOT EXISTS 'taskmanager'@'localhost' IDENTIFIED BY 'taskmanager123';
GRANT ALL PRIVILEGES ON task_manager.* TO 'taskmanager'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    task_title VARCHAR(100) NOT NULL,
    is_completed TINYINT(1) DEFAULT 0
);

INSERT INTO admin_users (username, password) VALUES ('admin', 'admin');
