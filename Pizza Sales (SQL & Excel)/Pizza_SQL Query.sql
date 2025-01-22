
select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select COUNT(Distinct order_id) AS Total_orders from pizza_sales

select CAST(CAST(sum(quantity) AS DECIMAL(10,2)) /
CAST(Count(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) as Avg_Pizzas_Per_Order from pizza_sales

--Daily Trend
Select datename(DW, Order_date) as order_day,Count(DISTINCT order_id) AS Total_orders
from pizza_sales GROUP BY DATENAME(DW, order_date)

--Hourly Trend
select DATEPART(hour, order_time) AS order_hours, Count(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATEPART(hour, order_time)
ORDER BY DATEPART(hour, order_time)

SELECT pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales) As PCT
from pizza_sales AS Total_Sales
GROUP BY pizza_category

SELECT pizza_category, sum(total_price) as Total_Sales,
sum(total_price) * 100 / (SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1) As PCT
from pizza_sales 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

SELECT pizza_size, sum(total_price) as Total_Sales,sum(total_price) * 100 /
(SELECT sum(total_price) from pizza_sales) As PCT
from pizza_sales 
GROUP BY pizza_size

SELECT pizza_size, sum(total_price) as Total_Sales, CAST(sum(total_price) * 100 /
(SELECT sum(total_price) from pizza_sales) As DECIMAL(10,2)) AS PCT
from pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC


SELECT pizza_size, sum(total_price) as Total_Sales, CAST(sum(total_price) * 100 /
(SELECT sum(total_price) from pizza_sales) As DECIMAL(10,2)) AS PCT
from pizza_sales 
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
Group by pizza_category

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) DESC

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
WHERE MONTH(order_date) = 8
GROUP BY pizza_name
ORDER BY sum(quantity) ASC