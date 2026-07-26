-- ==========================================
-- Topic : GROUP BY & ORDER BY
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE library_management;

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM library;

-- ==========================================
-- ORDER BY ASCENDING
-- ==========================================

SELECT *
FROM library
ORDER BY price ASC;

-- ==========================================
-- ORDER BY DESCENDING
-- ==========================================

SELECT *
FROM library
ORDER BY price DESC;

-- ==========================================
-- ORDER BY BOOK NAME
-- ==========================================

SELECT *
FROM library
ORDER BY book_name ASC;

-- ==========================================
-- GROUP BY CATEGORY
-- ==========================================

SELECT category,
COUNT(*) AS Total_Books
FROM library
GROUP BY category;

-- ==========================================
-- AVERAGE PRICE BY CATEGORY
-- ==========================================

SELECT category,
AVG(price) AS Average_Price
FROM library
GROUP BY category;

-- ==========================================
-- TOTAL PRICE BY CATEGORY
-- ==========================================

SELECT category,
SUM(price) AS Total_Price
FROM library
GROUP BY category;

-- ==========================================
-- HIGHEST PRICE BY CATEGORY
-- ==========================================

SELECT category,
MAX(price) AS Highest_Price
FROM library
GROUP BY category;

-- ==========================================
-- LOWEST PRICE BY CATEGORY
-- ==========================================

SELECT category,
MIN(price) AS Lowest_Price
FROM library
GROUP BY category;

-- ==========================================
-- COUNT AVAILABLE BOOKS
-- ==========================================

SELECT available,
COUNT(*) AS Total
FROM library
GROUP BY available;

-- ==========================================
-- ORDER BY WITH GROUP BY
-- ==========================================

SELECT category,
AVG(price) AS Average_Price
FROM library
GROUP BY category
ORDER BY Average_Price DESC;

-- ==========================================
-- GROUP BY & ORDER BY Completed
-- ==========================================