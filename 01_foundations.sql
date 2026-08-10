SELECT *
FROM restaurants
WHERE city = 'Mumbai';


SELECT DISTINCT cuisine
FROM restaurants;
 

SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;


SELECT *
FROM restaurants
WHERE name LIKE '%Spice%';

SELECT *
FROM customers
WHERE city IN ('Mumbai', 'Delhi');

SELECT *
FROM orders
WHERE amount_inr BETWEEN 500 AND 1000;

SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 500 AND 1000;


SELECT *
FROM orders
WHERE rating IS NULL;