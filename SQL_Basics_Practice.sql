-- ===================================================
-- SQL BASICS PRACTICE
-- Author : Pooja Singh
-- ===================================================

-- =====================================
-- DDL COMMANDS
-- =====================================

CREATE DATABASE company_db;

USE company_db;

SHOW DATABASES;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    age INT
);

DESC employee;

-- =====================================
-- DML COMMANDS
-- =====================================

INSERT INTO employee
VALUES
(101,'Rahul','HR','Delhi',50000,25),
(102,'Aman','IT','Mumbai',70000,28),
(103,'Neha','IT','Delhi',65000,27),
(104,'Priya','Sales','Pune',45000,24),
(105,'Rohit','HR','Delhi',55000,30);


UPDATE employee
SET salary = 60000
WHERE emp_id = 101;

UPDATE employee
SET city = 'Indore'
WHERE emp_id = 103;

DELETE FROM employee
WHERE emp_id = 105;


-- =====================================
-- SELECT COMMANDS
-- =====================================

SELECT * FROM employee;

SELECT emp_name, salary
FROM employee;

SELECT DISTINCT department
FROM employee;

SELECT DISTINCT city
FROM employee;


-- =====================================
-- WHERE CLAUSE
-- =====================================

SELECT *
FROM employee
WHERE department = 'IT';

SELECT *
FROM employee
WHERE salary > 50000;

SELECT *
FROM employee
WHERE city = 'Delhi';

SELECT *
FROM employee
WHERE salary BETWEEN 45000 AND 70000;

SELECT *
FROM employee
WHERE department IN ('HR','IT');

SELECT *
FROM employee
WHERE emp_name LIKE 'P%';


-- =====================================
-- AGGREGATE FUNCTIONS
-- =====================================

SELECT COUNT(*) FROM employee;

SELECT SUM(salary) FROM employee;

SELECT AVG(salary) FROM employee;

SELECT MAX(salary) FROM employee;

SELECT MIN(salary) FROM employee;


-- =====================================
-- GROUP BY
-- =====================================

SELECT department, COUNT(*)
FROM employee
GROUP BY department;

SELECT department, SUM(salary)
FROM employee
GROUP BY department;

SELECT department, AVG(salary)
FROM employee
GROUP BY department;

SELECT city, COUNT(*)
FROM employee
GROUP BY city;


-- =====================================
-- HAVING
-- =====================================

SELECT department, AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT city, COUNT(*)
FROM employee
GROUP BY city
HAVING COUNT(*) >= 2;