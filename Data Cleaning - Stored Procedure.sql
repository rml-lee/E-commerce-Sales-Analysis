DELIMITER $$
CREATE PROCEDURE clean_data()
BEGIN

-- Convert Profit, Discount, and Sales to float data type.
ALTER TABLE sample_superstore
MODIFY COLUMN profit float;

ALTER TABLE sample_superstore
MODIFY COLUMN discount float;

ALTER TABLE sample_superstore
MODIFY COLUMN sales float;


-- Convert Quantity to int data type
ALTER TABLE sample_superstore
MODIFY COLUMN quantity int;


-- Convert order_date and ship_date columns from '%m/%d/%Y' to '%Y-%m-%d'
UPDATE sample_superstore
SET
    order_date = CASE
                    WHEN order_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m-%d')
                    ELSE order_date
                END,
    ship_date = CASE
                    WHEN ship_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(ship_date, '%m/%d/%Y'), '%Y-%m-%d')
                    ELSE ship_date
                END;


-- Convert order_date and ship_date columns from TEXT to DATE format.
ALTER TABLE sample_superstore
MODIFY COLUMN order_date date;

ALTER TABLE sample_superstore
MODIFY COLUMN ship_date date;


-- For simplicity, we're going to ROUND the profit and sales columns by 2 decimal points
UPDATE sample_superstore
SET
    sales = ROUND(sales, 2),
    profit = ROUND(profit, 2);


-- Fix customer name with a junk character
UPDATE sample_superstore
SET
    customer_name = INSERT(REGEXP_REPLACE(customer_name, '[^a-zA-Z]', ' '), 7, 1, 'a')
WHERE
    customer_name = 'Anna H�berlin';


-- Removing junk characters from product_name column
UPDATE sample_superstore
SET
    product_name = REPLACE(product_name, '�', ' ')
WHERE
    product_name LIKE '%�%';




END $$
DELIMITER ;

