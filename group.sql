-- Perform implementation of Group function in SQL queries on employee database.

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(20),
    department VARCHAR(20),
    salary int
);

INSERT INTO Employee VALUES (1, 'Tanavi', 'IT', 5000);
INSERT INTO Employee VALUES (2, 'Siddhant', 'HR', 5300);
INSERT INTO Employee VALUES (3, 'Shruti', 'Sales', 4500);
INSERT INTO Employee VALUES (4, 'Apeksha', 'IT', 5500);
INSERT INTO Employee VALUES (5, 'Yash', 'Communication', 5600);
INSERT INTO Employee VALUES (6, 'Sakshi', 'Finance', 7000);

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT department, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM Employee
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC
LIMIT 2;

SELECT SUM(salary) AS total_salary
FROM Employee;

