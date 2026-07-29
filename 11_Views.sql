-- ==========================================
-- Topic : Views
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE company_db;

-- ==========================================
-- Display Employee Table
-- ==========================================

SELECT * FROM employee;

-- ==========================================
-- 1. Create a Simple View
-- ==========================================

CREATE VIEW employee_basic_info AS
SELECT
    emp_id,
    emp_name,
    department,
    salary
FROM employee;

-- Display View
SELECT * FROM employee_basic_info;

-- ==========================================
-- 2. View with WHERE Clause
-- ==========================================

CREATE VIEW it_employees AS
SELECT
    emp_id,
    emp_name,
    department,
    salary
FROM employee
WHERE department = 'IT';

SELECT * FROM it_employees;

-- ==========================================
-- 3. View with Salary Condition
-- ==========================================

CREATE VIEW high_salary_employees AS
SELECT
    emp_id,
    emp_name,
    salary
FROM employee
WHERE salary >= 60000;

SELECT * FROM high_salary_employees;

-- ==========================================
-- 4. View Using JOIN
-- ==========================================

CREATE VIEW employee_department_details AS
SELECT
    emp_id,
    emp_name,
    department,
    city,
    salary
FROM employee;

SELECT * FROM employee_department_details;

-- ==========================================
-- 5. Update Data Using View
-- ==========================================

UPDATE employee_basic_info
SET salary = salary + 2000
WHERE emp_id = 101;

SELECT * FROM employee_basic_info;

-- ==========================================
-- 6. Replace Existing View
-- ==========================================

CREATE OR REPLACE VIEW employee_basic_info AS
SELECT
    emp_id,
    emp_name,
    department,
    salary,
    city
FROM employee;

SELECT * FROM employee_basic_info;

-- ==========================================
-- 7. Show All Views
-- ==========================================

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

-- ==========================================
-- 8. View Definition
-- ==========================================

SHOW CREATE VIEW employee_basic_info;

-- ==========================================
-- 9. Drop a View
-- ==========================================

DROP VIEW high_salary_employees;

-- Verify Remaining Views
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

-- ==========================================
-- 10. Employees from Delhi View
-- ==========================================

CREATE VIEW delhi_employees AS
SELECT
    emp_id,
    emp_name,
    department,
    city
FROM employee
WHERE city = 'Delhi';

SELECT * FROM delhi_employees;

-- ==========================================
-- Views Completed
-- ==========================================