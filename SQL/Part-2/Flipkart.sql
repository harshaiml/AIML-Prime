CREATE DATABASE IF NOT EXISTS flipkart;
USE flipkart;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Mumbai');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers;
SELECT * FROM orders;

-- Inner join
SELECT *
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_id, o.order_id, c.name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Left Join (Left outer join)
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Right Join
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Outer Join
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Cross Join
SELECT *
FROM customers
CROSS JOIN orders;

-- Self Join
SELECT *
FROM customers as A
JOIN customers as B
ON A.customer_id = B.customer_id;

-- Left Exclusive Join
SELECT *
FROM customers as A
LEFT JOIN orders as B
ON A.customer_id = B.customer_id
WHERE B.customer_id IS NULL;

-- Right Exclusive Join
SELECT *
FROM customers as A
RIGHT JOIN orders as B
ON A.customer_id = B.customer_id
WHERE A.customer_id IS NULL;

-- Sub-Queries
SELECT *
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);

-- Sub-Queries with SELECT
SELECT name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS order_count
FROM customers c;

-- Sub-Queries with FROM
SELECT 
	summary.customer_id,
    summary.avg_amount
FROM
    (
        SELECT
           customer_id,
           AVG(amount) as avg_amount
		FROM orders
        GROUP BY customer_id
    ) as summary;
    
-- Views in SQL
CREATE VIEW view1 AS
SELECT customer_id, name FROM customers;

SELECT * FROM view1;

SELECT * FROM view1 WHERE name = "Alice";

CREATE VIEW view2 AS
SELECT c.customer_id, c.name, o.order_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM view2;

DROP VIEW view1;