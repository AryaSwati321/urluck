-- Perform implementation of Boolean operators and pattern matching in SQL
-- queries on E-commerce store database.

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price int,
    quantity INT
);

INSERT INTO Products VALUES (1, 'iPhone X', 82316, 10);
INSERT INTO Products VALUES (2, 'Samsung Galaxy S21', 65853, 15);
INSERT INTO Products VALUES (3, 'Google Pixel 5', 57621, 8);
INSERT INTO Products VALUES (4, 'OnePlus 9 Pro', 74084, 12);

-- Boolean Operators

SELECT * FROM Products WHERE price > 60000 AND quantity > 10;

SELECT * FROM Products WHERE price < 70000 OR quantity < 10;

SELECT * FROM Products WHERE NOT price > 65000;


-- Pattern Matching using wildcards

SELECT * FROM Products WHERE product_name LIKE '%iPhone%';
SELECT * FROM Products WHERE product_name LIKE '%_Phone%';

SELECT * FROM Products WHERE product_name LIKE 'S%';
SELECT * FROM Products WHERE product_name LIKE '%Pixel__';

-- IN
SELECT * FROM Products WHERE product_id IN (2, 3, 4);

-- NOT IN 
SELECT * FROM Products WHERE product_id NOT IN (1, 2);

-- IS NULL 
SELECT * FROM Products WHERE quantity IS NULL;

-- IS NOT NULL
SELECT * FROM Products WHERE quantity IS NOT NULL;
