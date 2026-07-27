-- ==========================================
-- Topic : JOINS
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE joins_practice;

USE joins_practice;

-- ==========================================
-- Create Customers Table
-- ==========================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

-- ==========================================
-- Create Orders Table
-- ==========================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    amount INT
);

-- ==========================================
-- Insert Data into Customers
-- ==========================================

INSERT INTO customers VALUES
(101,'Rahul','Delhi'),
(102,'Aman','Mumbai'),
(103,'Neha','Indore'),
(104,'Priya','Pune'),
(105,'Rohan','Bhopal');

-- ==========================================
-- Insert Data into Orders
-- ==========================================

INSERT INTO orders VALUES
(1,101,'Laptop',60000),
(2,102,'Mobile',25000),
(3,101,'Keyboard',1500),
(4,103,'Mouse',800),
(5,106,'Monitor',12000);

-- ==========================================
-- Display Tables
-- ==========================================

SELECT * FROM customers;

SELECT * FROM orders;

-- ==========================================
-- INNER JOIN
-- Shows only matching records
-- ==========================================

SELECT
c.customer_id,
c.customer_name,
o.product_name,
o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================
-- LEFT JOIN
-- Shows all customers
-- ==========================================

SELECT
c.customer_id,
c.customer_name,
o.product_name,
o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================
-- RIGHT JOIN
-- Shows all orders
-- ==========================================

SELECT
c.customer_id,
c.customer_name,
o.product_name,
o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================
-- FULL JOIN (MySQL Method)
-- ==========================================

SELECT
c.customer_id,
c.customer_name,
o.product_name,
o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT
c.customer_id,
c.customer_name,
o.product_name,
o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- ==========================================
-- CROSS JOIN
-- ==========================================

SELECT
c.customer_name,
o.product_name
FROM customers c
CROSS JOIN orders o;

-- ==========================================
-- SELF JOIN
-- ==========================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1,'Rahul',NULL),
(2,'Aman',1),
(3,'Neha',1),
(4,'Priya',2);

SELECT
e1.emp_name AS Employee,
e2.emp_name AS Manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id;

-- ==========================================
-- Interview Practice Queries
-- ==========================================

-- Customer Name with Product
SELECT
c.customer_name,
o.product_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Customers without Orders
SELECT
c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Total Order Amount per Customer
SELECT
c.customer_name,
SUM(o.amount) AS Total_Amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- ==========================================
-- JOINS Completed
-- ==========================================