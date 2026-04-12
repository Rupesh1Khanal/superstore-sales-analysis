-- Superstore Sales & Profit Analysis
-- SQL queries used for business analysis on the sample_superstore dataset

-- 1. Preview the dataset
SELECT *
FROM sample_superstore
LIMIT 10;

-- 2. Find loss-making products
SELECT "Order ID", "Product Name", Sales, Profit
FROM sample_superstore
WHERE Profit < 0
ORDER BY Profit;

-- 3. Sales and profit by category
SELECT Category,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM sample_superstore
GROUP BY Category
ORDER BY total_profit DESC;

-- 4. Sales and profit by sub-category
SELECT "Sub-Category",
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM sample_superstore
GROUP BY "Sub-Category"
ORDER BY total_profit ASC;

-- 5. Average discount by category
SELECT Category,
       ROUND(AVG(Discount), 2) AS avg_discount
FROM sample_superstore
GROUP BY Category
ORDER BY avg_discount DESC;

-- 6. Discount vs profit
SELECT Discount,
       ROUND(SUM(Profit), 2) AS total_profit,
       COUNT(*) AS orders
FROM sample_superstore
GROUP BY Discount
ORDER BY Discount;

-- 7. Worst-performing sub-categories by profit
SELECT "Sub-Category",
       ROUND(SUM(Profit), 2) AS total_loss
FROM sample_superstore
GROUP BY "Sub-Category"
ORDER BY total_loss ASC
LIMIT 5;

-- 8. Regional sales and profit comparison
SELECT Region,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit
FROM sample_superstore
GROUP BY Region
ORDER BY total_profit DESC;