from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector

app = Flask(__name__)
app.secret_key = 'secretkey123'

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'task_manager'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM admin_users WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()
        cursor.close()
        conn.close()
        
        if user:
            session['logged_in'] = True
            session['username'] = username
            return redirect(url_for('tasks'))
        else:
            return render_template('login.html', error='Invalid username or password')
    
    return render_template('login.html')

@app.route('/tasks', methods=['GET', 'POST'])
def tasks():
    if 'logged_in' not in session:
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        employee_name = request.form['employee_name']
        task_title = request.form['task_title']
        is_completed = request.form['is_completed']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO tasks (employee_name, task_title, is_completed) VALUES (%s, %s, %s)",
                      (employee_name, task_title, is_completed))
        conn.commit()
        cursor.close()
        conn.close()
    
    # Fetch all tasks
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT task_id, employee_name, task_title, is_completed FROM tasks")
    tasks = cursor.fetchall()
    cursor.close()
    conn.close()
    
    return render_template('tasks.html', tasks=tasks)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
