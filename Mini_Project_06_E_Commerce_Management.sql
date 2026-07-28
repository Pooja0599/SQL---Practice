-- ==========================================
-- Project : E-Commerce Management System
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE ecommerce_management;

USE ecommerce_management;

-- ==========================================
-- Customers Table
-- ==========================================

CREATE TABLE customers (
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
-- Products Table
-- ==========================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(201,'Laptop','Electronics',65000),
(202,'Mobile','Electronics',25000),
(203,'Headphones','Accessories',3000),
(204,'Keyboard','Accessories',1500),
(205,'Monitor','Electronics',12000);

-- ==========================================
-- Orders Table
-- ==========================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO orders VALUES
(1,101,201,1),
(2,102,202,2),
(3,103,205,1),
(4,101,203,3),
(5,104,204,2),
(6,105,202,1);

-- ==========================================
-- Display Tables
-- ==========================================

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

-- ==========================================
-- INNER JOIN
-- Customer Order Details
-- ==========================================

SELECT
c.customer_name,
p.product_name,
o.quantity,
p.price
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON o.product_id = p.product_id;

-- ==========================================
-- LEFT JOIN
-- All Customers
-- ==========================================

SELECT
c.customer_name,
p.product_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN products p
ON o.product_id = p.product_id;

-- ==========================================
-- Total Amount Per Order
-- ==========================================

SELECT
o.order_id,
c.customer_name,
p.product_name,
o.quantity,
(p.price * o.quantity) AS Total_Amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id;

-- ==========================================
-- Total Sales by Product
-- ==========================================

SELECT
p.product_name,
SUM(o.quantity * p.price) AS Total_Sales
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Sales DESC;

-- ==========================================
-- Orders Greater Than 20000
-- ==========================================

SELECT
c.customer_name,
p.product_name,
(p.price * o.quantity) AS Order_Value
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN products p
ON o.product_id = p.product_id
WHERE (p.price * o.quantity) > 20000;

-- ==========================================
-- Category Wise Sales
-- ==========================================

SELECT
p.category,
SUM(o.quantity * p.price) AS Category_Sales
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category;

-- ==========================================
-- HAVING Clause
-- ==========================================

SELECT
p.category,
SUM(o.quantity * p.price) AS Total_Sales
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.quantity * p.price) > 30000;

-- ==========================================
-- CASE WHEN
-- ==========================================

SELECT
product_name,
price,
CASE
    WHEN price >= 50000 THEN 'Premium'
    WHEN price >= 10000 THEN 'Standard'
    ELSE 'Budget'
END AS Product_Category
FROM products;

-- ==========================================
-- Average Product Price
-- ==========================================

SELECT
AVG(price) AS Average_Product_Price
FROM products;

-- ==========================================
-- Highest Priced Product
-- ==========================================

SELECT *
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);

-- ==========================================
-- Project Completed
-- ==========================================