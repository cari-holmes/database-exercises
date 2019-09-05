SELECT users.name AS user_name, roles.name AS role_name FROM users
JOIN roles ON users.role_id=roles.id;

SELECT users.name AS user_name, roles.name AS role_name FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS usr_name, roles.name AS role_name FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


USE employees;

SELECT departments.dept_name AS department_name, CONCAT(first_name, ' ', last_name) AS department_manager FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = departments.dept_no
