-- BigBasket Capstone
-- 03 Reporting SQL


-- 1. Product Revenue Tier
-- High >= 3000
-- Medium >= 1000
-- Low < 1000

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        COALESCE(
            SUM(
                CASE
                    WHEN o.status = 'Delivered'
                    THEN o.amount_inr
                    ELSE 0
                END
            ),
            0
        ) AS total_revenue
    FROM products p
    LEFT JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
)

SELECT
    product_id,
    product_name,
    category,
    total_revenue,
    CASE
        WHEN total_revenue >= 3000 THEN 'High'
        WHEN total_revenue >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM product_revenue
ORDER BY total_revenue DESC;


-- 2. Monthly Category Revenue
-- Delivered orders only

SELECT
    p.category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY
    p.category,
    strftime('%Y-%m', o.order_date)
ORDER BY
    p.category,
    month;


-- 3. Category Revenue vs Target

WITH category_revenue AS (
    SELECT
        p.category,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
)

SELECT
    cr.category,
    ct.target_revenue_inr,
    cr.total_revenue,

    ct.target_revenue_inr - cr.total_revenue AS variance,

    ((cr.total_revenue - ct.target_revenue_inr) * 100.0)
        / ct.target_revenue_inr AS percentage_variance,

    CASE
        WHEN cr.total_revenue >= ct.target_revenue_inr
            THEN 'Above Target'

        WHEN ((ct.target_revenue_inr - cr.total_revenue) * 100.0)
             / ct.target_revenue_inr <= 15
            THEN 'Below Target - Watch'

        ELSE 'Below Target - Critical'
    END AS target_status

FROM category_revenue cr
JOIN category_targets ct
    ON cr.category = ct.category

ORDER BY cr.category;