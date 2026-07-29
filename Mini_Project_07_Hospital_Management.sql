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
-- Patients Table
-- ==========================================

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    city VARCHAR(30)
);

INSERT INTO patients VALUES
(101,'Rahul',28,'Delhi'),
(102,'Priya',35,'Mumbai'),
(103,'Aman',40,'Indore'),
(104,'Neha',25,'Pune'),
(105,'Rohan',32,'Bhopal');

-- ==========================================
-- Doctors Table
-- ==========================================

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(40)
);

INSERT INTO doctors VALUES
(201,'Dr. Sharma','Cardiologist'),
(202,'Dr. Mehta','Neurologist'),
(203,'Dr. Singh','Orthopedic'),
(204,'Dr. Verma','Dermatologist');

-- ==========================================
-- Appointments Table
-- ==========================================

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    consultation_fee DECIMAL(10,2)
);

INSERT INTO appointments VALUES
(1,101,201,'2026-07-20',1200),
(2,102,202,'2026-07-21',1500),
(3,103,201,'2026-07-22',1200),
(4,104,204,'2026-07-23',1000),
(5,105,203,'2026-07-24',1800),
(6,101,202,'2026-07-25',1500);

-- ==========================================
-- Display Tables
-- ==========================================

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;

-- ==========================================
-- INNER JOIN
-- Patient Appointment Details
-- ==========================================

SELECT
p.patient_name,
d.doctor_name,
d.specialization,
a.appointment_date,
a.consultation_fee
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.patient_id
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id;

-- ==========================================
-- LEFT JOIN
-- ==========================================

SELECT
p.patient_name,
d.doctor_name
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id
LEFT JOIN doctors d
ON a.doctor_id = d.doctor_id;

-- ==========================================
-- Total Revenue by Doctor
-- ==========================================

SELECT
d.doctor_name,
SUM(a.consultation_fee) AS Total_Revenue
FROM appointments a
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_name
ORDER BY Total_Revenue DESC;

-- ==========================================
-- Number of Patients per Doctor
-- ==========================================

SELECT
d.doctor_name,
COUNT(a.patient_id) AS Total_Patients
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name;

-- ==========================================
-- HAVING Clause
-- ==========================================

SELECT
d.doctor_name,
SUM(a.consultation_fee) AS Revenue
FROM appointments a
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_name
HAVING SUM(a.consultation_fee) > 2000;

-- ==========================================
-- CASE WHEN
-- ==========================================

SELECT
doctor_name,
specialization,
CASE
    WHEN specialization = 'Cardiologist'
        THEN 'Heart Specialist'
    WHEN specialization = 'Neurologist'
        THEN 'Brain Specialist'
    ELSE 'General Specialist'
END AS Specialist_Type
FROM doctors;

-- ==========================================
-- Highest Consultation Fee
-- ==========================================

SELECT *
FROM appointments
WHERE consultation_fee =
(
    SELECT MAX(consultation_fee)
    FROM appointments
);

-- ==========================================
-- Average Consultation Fee
-- ==========================================

SELECT
AVG(consultation_fee) AS Average_Fee
FROM appointments;

-- ==========================================
-- Patients Above Average Age
-- ==========================================

SELECT *
FROM patients
WHERE age >
(
    SELECT AVG(age)
    FROM patients
);

-- ==========================================
-- Appointment Details
-- ==========================================

SELECT
a.appointment_id,
p.patient_name,
d.doctor_name,
a.appointment_date,
a.consultation_fee
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.patient_id
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;

-- ==========================================
-- Project Completed
-- ==========================================