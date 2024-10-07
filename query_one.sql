WITH recent_orders AS (
    SELECT order_id, customer_id, order_date
    FROM orders
    WHERE order_date > (SELECT MAX(order_date) - INTERVAL '1 month' FROM orders)
),
customer_total AS (
    SELECT customer_id, COUNT(order_id) AS total_orders, SUM(order_amount) AS total_spent
    FROM recent_orders
    GROUP BY customer_id
)
SELECT c.customer_name, c.customer_email, ct.total_orders, ct.total_spent
FROM customers c
JOIN customer_total ct ON c.customer_id = ct.customer_id
WHERE ct.total_spent > 1000
ORDER BY ct.total_spent DESC;
