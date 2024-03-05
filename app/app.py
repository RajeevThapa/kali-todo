# Import necessary modules
from flask import Flask, render_template, request, redirect, url_for

# Create a Flask web application
app = Flask(__name__)

# Sample to-do list data
todo_list = []

# Define routes and their respective functions
@app.route('/')
def index():
    return render_template('index.html', todo_list=todo_list)

@app.route('/add', methods=['POST'])
def add():
    task = request.form.get('task')
    todo_list.append(task)
    return redirect(url_for('index'))

@app.route('/delete/<int:task_id>')
def delete(task_id):
    if 0 <= task_id < len(todo_list):
        del todo_list[task_id]
    return redirect(url_for('index'))

# Run the application
if __name__ == '__main__':
    app.run(debug=True)
