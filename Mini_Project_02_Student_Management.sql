-- ==========================================
-- Project : Student Management System
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE student_management;

USE student_management;

-- ==========================================
-- Create Table
-- ==========================================

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(30),
    city VARCHAR(30),
    marks INT,
    age INT
);

-- ==========================================
-- Insert Records
-- ==========================================

INSERT INTO student VALUES
(101,'Aman','BCA','Delhi',82,20),
(102,'Neha','BBA','Indore',91,21),
(103,'Rahul','B.Com','Mumbai',76,22),
(104,'Priya','MBA','Pune',88,23),
(105,'Rohit','BCA','Delhi',69,20),
(106,'Sneha','MBA','Bhopal',95,24),
(107,'Ankit','BBA','Jaipur',72,21),
(108,'Kajal','BCA','Noida',84,22);

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM student;

-- ==========================================
-- Comparison Operators
-- ==========================================

SELECT * FROM student
WHERE marks > 80;

SELECT * FROM student
WHERE age <= 21;

-- ==========================================
-- Logical Operators
-- ==========================================

SELECT * FROM student
WHERE city = 'Delhi'
AND marks > 70;

SELECT * FROM student
WHERE course = 'MBA'
OR course = 'BCA';

SELECT * FROM student
WHERE NOT city = 'Mumbai';

-- ==========================================
-- IN Operator
-- ==========================================

SELECT * FROM student
WHERE city IN ('Delhi','Indore');

-- ==========================================
-- BETWEEN Operator
-- ==========================================

SELECT * FROM student
WHERE marks BETWEEN 75 AND 90;

-- ==========================================
-- LIKE Operator
-- ==========================================

SELECT * FROM student
WHERE student_name LIKE 'A%';

SELECT * FROM student
WHERE city LIKE '%a';

-- ==========================================
-- Aggregate Functions
-- ==========================================

SELECT COUNT(*) AS Total_Students
FROM student;

SELECT SUM(marks) AS Total_Marks
FROM student;

SELECT AVG(marks) AS Average_Marks
FROM student;

SELECT MAX(marks) AS Highest_Marks
FROM student;

SELECT MIN(marks) AS Lowest_Marks
FROM student;

-- ==========================================
-- Student with Highest Marks
-- ==========================================

SELECT student_name, marks
FROM student
WHERE marks = (
    SELECT MAX(marks)
    FROM student
);

-- ==========================================
-- Student with Lowest Marks
-- ==========================================

SELECT student_name, marks
FROM student
WHERE marks = (
    SELECT MIN(marks)
    FROM student
);

-- ==========================================
-- End of Mini Project
-- ==========================================