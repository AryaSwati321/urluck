-- Execute DDL/DML statements which demonstrate the use of views. 
-- Update the base table using its corresponding view. 
-- Also consider restrictions on updatable views and perform view creation from multiple tables.


-- Create first table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    account_number VARCHAR(20)
);

-- Create second table
CREATE TABLE Transactions (
    t_id INT PRIMARY KEY,
    account_number VARCHAR(20),
    t_type VARCHAR(20)
);

-- view from single table
CREATE VIEW v1 AS
SELECT customer_id, customer_name, account_number
FROM Customers;

--view from multiple tables with update restrictions
CREATE VIEW v2 AS
SELECT c.customer_id, c.customer_name, t.t_id
FROM Customers c, Transactions t
where c.account_number = t.account_number;

-- Updating view
UPDATE v1 SET customer_id = 100 WHERE customer_id = 82;

-- Some DDL/DML commands
INSERT INTO v1 (customer_id, customer_name) VALUES (82, 'Vaibhav');
ALTER VIEW v1 AS SELECT customer_id, customer_name from Customers;
DELETE FROM v1 WHERE customer_id = 100;
drop view v1;