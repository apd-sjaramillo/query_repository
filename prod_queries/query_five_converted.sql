SELECT product_category, product_subcategory, region, 
    SUM(order_amount) AS total_sales, COUNT(order_id) AS total_orders
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY CUBE (product_category, product_subcategory, region)
HAVING SUM(order_amount) > 10000
ORDER BY product_category, product_subcategory, region;

# This is an automated update.
# This is an automated update.