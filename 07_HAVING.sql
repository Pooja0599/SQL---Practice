-- ==========================================
-- Topic : HAVING Clause
-- Author : Pooja Singh
-- GitHub : Pooja0599
-- ==========================================

USE library_management;

-- ==========================================
-- Display All Records
-- ==========================================

SELECT * FROM library;

-- ==========================================
-- GROUP BY Category
-- ==========================================

SELECT
category,
COUNT(*) AS Total_Books
FROM library
GROUP BY category;

-- ==========================================
-- HAVING with COUNT
-- ==========================================

SELECT
category,
COUNT(*) AS Total_Books
FROM library
GROUP BY category
HAVING COUNT(*) >= 2;

-- ==========================================
-- HAVING with SUM
-- ==========================================

SELECT
category,
SUM(price) AS Total_Price
FROM library
GROUP BY category
HAVING SUM(price) > 500;

-- ==========================================
-- HAVING with AVG
-- ==========================================

SELECT
category,
AVG(price) AS Average_Price
FROM library
GROUP BY category
HAVING AVG(price) > 250;

-- ==========================================
-- HAVING with MAX
-- ==========================================

SELECT
category,
MAX(price) AS Highest_Price
FROM library
GROUP BY category
HAVING MAX(price) > 300;

-- ==========================================
-- HAVING with MIN
-- ==========================================

SELECT
category,
MIN(price) AS Lowest_Price
FROM library
GROUP BY category
HAVING MIN(price) > 100;

-- ==========================================
-- WHERE + GROUP BY + HAVING
-- ==========================================

SELECT
category,
COUNT(*) AS Total_Books
FROM library
WHERE available = 'Yes'
GROUP BY category
HAVING COUNT(*) >= 1;

-- ==========================================
-- GROUP BY + HAVING + ORDER BY
-- ==========================================

SELECT
category,
SUM(price) AS Total_Price
FROM library
GROUP BY category
HAVING SUM(price) > 500
ORDER BY Total_Price DESC;

-- ==========================================
-- HAVING Using Multiple Conditions
-- ==========================================

SELECT
category,
COUNT(*) AS Total_Books,
AVG(price) AS Average_Price
FROM library
GROUP BY category
HAVING COUNT(*) >= 2
AND AVG(price) > 200;

-- ==========================================
-- Difference Between WHERE and HAVING
-- ==========================================

-- WHERE filters rows before grouping.
SELECT *
FROM library
WHERE price > 200;

-- HAVING filters groups after grouping.
SELECT
category,
AVG(price) AS Average_Price
FROM library
GROUP BY category
HAVING AVG(price) > 200;

-- ==========================================
-- HAVING Clause Completed
-- ==========================================