-- ==========================================
-- Topic : Aggregate Functions
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE employee_management;

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM employee;

-- ==========================================
-- COUNT() Function
-- ==========================================

SELECT COUNT(*) AS Total_Employees
FROM employee;

-- ==========================================
-- SUM() Function
-- ==========================================

SELECT SUM(salary) AS Total_Salary
FROM employee;

-- ==========================================
-- AVG() Function
-- ==========================================

SELECT AVG(salary) AS Average_Salary
FROM employee;

-- ==========================================
-- MIN() Function
-- ==========================================

SELECT MIN(salary) AS Minimum_Salary
FROM employee;

-- ==========================================
-- MAX() Function
-- ==========================================

SELECT MAX(salary) AS Maximum_Salary
FROM employee;

-- ==========================================
-- COUNT() on Department Column
-- ==========================================

SELECT COUNT(department) AS Total_Departments
FROM employee;

-- ==========================================
-- Employee with Highest Salary
-- ==========================================

SELECT emp_name, salary
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
);

-- ==========================================
-- Employee with Lowest Salary
-- ==========================================

SELECT emp_name, salary
FROM employee
WHERE salary = (
    SELECT MIN(salary)
    FROM employee
);

-- ==========================================
-- Aggregate Functions Completed
-- ==========================================