# SuperStore Project


# Data Cleaning

# Call Stored Procedure
CALL clean_data();

# -----------------------------------------------------------------------------------------------------

# Descriptive Statistics

-- What is the date range on this dataset?
SELECT DISTINCT
    YEAR(order_date) AS year
FROM
    sample_superstore
ORDER BY 1 ASC;
-- Results: 2014 - 2017


# ------------------------------------------------------------------------------------------------------

# Exploratory Data Analysis

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


-- 5. What is the profit margin for each city?
SELECT
    YEAR(order_date) AS year,
    country,
    state,
    city,
    ROUND(SUM(profit) / SUM(sales), 3) AS profit_margin
FROM
    sample_superstore
GROUP BY 1, 2, 3, 4
ORDER BY 1 ASC;



-- 6. What is the monthly gross margin percentage in 2016 for each category?
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



-- 7. Which customers made at least 5 orders during 2015 and 2016?
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



-- 8. Which customers made a second order within 7 days of their previous order during the second quarter of 2017?
WITH q2_2017_data AS
            (SELECT
                 *
             FROM
                 sample_superstore
             WHERE
                   YEAR(order_date) = 2017
               AND QUARTER(order_date) = 02)
SELECT DISTINCT
    t1.customer_id
FROM
    q2_2017_data t1
    JOIN q2_2017_data t2
    ON t2.order_id <> t1.order_id
    AND t2.customer_id = t1.customer_id
WHERE
    DATEDIFF(t2.order_date, t1.order_date) BETWEEN 0 AND 7;



-- 9. Summarize the total amount of customers and transactions that are at least $250 that occurred each month during 2016.
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
    HAVING ROUND(SUM(sales), 2) >= 250
    ORDER BY 1 ASC, 2 ASC, 3 ASC) t
GROUP BY 1;



-- 10. Customer Segmentation: Which customers purchased the same items within the sub-category (chairs) in 2016?
SELECT DISTINCT
    a.customer_id,
    a.customer_name,
    b.product_name,
    b.total_customers
FROM
    (SELECT
        product_id,
        product_name,
        customer_id,
        customer_name
    FROM
        sample_superstore
    WHERE
          sub_category = 'Chairs') a
JOIN
    (SELECT
        product_id,
        product_name,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM
        sample_superstore
    WHERE
          sub_category = 'Chairs'
    GROUP BY 1) b
    ON b.product_id = a.product_id
ORDER BY 4 DESC, 3 DESC;