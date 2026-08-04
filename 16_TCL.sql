-- ==========================================
-- TCL (Transaction Control Language)
-- ==========================================

USE COMPANY_DB;

SELECT * FROM EMPLOYEE;


-- 1. COMMIT :- 

-- COMMIT Example
START TRANSACTION;

UPDATE EMPLOYEE
SET salary = 68000
WHERE emp_id = 101;

SELECT * FROM EMPLOYEE;

COMMIT;

SELECT * FROM EMPLOYEE;


-- 2. ROLLBACK :-

-- ROLLBACK Example

START TRANSACTION;

UPDATE EMPLOYEE
SET salary = 45000
WHERE emp_id = 102;

SELECT * FROM EMPLOYEE;

ROLLBACK;

SELECT * FROM EMPLOYEE;


-- 3. SAVEPOINT :-

-- SAVEPOINT Example

START TRANSACTION;

UPDATE EMPLOYEE
SET salary = 72000
WHERE emp_id = 103;

SAVEPOINT SP1;

UPDATE EMPLOYEE
SET city = 'Indore'
WHERE emp_id = 103;

SELECT * FROM EMPLOYEE;


-- 4. ROLLBACK TO SAVEPOINT :-

-- ROLLBACK TO SAVEPOINT Example

ROLLBACK TO SP1;

SELECT * FROM EMPLOYEE;

COMMIT;

SELECT * FROM EMPLOYEE;


-- 5. Multiple SAVEPOINT :-

-- Multiple SAVEPOINT Example

START TRANSACTION;

UPDATE EMPLOYEE
SET salary = 60000
WHERE emp_id = 104;

SAVEPOINT SP1;

UPDATE EMPLOYEE
SET city = 'Bhopal'
WHERE emp_id = 104;

SAVEPOINT SP2;

UPDATE EMPLOYEE
SET department = 'Accounts'
WHERE emp_id = 104;

SELECT * FROM EMPLOYEE;


ROLLBACK TO SP2;

SELECT * FROM EMPLOYEE;


ROLLBACK TO SP1;

SELECT * FROM EMPLOYEE;


COMMIT;

SELECT * FROM EMPLOYEE;