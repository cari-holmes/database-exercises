-- Objective: Get extra practice with SQL by using newly learned skills

USE employees;

-- 1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager get paid less than the average salary?

-- Average salary for each department
SELECT d.dept_name AS department, AVG(s.salary) AS avg_salary
FROM dept_emp AS de

JOIN departments AS d
ON d.dept_no=de.dept_no

JOIN salaries AS s
ON s.emp_no=de.emp_no

WHERE de.to_date = "9999-01-01" AND s.to_date = "9999-01-01"
GROUP BY d.dept_no
ORDER BY dept_name;

-- Current managers salaries
SELECT CONCAT(e.first_name, " ", e.last_name) AS current_manager, d.dept_name AS dept_name, s.salary AS salary
FROM employees AS e

JOIN dept_manager AS dm
ON dm.emp_no=e.emp_no

JOIN departments AS d
ON d.dept_no=dm.dept_no

JOIN salaries AS s
ON s.emp_no=e.emp_no

WHERE s.to_date = "9999-01-01" AND dm.to_date = "9999-01-01"
ORDER BY dept_name;

USE world;

-- 1. What languages are spoken in Santa Monica?
SELECT language, percentage FROM countrylanguage AS cl

JOIN city
ON city.countrycode=cl.countrycode

WHERE city.id=4060
ORDER BY percentage ASC, language ASC;

-- 2. How many different countries are in each region?
SELECT region, COUNT(name) AS num_countries 
FROM country
GROUP BY region
ORDER BY num_countries ASC;

-- 3. What is the population for each region?
SELECT region, SUM(population) AS population FROM country
GROUP BY region
ORDER BY population DESC;

-- 4. What is the population for each continent?
SELECT continent, SUM(population) AS population 
FROM country
GROUP BY continent
ORDER BY population DESC;

-- 5. What is the average life expectancy globally?
SELECT AVG(LifeExpectancy) AS average_life_expectancy FROM country;

-- 6. What is the average life expectancy for each region, each continent? Sort the results from shortest too longest.

-- Average region life expectancy
SELECT region, AVG(LifeExpectancy) AS life_expectancy FROM country
GROUP BY region ASC
ORDER BY life_expectancy ASC;

-- Average continent life expectancy
SELECT continent, AVG(LifeExpectancy) AS life_expectancy FROM country
GROUP BY continent
ORDER BY life_expectancy ASC;

-- Bonus Find all the countries whose local name is different from the official name
SELECT name, LocalName FROM country
WHERE name != localname;

USE sakila;

-- 1. Display the first and last names in all lowercase of all the actors.
SELECT LOWER(first_name) AS first_name, LOWER(last_name) AS last_name FROM actor;

-- 2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe". What is one query you could use to obtain this information?
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = "Joe";

-- 3. Find all actors whose last name contains the letters "gen".
SELECT * FROM actor
WHERE last_name LIKE "%gen%";

-- 4. Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
SELECT * FROM actor
WHERE last_name LIKE "%li%"
ORDER BY last_name, first_name;

-- 5. Using IN, display the country_id and country colums for the following countries: Afghanistan, Bangladesh, and China.
