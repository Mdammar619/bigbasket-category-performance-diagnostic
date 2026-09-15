-- BigBasket Capstone - Database Verification

-- Check table row counts
SELECT COUNT(*) AS product_count
FROM products;

SELECT COUNT(*) AS customer_count
FROM customers;

SELECT COUNT(*) AS order_count
FROM orders;

SELECT COUNT(*) AS target_count
FROM category_targets;

-- Check order status counts
SELECT
    status,
    COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY status;