-- ==========================================
-- Topic : Date Functions
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE library_management;

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM library;

-- ==========================================
-- Current Date
-- ==========================================

SELECT CURDATE() AS Current_Date;

-- ==========================================
-- Current Time
-- ==========================================

SELECT CURTIME() AS Current_Time;

-- ==========================================
-- Current Date and Time
-- ==========================================

SELECT NOW() AS Current_Date_Time;

-- ==========================================
-- Year Function
-- ==========================================

SELECT YEAR(CURDATE()) AS Current_Year;

-- ==========================================
-- Month Function
-- ==========================================

SELECT MONTH(CURDATE()) AS Current_Month;

-- ==========================================
-- Month Name
-- ==========================================

SELECT MONTHNAME(CURDATE()) AS Month_Name;

-- ==========================================
-- Day Function
-- ==========================================

SELECT DAY(CURDATE()) AS Current_Day;

-- ==========================================
-- Day Name
-- ==========================================

SELECT DAYNAME(CURDATE()) AS Day_Name;

-- ==========================================
-- Date Format
-- ==========================================

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS Formatted_Date;

SELECT DATE_FORMAT(CURDATE(), '%W, %M %d, %Y') AS Full_Date;

-- ==========================================
-- Date Difference
-- ==========================================

SELECT DATEDIFF('2026-12-31', CURDATE()) AS Days_Remaining;

-- ==========================================
-- Add Days
-- ==========================================

SELECT DATE_ADD(CURDATE(), INTERVAL 10 DAY) AS After_10_Days;

-- ==========================================
-- Subtract Days
-- ==========================================

SELECT DATE_SUB(CURDATE(), INTERVAL 10 DAY) AS Before_10_Days;

-- ==========================================
-- Last Day of Month
-- ==========================================

SELECT LAST_DAY(CURDATE()) AS Last_Day_Of_Month;

-- ==========================================
-- Date Functions Completed
-- ==========================================