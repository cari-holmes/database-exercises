USE employees;

SELECT CONCAT(first_name,' ', last_name) AS full_name FROM employees WHERE CONCAT(first_name,' ', last_name) LIKE 'e%e';

SELECT UPPER(CONCAT(first_name,' ', last_name)) AS full_name FROM employees WHERE CONCAT(first_name,' ', last_name) LIKE 'e%e';

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01' AND birth_date LIKE '%-12-25';

-- 
SELECT first_name, last_name, DATEDIFF(CUREDATE(), hire_date) AS days_with_company FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1990-12-31' AND birth_date LIKE '%-12-25';
-- 

SELECT MIN(salary) FROM salaries;
SELECT MAX(salary) FROM salaries;

SELECT LOWER(SUBSTR(CONCAT(first_name), 1, 1)) FROM employees;

SELECT LOWER(SUBSTR(CONCAT(last_name), 1, 4)) FROM employees;

SELECT LOWER(SUBSTR(CONCAT(birth_date), 6, 2)) FROM employees;

SELECT LOWER(SUBSTR(CONCAT(birth_date), 3, 2)) FROM employees;

SELECT LOWER(CONCAT(LEFT(first_name,1),LEFT(last_name,4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS user_name FROM employees;

SELECT
	LOWER(CONCAT(
			SUBSTR(first_name, 1, 1),
			SUBSTR(last_name, 1, 4),
			'_',
			SUBSTR(birth_date, 6, 2),
			SUBSTR(birth_date, 3, 2)
		)
	),
	first_name,
	last_name,
	birth_date

FROM employees;