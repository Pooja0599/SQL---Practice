-- ==========================================
-- WINDOW FUNCTIONS IN SQL
-- ==========================================
-- Window Functions perform calculations
-- across a set of rows without collapsing
-- the result like GROUP BY.

CREATE DATABASE IF NOT EXISTS company_db;

USE company_db;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    age INT,
    city VARCHAR(30)
);

INSERT INTO employee
VALUES
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

-- ==========================================================================

-- OVER()
-- It creates a window over rows
-- without grouping them.


-- Query-1
SELECT
emp_name,
salary,
AVG(salary) OVER() AS Average_Salary
FROM employee;


-- Query-2
SELECT
emp_name,
salary,
SUM(salary) OVER() AS Total_Salary
FROM employee;

-- ==========================================================================

-- ROW_NUMBER()
-- Assigns a unique row number.


-- Query-3
SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER(
ORDER BY salary DESC
) AS Row_No
FROM employee;


-- Query-4 
SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER(
PARTITION BY department
ORDER BY salary DESC
) AS Dept_Row_Number
FROM employee;


-- Practice :- 

-- 1. Display employee name with average salary.
SELECT 
emp_name,
AVG(Salary) OVER() AS Average_Salary
FROM Employee;


-- 2. Display employee name with total salary.
SELECT
emp_name,
SUM(Salary) OVER() AS Total_Salary
FROM Employee;


-- 3. Assign row numbers based on salary.
SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Row_No
FROM Employee;


-- 4. Assign row numbers department-wise.
SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY Salary DESC
) AS Dept_Row_Number
FROM Employee;


-- ==========================================
-- RANK()
-- Assigns rank to rows.
-- Duplicate values get same rank.
-- Next rank is skipped.
-- ==========================================

-- Query-5
SELECT
emp_name,
department,
salary,
RANK() OVER(
ORDER BY salary DESC
) AS Salary_Rank
FROM employee;


-- Query-6
SELECT
emp_name,
department,
salary,
RANK() OVER(
PARTITION BY department
ORDER BY salary DESC
) AS Department_Rank
FROM employee;


-- ==========================================
-- DENSE_RANK()
-- Duplicate values get same rank.
-- No rank is skipped.
-- ==========================================


-- Query-7
SELECT
emp_name,
salary,
DENSE_RANK() OVER(
ORDER BY salary DESC
) AS Dense_Rank
FROM employee;


-- Query-8
SELECT
emp_name,
department,
salary,
DENSE_RANK() OVER(
PARTITION BY department
ORDER BY salary DESC
) AS Department_Dense_Rank
FROM employee;



-- ==========================================
-- NTILE()
-- Divides rows into equal groups.
-- ==========================================

-- Query-9
SELECT
emp_name,
salary,
NTILE(4) OVER(
ORDER BY salary DESC
) AS Salary_Group
FROM employee;



-- ==========================================
-- LAG()
-- Previous row value
-- ==========================================

-- Query-10
SELECT
emp_name,
salary,
LAG(salary) OVER(
ORDER BY salary
) AS Previous_Salary
FROM employee;



-- ==========================================
-- LEAD()
-- Next row value
-- ==========================================

-- Query-11
SELECT
emp_name,
salary,
LEAD(salary) OVER(
ORDER BY salary
) AS Next_Salary
FROM employee;



-- ==========================================
-- FIRST_VALUE()
-- First value in window
-- ==========================================

-- Query-12
SELECT
emp_name,
salary,
FIRST_VALUE(emp_name)
OVER(
ORDER BY salary DESC
) AS Highest_Paid
FROM employee;


-- ==========================================
-- Practice Questions
-- ==========================================

-- 1. Display employee name with average salary.
SELECT
emp_name,
AVG(Salary) OVER() AS Average_Salary
FROM Employee;


-- 2. Display employee name with total salary.
SELECT
emp_name,
SUM(Salary) OVER() AS Sum_Salary
FROM Employee;


-- 3. Assign row numbers based on salary.
SELECT
emp_name,
salary,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS ROW_NUMBER
FROM Employee;


-- 4. Assign row numbers department-wise.
SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY Salary DESC
) AS Department_Row_Number
FROM Employee;


-- 5. Find highest salary employee using ROW_NUMBER().
WITH SalaryRank AS
(
SELECT
emp_name,
department,
salary,
ROW_NUMBER() OVER(
ORDER BY salary DESC
) AS rn
FROM employee
)
SELECT *
FROM SalaryRank
WHERE rn = 1;


-- 6. Rank employees by salary.
SELECT
emp_name,
salary,
RANK() OVER(
ORDER BY salary DESC
) AS Salary_Rank
FROM employee;


-- 7. Rank employees department-wise.
SELECT
emp_name,
department,
salary,
RANK() OVER(
PARTITION BY department
ORDER BY salary DESC
) AS Department_Rank
FROM employee;


-- 8. Dense rank employees by salary.
SELECT
emp_name,
salary,
DENSE_RANK() OVER(
ORDER BY salary DESC
) AS Dense_Rank
FROM employee;


-- 9. Divide employees into 3 salary groups.
SELECT
emp_name,
salary,
NTILE(3) OVER(
ORDER BY salary DESC
) AS Salary_Group
FROM employee;


-- 10. Show previous salary using LAG().
SELECT
emp_name,
salary,
LAG(salary) OVER(
ORDER BY salary
) AS Previous_Salary
FROM employee;


-- 11. Show next salary using LEAD().
SELECT
emp_name,
salary,
LEAD(salary) OVER(
ORDER BY salary
) AS Next_Salary
FROM employee;


-- 12. Display highest paid employee using FIRST_VALUE().
SELECT
emp_name,
salary,
FIRST_VALUE(emp_name)
OVER(
ORDER BY salary DESC
) AS Highest_Paid_Employee
FROM employee;


-- 13. Display lowest paid employee using LAST_VALUE().
SELECT
emp_name,
salary,
LAST_VALUE(emp_name)
OVER(
ORDER BY salary
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
) AS Lowest_Paid_Employee
FROM employee;