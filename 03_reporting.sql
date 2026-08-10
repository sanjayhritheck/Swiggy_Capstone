SELECT
    r.restaurant_id,
    r.name,
    SUM(o.amount_inr) AS total_revenue,
    CASE
        WHEN SUM(o.amount_inr) >= 50000 THEN 'High'
        WHEN SUM(o.amount_inr) >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM restaurants AS r
INNER JOIN orders AS o
    ON r.restaurant_id = o.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.restaurant_id, r.name
ORDER BY total_revenue DESC;

SELECT
    r.cuisine,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders AS o
INNER JOIN restaurants AS r
    ON o.restaurant_id = r.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.cuisine, month
ORDER BY r.cuisine, month;


SELECT
    r.cuisine,
    SUM(o.amount_inr) AS total_revenue,
    t.target_revenue_inr,
    (t.target_revenue_inr - SUM(o.amount_inr)) AS variance,
    ((SUM(o.amount_inr) - t.target_revenue_inr) * 100
        / t.target_revenue_inr) AS percentage_variance,
    CASE
        WHEN SUM(o.amount_inr) >= t.target_revenue_inr
            THEN 'Above Target'
        ELSE 'Below Target'
    END AS target_status
FROM orders AS o
INNER JOIN restaurants AS r
    ON o.restaurant_id = r.restaurant_id
INNER JOIN cuisine_targets AS t
    ON r.cuisine = t.cuisine
WHERE o.status = 'Delivered'
GROUP BY r.cuisine, t.target_revenue_inr
ORDER BY r.cuisine;