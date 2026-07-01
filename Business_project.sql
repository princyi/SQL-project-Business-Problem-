USE retail_analytics;
SHOW TABLES;

SELECT * FROM customer_profiles;
SELECT * FROM product_inventory;
SELECT * FROM sales_transaction;

-- Data Cleaning
-- Rename the column from ï»¿CustomerID to CustomerID
ALTER TABLE customer_profiles
RENAME COLUMN ï»¿CustomerID TO CustomerID;

-- Remove all the duplicate transactions if any.
-- Observation: There will be two duplicate records in the sales_transaction table
SELECT TransactionID, COUNT(*) FROM sales_transaction
GROUP BY TransactionID
HAVING COUNT(*) > 1;

CREATE TABLE sales_transaction_unique AS 
SELECT DISTINCT * FROM sales_transaction;


-- Query to identify the discrepancies in the price of the same product in "sales_transaction"
-- and "product_inventory" table. 
SELECT pi.ProductID, st.TransactionID, st.Price AS TransactionPrice, pi.Price AS InventoryPrice
FROM sales_transaction_unique st
JOIN product_inventory pi
ON st.ProductID = pi.ProductID
WHERE st.Price <> pi.Price;

SET SQL_SAFE_UPDATES = 0;
-- Update the sales_transaction table to match the product inventory prices
UPDATE sales_transaction_unique st
SET Price = (SELECT pi.Price FROM product_inventory pi WHERE st.ProductID = pi.ProductID)
WHERE st.ProductID IN (SELECT ProductID FROM product_inventory pi WHERE st.Price <> pi.Price);

-- Identifying the null values in the dataset
SELECT COUNT(*) FROM customer_profiles
WHERE location = '';

-- Replace all the blank values with the "unknown"
UPDATE customer_profiles
SET location = "Unknown" WHERE location = '';

SELECT * FROM product_inventory;
-- Data Analysis
-- 1. Product Performance Variability
-- Total sales and quantities sold per product
SELECT ProductID, SUM(QuantityPurchased) AS TotalUnitsSold, ROUND(SUM(QuantityPurchased * Price),2) AS TotalSales
FROM sales_transaction_unique
GROUP BY ProductID
ORDER BY TotalSales DESC;

-- ProductID, ProductName, TotalUnitsSold, TotalSales
-- Observation: "Product_17" is the highest-selling product with a TotalSales amount of 9450 and 
-- "Product_139" is the lowest-selling product with a TotalSales amount of 484.1
WITH ProductSales AS (
SELECT ProductID, SUM(QuantityPurchased) AS TotalUnitsSold, ROUND(SUM(QuantityPurchased * Price),2) AS TotalSales
FROM sales_transaction_unique
GROUP BY ProductID
)
SELECT ps.ProductID, pi.ProductName, ps.TotalUnitsSold, ps.TotalSales
FROM ProductSales ps
JOIN product_inventory pi
ON ps.ProductID = pi.ProductID
ORDER BY ps.TotalSales DESC;

-- Customer Segmentation based on their purchase frequency
-- Query to count the number of transactions per customer to understand the purchase frequency
SELECT CustomerID, COUNT(*) AS NumberOfTransactions 
FROM sales_transaction_unique 
GROUP BY CustomerID 
ORDER BY NumberOfTransactions DESC;

-- CASE Statements 
WITH CustomerTransactions AS (
SELECT CustomerID, COUNT(*) AS NumberOfTransactions 
FROM sales_transaction_unique 
GROUP BY CustomerID 
)
SELECT CustomerID, NumberOfTransactions,
CASE
	WHEN NumberOfTransactions BETWEEN 1 AND 5 THEN 'Low'
    WHEN NumberOfTransactions BETWEEN 6 AND 10 THEN 'Moderate'
    WHEN NumberOfTransactions BETWEEN 11 AND 14 THEN 'High'
    ELSE 'Out of Range'
END AS CustomerSegment
FROM CustomerTransactions
ORDER BY NumberOfTransactions DESC;

-- Customer Behavior Analysis
-- High Purchase Frequency and Revenue => Loyal Customers
SELECT CustomerID, COUNT(*) AS NumberOfTransactions, ROUND(SUM(Price * QuantityPurchased),2) AS TotalSpent
FROM sales_transaction_unique
GROUP BY CustomerID 
HAVING NumberOfTransactions > 10 AND TotalSpent > 1000
ORDER BY TotalSpent DESC;

-- Low Purchase Frequency and Revenue => Occassional Customers
SELECT CustomerID, COUNT(*) AS NumberOfTransactions, ROUND(SUM(Price * QuantityPurchased),2) AS TotalSpent
FROM sales_transaction_unique
GROUP BY CustomerID 
HAVING NumberOfTransactions < 6 AND TotalSpent < 100
ORDER BY TotalSpent DESC;

-- Repeat Purchase Patterns
SELECT CustomerID, ProductID, COUNT(*) AS TimesPurchased
FROM sales_transaction_unique
GROUP BY CustomerID, ProductID
HAVING TimesPurchased > 1
ORDER BY TimesPurchased DESC;

-- Query to get the duration between the first and last purchase of the customer to understand
-- the loyalty of the customer

SELECT * FROM sales_transaction_unique;
DESC sales_transaction_unique;

WITH TransactionDate_tb AS (
SELECT CustomerID, STR_TO_DATE(TransactionDate, '%d/%m/%Y') AS TransactionDate
FROM sales_transaction_unique
)
SELECT CustomerID, MIN(TransactionDate) AS FirstPurchase, MAX(TransactionDate) AS LastPurchase,
MAX(TransactionDate) - MIN(TransactionDate) AS DaysBetweenPurchases
FROM TransactionDate_tb
GROUP BY CustomerID
HAVING (MAX(TransactionDate) - MIN(TransactionDate)) > 0
ORDER BY DaysBetweenPurchases DESC;

-- Task => Explore other alternatives to get the insights on the objectives of the project.


