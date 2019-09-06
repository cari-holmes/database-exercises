USE employees;

-- 1
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date IN (
	SELECT hire_date 
	FROM employees
	WHERE emp_no='101010');
	
SELECT * FROM employees
WHERE emp_no = '101010';

-- 2
SELECT title, COUNT(title) FROM titles
WHERE emp_no IN (
	SELECT emp_no 
	FROM employees
	WHERE first_name="AAmod")
	GROUP BY title;
	
-- 3
SELECT COUNT(emp_no) FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE NOT to_date = "9999-01-01"
	GROUP BY emp_no);
	
SELECT COUNT(*)
FROM employees
WHERE emp_no IN (
SELECT emp_no
FROM dept_emp
GROUP BY emp_no
HAVING MAX(to_date)<NOW());
	
-- 4
SELECT first_name, last_name FROM employees 
WHERE gender = "F" AND emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date="9999-01-01");
	
-- 5
SELECT AVG(salary) FROM salaries;

SELECT first_name, last_name, salary
FROM employees AS e

JOIN salaries AS s
ON s.emp_no = e.emp_no

WHERE to_date="9999-01-01" AND salary > (
	SELECT AVG(salary) 
	FROM salaries
	);
	
-- 6
SELECT MAX(salary) FROM salaries;

SELECT COUNT(*), COUNT(*)/(SELECT COUNT(*) * 100 WHERE to_date>NOW()) FROM salaries 

WHERE to_date="9999-01-01" AND salary > (
	SELECT MAX(salary) - STD(salary) 
	FROM salaries
	);
	
-- 
first_name, last_name, salary
FROM employees AS e

JOIN salaries AS s
ON s.emp_no = e.emp_no
--

-- Bonus 1
SELECT dept_name FROM departments AS d

WHERE to_date = "9999-01-01" AND emp_no IN (
	SELECT emp_no FROM employees 
	WHERE gender = "F")