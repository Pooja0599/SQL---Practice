-- ==========================================
-- Project : Employee Management System
-- ==========================================

-- Create Database
CREATE DATABASE employee_management;

USE employee_management;

-- ==========================================
-- Create Employee Table
-- ==========================================

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    age INT
);

-- ==========================================
-- Insert Records
-- ==========================================

INSERT INTO employee VALUES
(101,'Rahul','HR','Delhi',60000,25),
(102,'Aman','IT','Mumbai',70000,28),
(103,'Neha','IT','Indore',65000,27),
(104,'Priya','Sales','Pune',45000,24),
(105,'Rohit','Finance','Delhi',55000,30),
(106,'Sneha','HR','Bhopal',48000,26),
(107,'Ankit','IT','Noida',72000,29),
(108,'Kajal','Marketing','Jaipur',52000,27);

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM employee;

-- ==========================================
-- Arithmetic Operators
-- ==========================================

SELECT emp_name, salary, salary + 5000 AS Increased_Salary
FROM employee;

SELECT emp_name, salary, salary * 12 AS Annual_Salary
FROM employee;

-- ==========================================
-- Comparison Operators
-- ==========================================

SELECT * FROM employee
WHERE salary > 60000;

SELECT * FROM employee
WHERE age <= 26;

SELECT * FROM employee
WHERE department != 'HR';

-- ==========================================
-- Logical Operators
-- ==========================================

SELECT * FROM employee
WHERE department = 'IT'
AND salary > 65000;

SELECT * FROM employee
WHERE city = 'Delhi'
OR city = 'Mumbai';

SELECT * FROM employee
WHERE NOT department = 'Sales';

-- ==========================================
-- IN Operator
-- ==========================================

SELECT * FROM employee
WHERE department IN ('HR','IT');

-- ==========================================
-- BETWEEN Operator
-- ==========================================

SELECT * FROM employee
WHERE salary BETWEEN 50000 AND 70000;

-- ==========================================
-- LIKE Operator
-- ==========================================

SELECT * FROM employee
WHERE emp_name LIKE 'A%';

SELECT * FROM employee
WHERE city LIKE '%i';

-- ==========================================
-- IS NULL Operator
-- ==========================================

SELECT * FROM employee
WHERE city IS NULL;

SELECT * FROM employee
WHERE city IS NOT NULL;

-- ==========================================
-- End of Mini Project
-- ==========================================