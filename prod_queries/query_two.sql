SELECT
    product_id,
    SUM(order_amount) AS total_sales,
    COUNT(order_id) AS total_orders,
    AVG(order_amount) AS average_order_amount,
    RANK() OVER (ORDER BY SUM(order_amount) DESC) AS sales_rank,
    ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY SUM(order_amount) DESC) AS category_rank
FROM orders
JOIN products ON orders.product_id = products.product_id
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY product_id, category_id
HAVING SUM(order_amount) > 5000
ORDER BY total_sales DESC;
