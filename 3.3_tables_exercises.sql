-- use employyes database
use employees;

-- list all tables in the daabase
show tables;

-- what are different data types present on this table?
DESCRIBE employees;
-- int, date, carchar, enum

-- which table(s) do you think contain a numeric type column?
-- emp_no

-- contain a string type column?
-- first_name, last_name, gender

-- contain a data type column?
-- birth_date, hire_date

-- what is relationship between employees and departments? 
-- the employees and departments tables create the table dept_emp

-- show the SQL that created the dept_manager table
SHOW CREATE TABLE dept_manager;