-- ==========================================
-- Project : Hospital Management System
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

-- ==========================================
-- Create Database
-- ==========================================

CREATE DATABASE hospital_management;

USE hospital_management;

-- ==========================================
-- Create Table
-- ==========================================

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    disease VARCHAR(50),
    doctor_name VARCHAR(50),
    admission_date DATE,
    bill_amount INT
);

-- ==========================================
-- Insert Records
-- ==========================================

INSERT INTO patients VALUES
(101,'Rahul',25,'Male','Fever','Dr. Sharma','2026-07-01',3500),
(102,'Pooja',27,'Female','Diabetes','Dr. Verma','2026-07-03',12000),
(103,'Aman',35,'Male','Heart Disease','Dr. Singh','2026-07-05',45000),
(104,'Neha',30,'Female','Fracture','Dr. Gupta','2026-07-08',18000),
(105,'Rohan',22,'Male','Fever','Dr. Sharma','2026-07-10',3000),
(106,'Priya',29,'Female','Migraine','Dr. Verma','2026-07-12',5000),
(107,'Karan',40,'Male','Diabetes','Dr. Singh','2026-07-15',15000),
(108,'Sneha',26,'Female','Fever','Dr. Gupta','2026-07-18',4000);

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM patients;

-- ==========================================
-- Patients with Bill > 10000
-- ==========================================

SELECT * FROM patients
WHERE bill_amount > 10000;

-- ==========================================
-- Patients Having Fever
-- ==========================================

SELECT * FROM patients
WHERE disease = 'Fever';

-- ==========================================
-- Total Patients
-- ==========================================

SELECT COUNT(*) AS Total_Patients
FROM patients;

-- ==========================================
-- Total Hospital Revenue
-- ==========================================

SELECT SUM(bill_amount) AS Total_Revenue
FROM patients;

-- ==========================================
-- Average Bill
-- ==========================================

SELECT AVG(bill_amount) AS Average_Bill
FROM patients;

-- ==========================================
-- Highest Bill
-- ==========================================

SELECT MAX(bill_amount) AS Highest_Bill
FROM patients;

-- ==========================================
-- Lowest Bill
-- ==========================================

SELECT MIN(bill_amount) AS Lowest_Bill
FROM patients;

-- ==========================================
-- Patients by Disease
-- ==========================================

SELECT disease,
COUNT(*) AS Total_Patients
FROM patients
GROUP BY disease;

-- ==========================================
-- Revenue by Doctor
-- ==========================================

SELECT doctor_name,
SUM(bill_amount) AS Total_Revenue
FROM patients
GROUP BY doctor_name
ORDER BY Total_Revenue DESC;

-- ==========================================
-- Date Functions
-- ==========================================

SELECT patient_name,
admission_date,
YEAR(admission_date) AS Year,
MONTHNAME(admission_date) AS Month
FROM patients;

-- ==========================================
-- String Functions
-- ==========================================

SELECT UPPER(patient_name) AS Patient_Name
FROM patients;

SELECT CONCAT(patient_name,' - ',doctor_name) AS Patient_Doctor
FROM patients;

-- ==========================================
-- End of Project
-- ==========================================