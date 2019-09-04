USE employees;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name ASC, last_name ASC;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name ASC, first_name ASC;

SELECT * FROM employees WHERE last_name LIKE 'e%' ORDER BY emp_no ASC;
SELECT * FROM employees WHERE last_name LIKE '%e' ORDER BY emp_no ASC;

SELECT * FROM employees WHERE last_name LIKE 'e%' ORDER BY emp_no DESC;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name DESC, first_name DESC;

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01' AND birth_date LIKE '%-12-25' ORDER BY birth_date ASC, hire_date DESC;
