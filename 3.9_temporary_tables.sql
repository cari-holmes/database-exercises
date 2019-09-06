use bayes_818;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

SELECT * FROM employees_with_departments;

UPDATE employees_with_departments 
SET full_name = CONCAT(first_name, " ", last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;


CREATE TEMPORARY TABLE pay AS
SELECT * FROM sakila.payment;

SELECT * from pay;

ALTER TABLE pay ADD cent_amount INT UNSIGNED; 

UPDATE pay
SET cent_amount = pay.amount * 100; 

