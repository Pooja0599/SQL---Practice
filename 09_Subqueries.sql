-- ==========================================
-- Topic : Subqueries
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE company_db;

-- ==========================================
-- Display Employee Table
-- ==========================================

SELECT * FROM employee;

-- ==========================================
-- 1. Employee with Maximum Salary
-- ==========================================

SELECT *
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
);

-- ==========================================
-- 2. Employee with Minimum Salary
-- ==========================================

SELECT *
FROM employee
WHERE salary = (
    SELECT MIN(salary)
    FROM employee
);

-- ==========================================
-- 3. Employees Earning More Than Average Salary
-- ==========================================

SELECT *
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);

-- ==========================================
-- 4. Employees Earning Less Than Average Salary
-- ==========================================

SELECT *
FROM employee
WHERE salary <
(
    SELECT AVG(salary)
    FROM employee
);

-- ==========================================
-- 5. IN Subquery
-- ==========================================

SELECT *
FROM employee
WHERE department IN
(
    SELECT department
    FROM employee
    WHERE city = 'Mumbai'
);

-- ==========================================
-- 6. NOT IN Subquery
-- ==========================================

SELECT *
FROM employee
WHERE department NOT IN
(
    SELECT department
    FROM employee
    WHERE city = 'Delhi'
);

-- ==========================================
-- 7. EXISTS Subquery
-- ==========================================

SELECT *
FROM employee e
WHERE EXISTS
(
    SELECT 1
    FROM employee
    WHERE salary > 65000
);

-- ==========================================
-- 8. Correlated Subquery
-- Employees earning more than
-- the average salary of their department
-- ==========================================

SELECT *
FROM employee e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.department = e2.department
);

-- ==========================================
-- 9. Nested Subquery
-- ==========================================

SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM employee
    )
);

-- ==========================================
-- 10. Department Having More Than One Employee
-- ==========================================

SELECT department
FROM employee
GROUP BY department
HAVING COUNT(*) >
(
    SELECT 1
);

-- ==========================================
-- 11. Highest Salary in IT Department
-- ==========================================

SELECT *
FROM employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM employee
    WHERE department = 'IT'
);

-- ==========================================
-- 12. Interview Practice
-- Employees Older Than Average Age
-- ==========================================

SELECT *
FROM employee
WHERE age >
(
    SELECT AVG(age)
    FROM employee
);

-- ==========================================
-- Subqueries Completed
-- ==========================================