-- ==========================================
-- Topic : String Functions
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE student_management;

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM student;

-- ==========================================
-- UPPER() Function
-- ==========================================

SELECT student_name,
UPPER(student_name) AS Upper_Name
FROM student;

-- ==========================================
-- LOWER() Function
-- ==========================================

SELECT student_name,
LOWER(student_name) AS Lower_Name
FROM student;

-- ==========================================
-- LENGTH() Function
-- ==========================================

SELECT student_name,
LENGTH(student_name) AS Name_Length
FROM student;

-- ==========================================
-- CONCAT() Function
-- ==========================================

SELECT CONCAT(student_name, ' - ', course) AS Student_Details
FROM student;

-- ==========================================
-- SUBSTRING() Function
-- ==========================================

SELECT student_name,
SUBSTRING(student_name, 1, 3) AS First_Three_Characters
FROM student;

-- ==========================================
-- REPLACE() Function
-- ==========================================

SELECT student_name,
REPLACE(student_name, 'a', '@') AS Modified_Name
FROM student;

-- ==========================================
-- TRIM() Function
-- ==========================================

SELECT TRIM('   SQL Practice   ') AS Trimmed_Text;

-- ==========================================
-- LEFT() Function
-- ==========================================

SELECT student_name,
LEFT(student_name, 2) AS Left_Characters
FROM student;

-- ==========================================
-- RIGHT() Function
-- ==========================================

SELECT student_name,
RIGHT(student_name, 2) AS Right_Characters
FROM student;

-- ==========================================
-- REVERSE() Function
-- ==========================================

SELECT student_name,
REVERSE(student_name) AS Reverse_Name
FROM student;

-- ==========================================
-- String Functions Completed
-- ==========================================