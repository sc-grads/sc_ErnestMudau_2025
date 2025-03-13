

-- COUNT: Get the total number of orders
SELECT COUNT(*) AS total_orders FROM orders;

-- MAX: Get the highest order amount
SELECT MAX(amount) AS max_amount FROM orders;

-- MIN: Get the lowest order amount
SELECT MIN(amount) AS min_amount FROM orders;

-- AVG: Get the average order amount
SELECT AVG(amount) AS avg_amount FROM orders;

-- SUM: Get the total amount of all orders
SELECT SUM(amount) AS total_amount FROM orders;
