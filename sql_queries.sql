-- ============================================
--  Retail Sales Analysis (SQL Project)
-- ============================================

-- --------------------------------------------
--  Database Setup
-- --------------------------------------------

-- create database Retail_Sales;
USE Retail_Sales;
-- SHOW DATABASES;

-- DROP TABLE IF EXISTS Retail_sales_tb;
-- CREATE TABLE Retail_sales_tb (
--     transactions_id INT,
--     sale_date DATE,
--     sale_time TIME,
--     customer_id INT,
--     gender VARCHAR(15),
--     age INT,
--     category VARCHAR(15),
--     quantity INT,
--     price_per_unit FLOAT,
--     cogs FLOAT,
--     total_sale FLOAT
-- );

-- --------------------------------------------
--  Data Cleaning
-- --------------------------------------------

-- Checking for NULL values

-- SELECT 
--     SUM(CASE WHEN transactions_id IS NULL THEN 1 ELSE 0 END) AS transactions_id_nulls,
--     SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS sale_date_nulls,
--     SUM(CASE WHEN sale_time IS NULL THEN 1 ELSE 0 END) AS sale_time_nulls,
--     SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
--     SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
--     SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
--     SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_nulls,
--     SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_nulls,
--     SUM(CASE WHEN price_per_unit IS NULL THEN 1 ELSE 0 END) AS price_nulls,
--     SUM(CASE WHEN cogs IS NULL THEN 1 ELSE 0 END) AS cogs_nulls,
--     SUM(CASE WHEN total_sale IS NULL THEN 1 ELSE 0 END) AS total_sale_nulls
-- FROM Retail_sales_tb;

-- --------------------------------------------
--  Exploratory Data Analysis (EDA)
-- --------------------------------------------

-- Total Metrics

-- SELECT 
--     COUNT(*) AS total_orders,
--     SUM(total_sale) AS total_revenue,
--     SUM(quantity) AS total_items_sold
-- FROM Retail_sales_tb; 

--  Average Order Value

-- SELECT 
--     SUM(total_sale)/COUNT(*) AS avg_order_value
-- FROM Retail_sales_tb;

-- Average Items per Order

--  SELECT 
--  SUM(quantity)/COUNT(*) AS avg_items_per_order
--  FROM Retail_sales_tb;

-- Category Analysis

-- SELECT 
--     category,
--     COUNT(*) AS total_orders,
--     ROUND(SUM(total_sale), 2) AS total_revenue,
--     ROUND(AVG(total_sale), 2) AS avg_order_value,
--     ROUND(SUM(total_sale) / SUM(SUM(total_sale)) OVER () * 100, 2) AS revenue_percentage
-- FROM Retail_sales_tb
-- GROUP BY category
-- ORDER BY total_revenue DESC;

-- Top Customers
 
-- SELECT 
--     customer_id,
--     COUNT(*) AS orders,
--     SUM(total_sale) AS total_spent,
--     AVG(total_sale) AS avg_order_value
-- FROM Retail_sales_tb
-- GROUP BY customer_id
-- ORDER BY total_spent DESC;

-- Time-based Analysis

-- SELECT 
--     CASE 
--         WHEN HOUR(sale_time) BETWEEN 6 AND 11 THEN 'Morning'
--         WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
--         WHEN HOUR(sale_time) BETWEEN 18 AND 21 THEN 'Evening'
--         ELSE 'Night'
--     END AS time_of_day,
--     COUNT(*) AS orders,
--     SUM(total_sale) AS revenue,
--     AVG(total_sale) AS avg_order_value,
--     ROUND(
--         COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 
--         2
--     ) AS order_percentage
-- FROM Retail_sales_tb
-- GROUP BY time_of_day;

-- Monthly Trends

-- SELECT 
--     MONTH(sale_date) AS month,
--     COUNT(*) AS total_orders,
--     SUM(total_sale) AS revenue,
--     AVG(total_sale) AS avg_order_value
-- FROM Retail_sales_tb
-- GROUP BY month
-- ORDER BY month;

--  Gender Analysis

-- SELECT 
--     gender,
--     COUNT(*) AS orders,
--     SUM(total_sale) AS revenue,
--     AVG(total_sale) AS avg_order_value,
--     AVG(quantity) AS avg_items_per_order
-- FROM Retail_sales_tb
-- GROUP BY gender;

-- Age Group Analysis

-- SELECT 
--     CASE 
--         WHEN age < 25 THEN 'Young'
--         WHEN age BETWEEN 25 AND 40 THEN 'Adult'
--         ELSE 'Senior'
--     END AS age_group,
--     COUNT(*) AS orders,
--     SUM(total_sale) AS revenue,
--     AVG(total_sale) AS avg_order_value,
--     AVG(quantity) AS avg_items_per_order
-- FROM Retail_sales_tb
-- GROUP BY age_group;
