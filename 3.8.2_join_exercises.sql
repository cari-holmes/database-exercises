
SELECT * FROM users;
SELECT * FROM roles;

SELECT users.name AS user_name, roles.name AS role_name FROM users
JOIN roles ON users.role_id=roles.id;

SELECT users.name AS user_name, roles.name AS role_name FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS usr_name, roles.name AS role_name FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT u.*, r.*
FROM users AS u
RIGHT JOIN roles as r;

--

USE employees;
 

SELECT CONCAT(e.first_name, ' ', e.last_name) AS department_manager, d.dept_name AS department_name
FROM employees AS e

JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no

JOIN departments AS d 
ON d.dept_no = dm.dept_no

WHERE dm.to_date = '9999-01-01' ORDER BY d.dept_name;

-- 

SELECT d.dept_name AS department_name, CONCAT(e.first_name, ' ', e.last_name) AS department_manager 
FROM employees AS e

JOIN dept_manager AS dm
ON dm.emp_no = e.emp_no

JOIN departments AS d 
ON d.dept_no = dm.dept_no

WHERE dm.to_date = '9999-01-01' AND gender = 'F' ORDER BY d.dept_name;

--

SELECT title, COUNT(*) FROM titles

JOIN dept_emp AS de
ON de.emp_no = titles.emp_no

JOIN departments AS d
ON d.dept_no = de.dept_no

WHERE de.to_date = "9999-01-01" AND titles.to_date = "9999-01-01" AND dept_name = "customer service"
GROUP BY title;

-- 

SELECT dept_name AS department_name, CONCAT(e.first_name, ' ', e.last_name) AS name, s.salary AS salary
FROM dept_manager AS dm

JOIN employees AS e
ON e.emp_no = dm.emp_no

JOIN salaries AS s
ON s.emp_no = dm.emp_no

JOIN departments AS d
ON d.dept_no = dm.dept_no

WHERE dm.to_date = "9999-01-01" AND s.to_date = "9999-01-01" ORDER BY dept_name ASC
;

--

SELECT de.dept_no, d.dept_name AS dept_name, COUNT(*) AS num_employees
FROM dept_emp AS de

JOIN departments AS d
ON d.dept_no = de.dept_no

JOIN employees AS e
ON e.emp_no = de.emp_no

WHERE de.to_date = '9999-01-01' 
GROUP BY de.dept_no, d.dept_name;

--

SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
FROM dept_emp AS de

JOIN departments AS d
ON d.dept_no = de.dept_no

JOIN salaries AS s
ON s.emp_no = de.emp_no

WHERE de.to_date = "9999-01-01" AND s.to_date = "9999-01-01"
GROUP BY AVG(s.salary)
ORDER BY d.dept_name DESC
LIMIT 1;

--

