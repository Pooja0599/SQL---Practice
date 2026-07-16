-- ==========================================
-- Topic : SQL Operators
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE company_db;

-- ==========================================
-- Arithmetic Operators
-- ==========================================

SELECT 20 + 10 AS Addition;
SELECT 20 - 10 AS Subtraction;
SELECT 20 * 10 AS Multiplication;
SELECT 20 / 10 AS Division;
SELECT 20 % 3 AS Modulus;

SELECT emp_name, salary, salary + 5000 AS Increased_Salary
FROM employee;

SELECT emp_name, salary, salary - 3000 AS Reduced_Salary
FROM employee;

SELECT emp_name, salary, salary * 12 AS Annual_Salary
FROM employee;

-- ==========================================
-- Comparison Operators
-- ==========================================

SELECT * FROM employee
WHERE salary = 50000;

SELECT * FROM employee
WHERE salary != 50000;

SELECT * FROM employee
WHERE salary <> 50000;

SELECT * FROM employee
WHERE salary > 50000;

SELECT * FROM employee
WHERE salary < 50000;

SELECT * FROM employee
WHERE salary >= 60000;

SELECT * FROM employee
WHERE salary <= 45000;

-- ==========================================
-- Logical Operators
-- ==========================================

SELECT * FROM employee
WHERE department = 'IT'
AND salary > 50000;

SELECT * FROM employee
WHERE department = 'HR'
OR department = 'Finance';

SELECT * FROM employee
WHERE NOT department = 'Sales';

-- ==========================================
-- IN Operator
-- ==========================================

SELECT * FROM employee
WHERE department IN ('HR', 'IT', 'Finance');

SELECT * FROM employee
WHERE city IN ('Delhi', 'Mumbai');

-- ==========================================
-- BETWEEN Operator
-- ==========================================

SELECT * FROM employee
WHERE salary BETWEEN 40000 AND 70000;

SELECT * FROM employee
WHERE age BETWEEN 25 AND 35;

-- ==========================================
-- LIKE Operator
-- ==========================================

SELECT * FROM employee
WHERE emp_name LIKE 'A%';

SELECT * FROM employee
WHERE emp_name LIKE '%a';

SELECT * FROM employee
WHERE emp_name LIKE '%an%';

SELECT * FROM employee
WHERE emp_name LIKE 'S____';

SELECT * FROM employee
WHERE city LIKE 'D%';

-- ==========================================
-- IS NULL Operator
-- ==========================================

SELECT * FROM employee
WHERE city IS NULL;

SELECT * FROM employee
WHERE city IS NOT NULL;

-- ==========================================
-- End of SQL Operators
-- ==========================================