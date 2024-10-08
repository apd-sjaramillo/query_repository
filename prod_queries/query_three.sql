SELECT o.order_id, o.order_date, o.order_amount, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_id IN (
    SELECT order_id
    FROM order_items
    WHERE product_id IN (
        SELECT product_id
        FROM products
        WHERE category_id = (
            SELECT category_id FROM categories WHERE category_name = 'Electronics'
        )
    )
)
AND o.order_date > '2023-01-01'
ORDER BY o.order_date DESC;
