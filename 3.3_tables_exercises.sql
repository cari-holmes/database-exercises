-- use employyes database
use employees;

-- list all tables in the daabase
show tables;

-- what are different data types present on this table?
DESCRIBE employees;
-- int, date, carchar, enum

-- which table(s) do you think contain a numeric type column?
describe salaries;

-- contain a string type column?
describe titles;


-- contain a data type column?
describe departments;

-- what is relationship between employees and departments? 
-- the employees and departments tables create the table dept_emp, but no direct relationship

-- show the SQL that created the dept_manager table
SHOW CREATE TABLE dept_manager;