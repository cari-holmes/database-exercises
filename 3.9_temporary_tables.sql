USE bayes_818;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT * FROM employees.employees;

SELECT * from employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

SELECT * FROM employees_with_departments;

UPDATE employees_with_departments 
SET full_name = CONCAT(first_name, " ", last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- 

CREATE TEMPORARY TABLE pay 
SELECT * FROM sakila.payment;

SELECT * from pay;

ALTER TABLE pay ADD amount 
UPDATE pay
SET amount = (amount * 100); 