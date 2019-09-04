USE employees;

SELECT * FROM employees;

-- Updated exercise 2
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;

-- Updated exercise 3
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name ASC, last_name ASC;

-- Updated exercise 4
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name ASC, first_name ASC;

-- Updated exercise 5
SELECT * FROM employees WHERE last_name LIKE 'e%' ORDER BY emp_no ASC;

-- Updated exercise 6
SELECT * FROM employees WHERE last_name LIKE 'e%' ORDER BY emp_no DESC;

-- Updated exercise 6
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name DESC, first_name DESC;

SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

SELECT * FROM employees WHERE birth_date LIKE '%-12-25';

SELECT * FROM employees WHERE last_name LIKE '%q%';

SELECT * FROM employees WHERE first_name = 'Irena' OR first_name='Vidya' OR first_name= 'Maya';

SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name='Vidya' OR first_name= 'Maya') AND gender='M';

SELECT * FROM employees WHERE last_name LIKE 'e%' OR last_name LIKE '%e';

SELECT * FROM employees WHERE last_name LIKE 'e%e';

-- Updated exercise 7
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01' AND birth_date LIKE '%-12-25' ORDER BY birth_date ASC, hire_date DESC;

SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

