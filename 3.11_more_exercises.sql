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

-- Bonus How many countries have a life expectancy less than Solomon Islands?
SELECT name, LifeExpectancy FROM country
WHERE name = "Solomon Islands";

SELECT COUNT(name) AS Less_LifeExpectancy FROM country
WHERE LifeExpectancy < 71.3
;

-- Bonus What state is city Tafuna located in?
SELECT district FROM city
WHERE name = "Tafuna";

-- Bonus What region of the world is city Tafuna located in?
SELECT region FROM country AS c

JOIN city 
ON city.countrycode=c.Code

WHERE c.code = "ASM" AND city.name = "Tafuna";

-- Bonus What country (use the human readable name) is city Merlo located in?
SELECT country.name FROM country

JOIN city
ON city.countrycode = country.code

WHERE country.code = "ARG" AND city.name = "Merlo";

-- Bonus What is the life expectancy in city Zwolle?
SELECT city.name, LifeExpectancy FROM country

JOIN city
ON city.countrycode = country.code

WHERE country.code = "NLD" AND city.name = "Zwolle";

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
SELECT country_id, country FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 6. List the last names of all the actors, as well as how many actors have taht last name.
SELECT last_name, COUNT(last_name) AS count FROM actor
GROUP BY last_name
ORDER BY count DESC;

-- 7. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors.
SELECT last_name, COUNT(last_name) AS count FROM actor 

GROUP BY last_name
ORDER BY count DESC;
-- ***

-- 8. You cannot locate the schema of the address table. Which query would you use to recreate it?


-- 9. Use JOIN to display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, a.address FROM staff AS s

JOIN address AS a USING(address_id);

-- 10. Use JOIN to display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, COUNT(r.staff_id) AS total_rung_up FROM staff

JOIN rental AS r USING(staff_id)
WHERE rental_date LIKE "%2005-%-08%" 
GROUP BY staff_id;

-- 11. List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id) AS num_of_actors FROM film
JOIN film_actor as fa USING (film_id)
GROUP BY title;

-- 12. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT title, COUNT(title) AS count FROM film
JOIN inventory USING (film_id)
WHERE film.title = "Hunchback Impossible"
GROUP BY title;

-- 13. The music Queen and Kris Kristofferson have seen an unlikely reasurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT title FROM film 
WHERE title LIKE 'k%' OR title LIKE 'q%' AND language_id IN (
	SELECT language_id FROM language
	WHERE name = "English");
	
-- 14. Use subqueries to display all actors who appear in the film Alone Trip.	
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor
	WHERE film_id IN (
		SELECT film_id FROM film
		WHERE title = "Alone Trip"
	));

-- 15. You want to run an email marketing campaign in Canada, for which you will need the names and email address of all Canadian customers. 
