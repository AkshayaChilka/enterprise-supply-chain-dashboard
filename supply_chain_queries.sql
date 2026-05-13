CREATE DATABASE supply_chain_project;
USE supply_chain_project;

#Query 1: Total orders
SELECT COUNT(Order_ID) AS Total_Orders
FROM supply_chain;

#Query 2: Total revenue
SELECT ROUND(SUM(Revenue),2) AS Total_Revenue
FROM supply_chain;

#Query 3: Total profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM supply_chain;

#Query 4: Average delivery days
SELECT ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM supply_chain;

#Query 5: On-time delivery percentage
SELECT
ROUND(
COUNT(CASE WHEN Delay_Flag='On Time' THEN 1 END)*100.0/
COUNT(*),2
) AS On_Time_Delivery_Percentage
FROM supply_chain;

#Query 6: Delayed orders count
SELECT COUNT(*) AS Delayed_Orders
FROM supply_chain
WHERE Delay_Flag='Delayed';

#Query 7: Orders by status
SELECT Order_Status, COUNT(*) AS Orders
FROM supply_chain
GROUP BY Order_Status;

#Query 8: Revenue by region
SELECT Region,
ROUND(SUM(Revenue),2) AS Revenue
FROM supply_chain
GROUP BY Region
ORDER BY Revenue DESC;

#Query 9: Profit by region
SELECT Region,
ROUND(SUM(Profit),2) AS Profit
FROM supply_chain
GROUP BY Region
ORDER BY Profit DESC;

#Query 10: Top 5 products by revenue
SELECT Product_Name,
ROUND(SUM(Revenue),2) AS Revenue
FROM supply_chain
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 5;

#Query 11: Top suppliers by profit
SELECT Supplier_Name,
ROUND(SUM(Profit),2) AS Profit
FROM supply_chain
GROUP BY Supplier_Name
ORDER BY Profit DESC;

#Query 12: Supplier defect analysis
SELECT Supplier_Name,
ROUND(AVG(Defect_Rate),2) AS Avg_Defect_Rate
FROM supply_chain
GROUP BY Supplier_Name
ORDER BY Avg_Defect_Rate DESC;

#Query 13: Warehouse performance
SELECT Warehouse,
ROUND(SUM(Revenue),2) AS Revenue
FROM supply_chain
GROUP BY Warehouse
ORDER BY Revenue DESC;

#Query 14: Stockout analysis
SELECT Stockout_Flag,
COUNT(*) AS Count_Products
FROM supply_chain
GROUP BY Stockout_Flag;

#Query 15: Low stock products
SELECT Product_Name,
Inventory_Level,
Reorder_Level
FROM supply_chain
WHERE Inventory_Level < Reorder_Level;

#Query 16: Average lead time by supplier
SELECT Supplier_Name,
ROUND(AVG(Lead_Time_Days),2) AS Avg_Lead_Time
FROM supply_chain
GROUP BY Supplier_Name
ORDER BY Avg_Lead_Time DESC;

#Query 17: Shipping cost by region
SELECT Region,
ROUND(SUM(Shipping_Cost),2) AS Total_Shipping_Cost
FROM supply_chain
GROUP BY Region;

#Query 18: Profit margin by product
SELECT Product_Name,
ROUND(AVG(Profit_Margin),2) AS Avg_Profit_Margin
FROM supply_chain
GROUP BY Product_Name
ORDER BY Avg_Profit_Margin DESC;

#Query 19: Monthly revenue trend
SELECT Order_Month,
ROUND(SUM(Revenue),2) AS Revenue
FROM supply_chain
GROUP BY Order_Month;

#Query 20: Inventory status summary
SELECT Inventory_Status,
COUNT(*) AS Products
FROM supply_chain
GROUP BY Inventory_Status;

#Best performing city
SELECT City,
ROUND(SUM(Profit),2) AS Profit
FROM supply_chain
GROUP BY City
ORDER BY Profit DESC
LIMIT 1;

#Most delayed region
SELECT Region,
COUNT(*) AS Delays
FROM supply_chain
WHERE Delay_Flag='Delayed'
GROUP BY Region
ORDER BY Delays DESC
LIMIT 1;

#Highest revenue supplier
SELECT Supplier_Name,
ROUND(SUM(Revenue),2) AS Revenue
FROM supply_chain
GROUP BY Supplier_Name
ORDER BY Revenue DESC
LIMIT 1;