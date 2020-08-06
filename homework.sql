-- #1) List all customers who live in Texas (Use JOINs).
SELECT customer.first_name, customer.last_name, address.district
FROM address 
JOIN customer 
ON address.address_id = customer.address_id
WHERE address.district = 'Texas';

-- #2) Get all payments above $6.99 with the Customer's Full Name.
SELECT payment.amount,  customer.first_name, customer.last_name
FROM payment
JOIN customer 
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99
ORDER BY payment.amount DESC;

-- #3) Show all customers names who have made payments over $175 (Use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id in (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

-- #4) List all customers that live in Nepal (Use the City Table)
SELECT cus.first_name, cus.last_name, cus.email, country.country
FROM customer AS cus
JOIN address as ad
ON cus.address_id = ad.address_id
JOIN city
ON ad.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country.country = 'Nepal';

-- #5) Which staff members had the most tranasctions?
SELECT first_name, last_name, s.staff_id, COUNT(payment_id) AS pi
FROM staff AS s
JOIN payment as pay
ON s.staff_id = pay.staff_id
GROUP BY s.staff_id;

-- #6) How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

-- #7) Show all customers who have made a single payment above $6.99. (Use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT DISTINCT(customer_id)
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
);

-- #8) How many free rentals did the store give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;