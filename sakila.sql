SELECT customer.first_name as first_name, customer.last_name as last_name, customer.email, address.address 
FROM customer JOIN address ON customer.address_id = address.address_id WHERE address.city_id = 312;

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name as genre
FROM category LEFT JOIN film_category ON category.category_id = film_category.category_id
LEFT JOIN film ON film_category.film_id = film.film_id WHERE category.name = "Comedy";

SELECT actor.actor_id, CONCAT(actor.first_name, " ", actor.last_name) AS full_name, film.film_id, film.title, film.description, film.release_year
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5;

SELECT store.store_id, city.city_id, customer.first_name, customer.last_name, customer.email, address.address
FROM store
JOIN customer ON store.store_id = customer.store_id
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE store.store_id = 1 AND (city.city_id = 1 OR city.city_id = 42 OR city.city_id = 312 OR city.city_id = 459)
ORDER BY city.city_id ASC;

SELECT film.title, film.description, film.release_year, film.rating, film.special_features FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.rating = "G" and (film.special_features LIKE  '%behind the scenes%' and actor.actor_id = 15);

SELECT film.film_id, film.title, actor.actor_id, CONCAT(actor.first_name, " ", actor.last_name) AS actor_name FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id = 369
ORDER BY actor.actor_id;

SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name, film.rental_rate FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE film.rental_rate = 2.99 and category.name = "Drama";

SELECT actor.actor_id, CONCAT(actor.first_name, " ", actor.last_name) AS naming, film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE actor.first_name = "SANDRA" and actor.last_name = "KILMER" and category.name = "Action";