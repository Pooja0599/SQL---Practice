-- ==========================================
-- SQL Transactions, TCL & DCL
-- ==========================================

-- Create Database

CREATE DATABASE IF NOT EXISTS company_db;

USE company_db;

-- Create Employee Table

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    age INT,
    city VARCHAR(30)
);


INSERT INTO employee VALUES
(101,'Rahul','IT',55000,24,'Delhi'),
(102,'Priya','HR',42000,28,'Mumbai'),
(103,'Amit','IT',60000,30,'Pune'),
(104,'Sneha','Finance',50000,27,'Delhi'),
(105,'Karan','HR',38000,23,'Jaipur'),
(106,'Neha','Finance',65000,31,'Mumbai'),
(107,'Vikas','IT',70000,35,'Pune'),
(108,'Pooja','Sales',45000,26,'Delhi'),
(109,'Rohit','Sales',52000,29,'Ahmedabad'),
(110,'Anjali','HR',48000,32,'Surat');


SELECT * FROM employee;

-- START TRANSACTION 
START TRANSACTION;


-- UPDATE Record
UPDATE employee
SET salary = 60000
WHERE emp_id = 101;


-- Check Result
SELECT * FROM employee
WHERE emp_id = 101;


-- ROLLBACK
ROLLBACK;


-- Verify 
SELECT * FROM employee
WHERE emp_id = 101;


-- COMMIT Example 
START TRANSACTION;

UPDATE employee
SET salary = 62000
WHERE emp_id = 101;


-- Check :-
SELECT * FROM employee
WHERE emp_id = 101;

COMMIT;

-- Verify Again 
SELECT * FROM employee
WHERE emp_id = 101;


-- START TRANSACTION → Starts a transaction
-- ROLLBACK → Cancels all changes
-- COMMIT → Saves all changes permanently


-- SAVEPOINT :- 

-- Start Transaction 
START TRANSACTION;


-- Update Rahul Salary
UPDATE employee
SET salary = 65000
WHERE emp_id = 101;


-- Create SAVEPOINT
SAVEPOINT sp1;


-- Update Priya Salary
UPDATE employee
SET salary = 45000
WHERE emp_id = 102;


-- Check Data 
SELECT * FROM employee
WHERE emp_id IN (101,102);


-- Rollback to SAVEPOINT
ROLLBACK TO sp1;


-- Verify
SELECT * FROM employee
WHERE emp_id IN (101,102);


COMMIT;


-- Multiple SAVEPOINTS :-

START TRANSACTION; 

UPDATE employee
SET salary = 70000
WHERE emp_id = 103;

SAVEPOINT sp1;

UPDATE employee
SET salary = 55000
WHERE emp_id = 104;

SAVEPOINT sp2;

UPDATE employee
SET salary = 45000
WHERE emp_id = 105;

ROLLBACK TO sp2;

COMMIT;


-- SAVEPOINT creates a checkpoint inside a transaction.

-- ROLLBACK TO SAVEPOINT
-- returns the transaction to that checkpoint.

-- COMMIT permanently saves all changes.