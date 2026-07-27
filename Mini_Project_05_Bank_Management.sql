-- ==========================================
-- Project : Bank Management System
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE bank_management;

USE bank_management;

-- ==========================================
-- Customers Table
-- ==========================================

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO customers VALUES
(101,'Rahul','Delhi'),
(102,'Aman','Mumbai'),
(103,'Neha','Indore'),
(104,'Priya','Pune'),
(105,'Rohan','Bhopal');

-- ==========================================
-- Accounts Table
-- ==========================================

CREATE TABLE accounts(
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2)
);

INSERT INTO accounts VALUES
(1001,101,'Savings',55000),
(1002,102,'Current',120000),
(1003,103,'Savings',78000),
(1004,104,'Savings',35000),
(1005,105,'Current',90000);

-- ==========================================
-- Transactions Table
-- ==========================================

CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO transactions VALUES
(1,1001,'Deposit',10000),
(2,1001,'Withdraw',5000),
(3,1002,'Deposit',30000),
(4,1003,'Withdraw',8000),
(5,1004,'Deposit',7000),
(6,1005,'Deposit',12000);

-- ==========================================
-- Display Tables
-- ==========================================

SELECT * FROM customers;

SELECT * FROM accounts;

SELECT * FROM transactions;

-- ==========================================
-- INNER JOIN
-- Customer with Account Details
-- ==========================================

SELECT
c.customer_name,
a.account_type,
a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;

-- ==========================================
-- INNER JOIN
-- Customer with Transactions
-- ==========================================

SELECT
c.customer_name,
t.transaction_type,
t.amount
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
INNER JOIN transactions t
ON a.account_id = t.account_id;

-- ==========================================
-- Customers Having Balance > 50000
-- ==========================================

SELECT
customer_id,
account_type,
balance
FROM accounts
WHERE balance > 50000;

-- ==========================================
-- Savings Accounts
-- ==========================================

SELECT *
FROM accounts
WHERE account_type='Savings';

-- ==========================================
-- ORDER BY Balance
-- ==========================================

SELECT *
FROM accounts
ORDER BY balance DESC;