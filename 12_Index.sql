-- ==========================================
-- Topic : Index
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE company_db;

-- ==========================================
-- Display Employee Table
-- ==========================================

SELECT * FROM employee;

-- ==========================================
-- 1. Create an Index
-- ==========================================

CREATE INDEX idx_emp_name
ON employee(emp_name);

-- ==========================================
-- 2. Show Indexes
-- ==========================================

SHOW INDEX FROM employee;

-- ==========================================
-- 3. Create Index on Department
-- ==========================================

CREATE INDEX idx_department
ON employee(department);

SHOW INDEX FROM employee;

-- ==========================================
-- 4. Create Composite Index
-- ==========================================

CREATE INDEX idx_dept_city
ON employee(department, city);

SHOW INDEX FROM employee;

-- ==========================================
-- 5. Create Unique Index
-- ==========================================

CREATE UNIQUE INDEX idx_email
ON employee(email);

SHOW INDEX FROM employee;

-- ==========================================
-- 6. Drop an Index
-- ==========================================

DROP INDEX idx_department
ON employee;

SHOW INDEX FROM employee;

-- ==========================================
-- 7. Recreate the Index
-- ==========================================

CREATE INDEX idx_department
ON employee(department);

SHOW INDEX FROM employee;

-- ==========================================
-- 8. Find Employee by Name
-- (Index helps improve search performance)
-- ==========================================

SELECT *
FROM employee
WHERE emp_name = 'Rahul';

-- ==========================================
-- 9. Find Employees by Department
-- ==========================================

SELECT *
FROM employee
WHERE department = 'IT';

-- ==========================================
-- 10. Interview Practice
-- ==========================================

SELECT *
FROM employee
WHERE department = 'HR'
AND city = 'Delhi';

-- ==========================================
-- Index Completed
-- ==========================================