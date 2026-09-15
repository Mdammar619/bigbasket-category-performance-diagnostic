-- BigBasket Capstone
-- 01 Foundations SQL

-- 1. WHERE
-- Find orders from customers in Mumbai
SELECT *
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.city = 'Mumbai';


-- 2. DISTINCT
-- Display all unique product categories
SELECT DISTINCT category
FROM products
ORDER BY category;


-- 3. ORDER BY + LIMIT
-- Display the 5 highest-value orders
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;


-- 4. AS (Alias)
-- Count the total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;


-- 5. IN
-- Find orders paid using UPI or Credit Card
SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Credit Card');


-- 6. BETWEEN
-- Find orders with amount between ₹100 and ₹500
SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;


-- 7. NOT BETWEEN
-- Find orders with amount outside ₹100 to ₹500
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;


-- 8. IS NULL
-- Find orders where rating is missing
SELECT *
FROM orders
WHERE rating IS NULL;