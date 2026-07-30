/*
==========================================================
                Common Table Expressions (CTE)
==========================================================

What is CTE?

A Common Table Expression (CTE) is a temporary result set
that exists only during the execution of a SQL query.

CTE improves:
1. Readability
2. Query Organization
3. Reusability
4. Complex Query Handling

Syntax:

WITH cte_name AS
(
    SELECT ...
)
SELECT * FROM cte_name;

==========================================================
*/

DROP DATABASE IF EXISTS CTE_Practice;

CREATE DATABASE CTE_Practice;

USE CTE_Practice;

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO employee
VALUES
(101,'Amit','HR',35000,'Delhi'),
(102,'Priya','IT',60000,'Mumbai'),
(103,'Rahul','Finance',45000,'Pune'),
(104,'Neha','IT',75000,'Delhi'),
(105,'Karan','Sales',30000,'Indore'),
(106,'Sneha','HR',40000,'Mumbai'),
(107,'Rohit','IT',80000,'Pune'),
(108,'Anjali','Finance',50000,'Delhi');


-- Display all IT employees using CTE


WITH IT_Employees AS
(
    SELECT *
    FROM employee
    WHERE department='IT'
)
SELECT *
FROM IT_Employees;


-- Example-2 Salary Greater Than 50000

WITH High_Salary AS
(
    SELECT *
    FROM employee
    WHERE salary > 50000
)
SELECT *
FROM High_Salary;


-- Example-3 Department Wise Average Salary

WITH Avg_Salary AS
(
    SELECT department,
           AVG(salary) AS average_salary
    FROM employee
    GROUP BY department
)
SELECT *
FROM Avg_Salary;


-- Example-4 Maximum Salary

WITH Max_Salary AS
(
    SELECT MAX(salary) AS highest_salary
    FROM employee
)
SELECT *
FROM Max_Salary;


-- Example-5 Employees Above Average Salary

WITH AvgSalary AS
(
    SELECT AVG(salary) AS avg_salary
    FROM employee
)
SELECT *
FROM employee
WHERE salary >
(
    SELECT avg_salary
    FROM AvgSalary
);


-- Example-6 Count Employees Department Wise

WITH Employee_Count AS
(
    SELECT department,
           COUNT(*) AS total_employee
    FROM employee
    GROUP BY department
)
SELECT *
FROM Employee_Count;


-- Example-7 Multiple CTE

WITH

HighSalary AS
(
    SELECT *
    FROM employee
    WHERE salary > 50000
),
DelhiEmployee AS
(
    SELECT *
    FROM employee
    WHERE city='Delhi'
)
SELECT *
FROM HighSalary
WHERE city='Delhi';


-- Show Complete Table :- 

SELECT * FROM employee;