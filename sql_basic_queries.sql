USE sakila;

SHOW TABLES;
-- Retrieving the actor table
SELECT *
FROM sakila.actor;

-- Retrieving the film table
SELECT *
FROM sakila.film;

-- Retrieving the customer table
SELECT *
FROM sakila.customer;

-- Retrieving the titles from the film table
SELECT title
FROM sakila.film;

-- Retrieving the languages from the film table
SELECT name AS language
FROM language;

-- Retrieving the list of first names of all employees from the staff table
SELECT staff.first_name
FROM staff;

-- Unique release year
SELECT DISTINCT release_year AS release_date
FROM film;

-- 5. Counting records for database insights
-- 5.1 No. of stores that the company has 
SELECT 
    *
FROM
    store;

SELECT 
    COUNT(store_id)
FROM
    store;

-- 5.2 Number of employees that the company has
SELECT 
    COUNT(staff_id)
FROM
    staff;

-- 5.3 Films that are available for rent and how many have been rented
-- Films that are available for rent
SELECT 
    COUNT(DISTINCT f.film_id) AS available_films
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
WHERE
    r.return_date IS NOT NULL
        OR r.rental_id IS NULL;

-- Films that are currently rented
SELECT 
    COUNT(DISTINCT f.film_id) AS rented_film
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
WHERE
    r.return_date IS NULL;

-- 5.4 Determining the no. of distinct last names of the actors in the database
SELECT COUNT(DISTINCT last_name) AS unique_last_name
FROM actor;

-- 6. Retrieving the 10 longest films
SELECT 
    title, length
FROM
    film
ORDER BY length DESC
LIMIT 10;

-- 7. Filtering technique
  -- 7.1 Retrieving all actors with the first name 'SCARLET'
SELECT 
    first_name
FROM
    actor
WHERE
    first_name = 'SCARLET';
  
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 min.
SELECT 
    *
FROM
    film
WHERE
    title LIKE '%ARMAGEDDON%'
        AND length > 100
ORDER BY length DESC;
;

-- 7.3 Determine the number of films that include Behind the scenes content
SELECT 
    COUNT(*) AS films_with_behind_the_scene
FROM
    film
WHERE
    special_features LIKE '%Behind the Scenes%';