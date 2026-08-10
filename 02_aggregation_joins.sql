

SELECT
    r.cuisine,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders AS o
INNER JOIN restaurants AS r
    ON o.restaurant_id = r.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.cuisine
HAVING total_revenue > 40000
ORDER BY total_revenue DESC;


SELECT
    r.restaurant_id,
    r.name,
    r.cuisine,
    COUNT(o.order_id) AS order_count
FROM restaurants AS r
LEFT JOIN orders AS o
    ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.name, r.cuisine
ORDER BY order_count ASC;