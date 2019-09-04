USE employees;

-- LIMIT Exercises
SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01' AND birth_date LIKE '%-12-25' ORDER BY birth_date ASC, hire_date DESC LIMIT 5;

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01' AND birth_date LIKE '%-12-25' ORDER BY birth_date ASC, hire_date DESC LIMIT 5 OFFSET 45;

-- (Offset / limit) + 1 = page number, (45 / 5) + 1 = 10 given that we were told page 10, 10 -1 = 9 * 5(limit) = 45(offset)