-- ==========================================
-- Project : Library Management System
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE library_management;

USE library_management;

-- ==========================================
-- Create Table
-- ==========================================

CREATE TABLE library (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    author VARCHAR(50),
    category VARCHAR(30),
    price INT,
    available VARCHAR(10)
);

-- ==========================================
-- Insert Records
-- ==========================================

INSERT INTO library VALUES
(101,'Python Basics','Rahul Sharma','Programming',450,'Yes'),
(102,'SQL Master','Amit Verma','Database',550,'Yes'),
(103,'Data Analytics','Neha Gupta','Analytics',700,'No'),
(104,'Machine Learning','Rohit Singh','AI',900,'Yes'),
(105,'Power BI Guide','Priya Jain','BI',650,'No'),
(106,'Excel for Beginners','Karan Patel','Excel',400,'Yes'),
(107,'Statistics Made Easy','Sneha Kapoor','Statistics',500,'Yes'),
(108,'Deep Learning','Ankit Mehta','AI',950,'No');

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM library;

-- ==========================================
-- Comparison Operators
-- ==========================================

SELECT * FROM library
WHERE price > 600;

SELECT * FROM library
WHERE price <= 500;

-- ==========================================
-- Logical Operators
-- ==========================================

SELECT * FROM library
WHERE category = 'AI'
AND available = 'Yes';

SELECT * FROM library
WHERE category = 'Programming'
OR category = 'Database';

SELECT * FROM library
WHERE NOT available = 'No';

-- ==========================================
-- IN Operator
-- ==========================================

SELECT * FROM library
WHERE category IN ('AI','Analytics');

-- ==========================================
-- BETWEEN Operator
-- ==========================================

SELECT * FROM library
WHERE price BETWEEN 500 AND 800;

-- ==========================================
-- LIKE Operator
-- ==========================================

SELECT * FROM library
WHERE book_name LIKE 'P%';

SELECT * FROM library
WHERE author LIKE '%a';

-- ==========================================
-- Aggregate Functions
-- ==========================================

SELECT COUNT(*) AS Total_Books
FROM library;

SELECT SUM(price) AS Total_Price
FROM library;

SELECT AVG(price) AS Average_Price
FROM library;

SELECT MAX(price) AS Highest_Price
FROM library;

SELECT MIN(price) AS Lowest_Price
FROM library;

-- ==========================================
-- String Functions
-- ==========================================

SELECT UPPER(book_name) AS Book_Name
FROM library;

SELECT LOWER(author) AS Author_Name
FROM library;

SELECT CONCAT(book_name,' - ',author) AS Book_Details
FROM library;

SELECT book_name,
LENGTH(book_name) AS Name_Length
FROM library;

SELECT book_name,
SUBSTRING(book_name,1,5) AS Short_Name
FROM library;

SELECT book_name,
REPLACE(book_name,' ','_') AS Modified_Name
FROM library;

SELECT TRIM('   Library Project   ') AS Trimmed_Text;

SELECT book_name,
LEFT(book_name,4) AS Left_Text
FROM library;

SELECT book_name,
RIGHT(book_name,4) AS Right_Text
FROM library;

SELECT book_name,
REVERSE(book_name) AS Reverse_Name
FROM library;

-- ==========================================
-- Highest Price Book
-- ==========================================

SELECT book_name, price
FROM library
WHERE price = (
    SELECT MAX(price)
    FROM library
);

-- ==========================================
-- Lowest Price Book
-- ==========================================

SELECT book_name, price
FROM library
WHERE price = (
    SELECT MIN(price)
    FROM library
);

-- ==========================================
-- End of Mini Project
-- ==========================================