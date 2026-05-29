-- Q1: Sales and Profit by Region
SELECT Region, 
ROUND(SUM(Sales),2) AS Total_Sales, 
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders 
GROUP BY Region 
ORDER BY Total_Sales DESC;

-- Q2: Top 10 Products by Profit
SELECT "Product Name", 
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders 
GROUP BY "Product Name" 
ORDER BY Total_Profit DESC 
LIMIT 10;

-- Q3: Category-wise Profit Margin
SELECT Category, 
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Pct
FROM orders 
GROUP BY Category;

-- Q4: Monthly Sales Trend
SELECT strftime('%Y-%m', "Order Date") AS Month,
ROUND(SUM(Sales),2) AS Monthly_Sales
FROM orders 
GROUP BY Month 
ORDER BY Month;

-- Q5: Discount Impact on Profit
SELECT 
CASE 
  WHEN Discount = 0 THEN 'No Discount'
  WHEN Discount <= 0.2 THEN 'Low (0-20%)'
  ELSE 'High (>20%)' 
END AS Discount_Band,
ROUND(AVG(Profit),2) AS Avg_Profit,
COUNT(*) AS Orders
FROM orders 
GROUP BY Discount_Band;

-- Q6: Bottom 5 Loss-Making Sub-Categories
SELECT "Sub-Category", 
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders 
GROUP BY "Sub-Category" 
ORDER BY Total_Profit ASC 
LIMIT 5;

-- Q7: Customer Segment Performance
SELECT Segment, 
COUNT(DISTINCT "Customer ID") AS Unique_Customers,
ROUND(SUM(Sales),2) AS Total_Revenue,
ROUND(AVG(Sales),2) AS Avg_Order_Value
FROM orders 
GROUP BY Segment;

-- Q8: States Running at a Loss
SELECT State, 
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders 
GROUP BY State 
HAVING Total_Profit < 0 
ORDER BY Total_Profit ASC;