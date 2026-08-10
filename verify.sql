-- Swiggy Capstone Database Verification

-- Restaurants: 15
SELECT COUNT(*) AS restaurant_count
FROM restaurants;

-- Customers: 50
SELECT COUNT(*) AS customer_count
FROM customers;

-- Orders: 420
SELECT COUNT(*) AS order_count
FROM orders;

-- Cuisine targets: 6
SELECT COUNT(*) AS cuisine_target_count
FROM cuisine_targets;

-- Order status breakdown
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY status;