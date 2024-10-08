WITH RECURSIVE sales_hierarchy AS (
    SELECT employee_id, manager_id, employee_name, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.manager_id, e.employee_name, sh.level + 1
    FROM employees e
    JOIN sales_hierarchy sh ON e.manager_id = sh.employee_id
)
SELECT employee_name, level
FROM sales_hierarchy
ORDER BY level;
