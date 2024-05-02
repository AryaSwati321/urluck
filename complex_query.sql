-- Perform implementation of Complex queries and set operators in SQL queries on online store database.

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    country VARCHAR(10)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES (1, 'Vaishnavi', 'USA');
INSERT INTO Customers VALUES (2, 'Vaibhav', 'India');
INSERT INTO Customers VALUES (3, 'Om', 'USA');
INSERT INTO Customers VALUES (4, 'Samadhan', 'India');
INSERT INTO Customers VALUES (5, 'Prarthana', 'Australia');
INSERT INTO Orders VALUES (1, 1, '2023-05-15');
INSERT INTO Orders VALUES (2, 2, '2023-05-20');
INSERT INTO Orders VALUES (3, 3, '2023-05-25');
INSERT INTO Orders VALUES (4, 2, '2023-05-30');
INSERT INTO Orders VALUES (5, 4, '2023-06-01');

-- customers who have orders in the last 30 days
SELECT c.customer_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- total number of orders by each customer
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- customers not placed any orders
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- customers from either India or USA
SELECT customer_name
FROM Customers
WHERE country IN ('India', 'USA');

-- customers from India who have placed orders
SELECT c.customer_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.country = 'India';

-- customers from India who not placed any orders
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.country = 'India' AND o.order_id IS NULL;
