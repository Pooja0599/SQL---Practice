-- ==========================================
-- Topic : CASE WHEN
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE company_db;

-- ==========================================
-- Display Employee Table
-- ==========================================

SELECT * FROM employee;

-- ==========================================
-- 1. CASE WHEN - Salary Category
-- ==========================================

SELECT
emp_id,
emp_name,
salary,
CASE
    WHEN salary >= 70000 THEN 'High Salary'
    WHEN salary >= 50000 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS Salary_Category
FROM employee;

-- ==========================================
-- 2. CASE WHEN - Age Category
-- ==========================================

SELECT
emp_id,
emp_name,
age,
CASE
    WHEN age < 25 THEN 'Young'
    WHEN age BETWEEN 25 AND 35 THEN 'Adult'
    ELSE 'Senior'
END AS Age_Group
FROM employee;

-- ==========================================
-- 3. CASE WHEN - Department Bonus
-- ==========================================

SELECT
emp_name,
department,
salary,
CASE
    WHEN department = 'IT' THEN salary + 5000
    WHEN department = 'HR' THEN salary + 3000
    ELSE salary + 2000
END AS Updated_Salary
FROM employee;

-- ==========================================
-- 4. CASE WHEN - City Category
-- ==========================================

SELECT
emp_name,
city,
CASE
    WHEN city = 'Delhi' THEN 'North India'
    WHEN city = 'Mumbai' THEN 'West India'
    WHEN city = 'Indore' THEN 'Central India'
    ELSE 'Other'
END AS Region
FROM employee;

-- ==========================================
-- 5. CASE WHEN with Aggregate Function
-- ==========================================

SELECT
department,
COUNT(*) AS Total_Employees,
CASE
    WHEN COUNT(*) >= 3 THEN 'Large Team'
    ELSE 'Small Team'
END AS Team_Size
FROM employee
GROUP BY department;

-- ==========================================
-- 6. CASE WHEN with AVG Salary
-- ==========================================

SELECT
department,
AVG(salary) AS Average_Salary,
CASE
    WHEN AVG(salary) >= 60000 THEN 'Excellent'
    ELSE 'Good'
END AS Salary_Level
FROM employee
GROUP BY department;

-- ==========================================
-- 7. CASE WHEN in ORDER BY
-- ==========================================

SELECT
emp_name,
department,
salary
FROM employee
ORDER BY
CASE
    WHEN department = 'IT' THEN 1
    WHEN department = 'HR' THEN 2
    ELSE 3
END;

-- ==========================================
-- 8. CASE WHEN with Multiple Conditions
-- ==========================================

SELECT
emp_name,
salary,
department,
CASE
    WHEN salary > 70000 AND department = 'IT'
        THEN 'Top Performer'
    WHEN salary > 50000
        THEN 'Good Performer'
    ELSE 'Average Performer'
END AS Performance
FROM employee;

-- ==========================================
-- 9. CASE WHEN with Gender
-- ==========================================

SELECT
emp_name,
gender,
CASE
    WHEN gender = 'Male' THEN 'M'
    WHEN gender = 'Female' THEN 'F'
    ELSE 'N/A'
END AS Gender_Code
FROM employee;

-- ==========================================
-- 10. CASE WHEN with Experience
-- ==========================================

SELECT
emp_name,
experience,
CASE
    WHEN experience >= 10 THEN 'Expert'
    WHEN experience >= 5 THEN 'Experienced'
    ELSE 'Fresher'
END AS Experience_Level
FROM employee;

-- ==========================================
-- 11. CASE WHEN with Salary Increment
-- ==========================================

SELECT
emp_name,
salary,
CASE
    WHEN salary < 40000 THEN salary + 5000
    WHEN salary BETWEEN 40000 AND 60000 THEN salary + 3000
    ELSE salary + 2000
END AS New_Salary
FROM employee;

-- ==========================================
-- 12. CASE WHEN with NULL Values
-- ==========================================

SELECT
emp_name,
CASE
    WHEN manager_id IS NULL THEN 'No Manager'
    ELSE 'Manager Assigned'
END AS Manager_Status
FROM employee;

-- ==========================================
-- 13. Interview Practice
-- Employee Status
-- ==========================================

SELECT
emp_name,
salary,
CASE
    WHEN salary >= 80000 THEN 'Excellent'
    WHEN salary >= 60000 THEN 'Very Good'
    WHEN salary >= 40000 THEN 'Good'
    ELSE 'Needs Improvement'
END AS Employee_Status
FROM employee;

-- ==========================================
-- CASE WHEN Completed
-- ==========================================