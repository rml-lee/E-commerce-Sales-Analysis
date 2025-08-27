# SuperStore Analysis


# -----------------------------------------------------------------------------------------------------------

-- Note: Because this dataset does not include unit cost or expense details,
-- the calculated 'Cost of Goods Sold' (COGS) used in this analysis is an approximation only.

# -----------------------------------------------------------------------------------------------------------



-- 1. What is the order volume from each region?
SELECT
    region,
    COUNT(*) AS total_orders
FROM
    sample_superstore
GROUP BY 1
ORDER BY 2 DESC;



-- 2. Which sub-categories are incurring a profit loss?
SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS profit_loss
FROM
    sample_superstore
GROUP BY 1
HAVING ROUND(SUM(profit), 2) < 0;



-- 3. Based on the results from question #2, what are the top 5 products from those sub-categories that are incurring a profit loss?
SELECT
    sub_category,
    product_id,
    product_name,
    profit_loss
FROM
    (SELECT
         sub_category,
         product_id,
         product_name,
         ROUND(SUM(profit), 2) AS profit_loss,
         DENSE_RANK() OVER (PARTITION BY sub_category ORDER BY SUM(profit) ASC) AS rnk
     FROM
         sample_superstore
     WHERE
         sub_category IN ('Bookcases', 'Tables', 'Supplies')
     GROUP BY 1, 2
     HAVING ROUND(SUM(profit), 2) < 0
     ORDER BY 1 ASC) t
WHERE
    rnk <= 5;



-- 4. What is the least commonly used shipping mode?
SELECT
    ship_mode
FROM
    sample_superstore
GROUP BY 1
ORDER BY COUNT(*) ASC
LIMIT 1;



-- 5. What is the monthly gross margin percentage in 2016 for each category?
SELECT
    MONTH(order_date) AS month,
    category,
    ROUND(((SUM(sales) - SUM(cogs)) / SUM(sales)) * 100, 0) AS gross_margin_percentage
FROM
    (SELECT
        *,
        ROUND(sales - profit, 2) AS cogs
    FROM
        sample_superstore
    WHERE
        YEAR(order_date) = 2016) t
GROUP BY 1, 2
ORDER BY 1 ASC;



-- 6. What is the profit margin for each state per year? Are any states incurring a profit loss?
SELECT
    YEAR(order_date) AS year,
    country,
    state,
    ROUND(SUM(profit) / SUM(sales), 3) AS profit_margin
FROM
    sample_superstore
GROUP BY 1, 2, 3
ORDER BY 1 ASC;



-- 6.2 Root Cause Analysis: Compare the average discount rate to profit margin in each state.
-- Do our promotion strategies contribute significantly to profit loss in these states?
SELECT
    YEAR(order_date) AS year,
    country,
    state,
    ROUND(SUM(profit) / SUM(sales), 3) AS profit_margin,
    ROUND((SUM(discount) / SUM(sales)) * 100, 2) AS avg_discount_rate_percent
FROM
    sample_superstore
GROUP BY 1, 2, 3
ORDER BY 1 ASC, 4 ASC;



-- 7. What is the correlation between profit and sales? Are we incurring a loss on our best-selling products?

    -- Data transformation won't be necessary to answer this question. We will use Tableau to display the results!



-- 8. Which customers made at least 5 orders during 2015 and 2016?
SELECT
    customer_id
FROM
    sample_superstore
WHERE
    YEAR(order_date) = 2015
AND customer_id IN
        (SELECT
            customer_id
        FROM
            sample_superstore
        WHERE
            YEAR(order_date) = 2016
        GROUP BY 1
        HAVING COUNT(*) >= 5)
GROUP BY 1
HAVING COUNT(*) >= 5;



-- 9. Which customers made a second order within 7 days of their previous order during the second quarter of 2017?
WITH q2_2017_data AS (
    SELECT
        *
    FROM
        sample_superstore
    WHERE
        YEAR(order_date) = 2017
    AND QUARTER(order_date) = 02
)

SELECT DISTINCT
    t1.customer_id
FROM
    q2_2017_data t1
    JOIN q2_2017_data t2
    ON t1.customer_id = t2.customer_id
    AND t1.order_id <> t2.order_id
WHERE
    ABS(DATEDIFF(t2.order_date, t1.order_date)) <= 7;



-- 10. Summarize the total amount of customers and transactions each month during 2016 that are at least $250.
SELECT
    month,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(order_id) AS total_transactions
FROM
    (SELECT
        MONTH(order_date) AS month,
        customer_id,
        order_id,
        ROUND(SUM(sales), 2) AS total_sales
    FROM
        sample_superstore
    WHERE
        YEAR(order_date) = 2016
    GROUP BY 1, 2, 3
    ORDER BY 1 ASC, 2 ASC, 3 ASC) t
WHERE
    total_sales >= 250
GROUP BY 1;



-- 11. Customer Segmentation: Which customers purchased the same items within the sub-category (chairs) in 2016?

WITH chair_products AS (
    -- Get all chair products with their customers in 2016
    SELECT
        product_id,
        product_name,
        customer_id,
        customer_name
    FROM
        sample_superstore
    WHERE
        sub_category = 'Chairs'
        AND YEAR(order_date) = 2016
),

product_popularity AS (
    -- Calculate how many customers bought each chair product
    SELECT
        product_id,
        product_name,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM
        chair_products
    GROUP BY 1, 2
)

-- Get the final result with customer details and product popularity
SELECT DISTINCT
    cp.customer_id,
    cp.customer_name,
    pp.product_name,
    pp.total_customers
FROM
    chair_products cp
    JOIN product_popularity pp
    ON cp.product_id = pp.product_id
ORDER BY 4 DESC;