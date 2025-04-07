-- Checking importing 
SELECT * FROM BlinkIT_Data

--Cleaning of dataset:
-- 1) updating the Item_Fat_Content
UPDATE BlinkIT_Data SET Item_Fat_Content = CASE 
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat' 
WHEN Item_Fat_Content= 'reg' THEN 'Regular' ELSE Item_Fat_Content
END

SELECT DISTINCT(Item_Fat_Content) FROM BlinkIT_Data --Checking to see the changes 

-- KPI Requirements: 
-- 1) Total Sales:
SELECT CAST(SUM(Total_Sales)/ 1000000 AS decimal(10,2)) AS Total_sales_in_Millions FROM BlinkIT_Data

-- 2) Average Sales: 
SELECT CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales FROM BlinkIT_Data

-- 3) Number of items:
SELECT COUNT(*) AS Number_of_items FROM BlinkIT_Data

-- 4) The average customer rating for items sold:
SELECT CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating FROM BlinkIT_Data

-- Granular Requirements:
-- 1) Total sales by fat content:
SELECT Item_Fat_Content, 
	CAST(SUM(Total_Sales)AS decimal(10,2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales,
	COUNT(*) AS Number_of_items,
	CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating
FROM BlinkIT_Data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC 

-- 2) Total sales by item type:
SELECT Item_Type, 
	CAST(SUM(Total_Sales)AS decimal(10,2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales,
	COUNT(*) AS Number_of_items,
	CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating
FROM BlinkIT_Data
GROUP BY Item_Type
ORDER BY Total_Sales DESC 

-- 3) Fat content by outlet for total Sales: 
SELECT Outlet_Location_Type, Item_Fat_Content,
	CAST(SUM(Total_Sales)AS decimal(10,2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales,
	COUNT(*) AS Number_of_items,
	CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating
FROM BlinkIT_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_Sales 

-- Rearraging the table 
SELECT Outlet_Location_Type,
	isNull([Low Fat], 0) AS Low_Fat,
	isNull([Regular], 0) AS Regular
FROM
(	SELECT Outlet_Location_Type, Item_Fat_Content, 
	CAST(SUM(Total_Sales)AS decimal(10,2)) AS Total_Sales
	FROM BlinkIT_Data
	GROUP BY Outlet_Location_Type, Item_Fat_Content
 ) AS SourceTable
 PIVOT
 ( SUM(Total_Sales)
  FOR Item_Fat_Content In ([Low Fat], [Regular])
  ) AS PivotTable
  ORDER BY Outlet_Location_Type;


-- PIVOT SEEMS WAYY TOO COMPLEX (REDO IN MY OWN SQL LOGIC):
SELECT 
    Outlet_Location_Type,
    SUM(CASE WHEN Item_Fat_Content = 'Low Fat' THEN Total_Sales ELSE 0 END) AS Low_Fat_Sales,
    SUM(CASE WHEN Item_Fat_Content = 'Regular' THEN Total_Sales ELSE 0 END) AS Regular_Sales
FROM BlinkIT_Data
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;


-- 4) Total Sales by outlet Establish:
SELECT Outlet_Establishment_Year, 
	CAST(SUM(Total_Sales)AS decimal(10,2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales,
	COUNT(*) AS Number_of_items,
	CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating
FROM BlinkIT_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC

--Chart Requirement
-- 1) Percentage of Sales by outlet size: 
SELECT Outlet_Size, 
	CAST(SUM(Total_Sales) AS decimal(10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales)* 100.0/SUM(SUM(Total_Sales)) OVER()) AS decimal(10,2)) AS Sales_Percentage
FROM BlinkIT_Data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC

-- 2) Sales by outlet location:
SELECT Outlet_Location_Type,
	CAST(SUM(Total_Sales) AS decimal(10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales)* 100.0/SUM(SUM(Total_Sales)) OVER()) AS decimal(10,2)) AS Sales_Percentage,
	CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales,
	COUNT(*) AS Number_of_items,
	CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating
FROM BlinkIT_Data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

-- 3) All metrics by outlet type: 
SELECT Outlet_Type,
	CAST(SUM(Total_Sales) AS decimal(10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales)* 100.0/SUM(SUM(Total_Sales)) OVER()) AS decimal(10,2)) AS Sales_Percentage,
	CAST(AVG(Total_Sales) AS decimal(10,1)) AS Average_Sales,
	COUNT(*) AS Number_of_items,
	CAST(AVG(Rating) AS decimal(10,2)) AS Average_Rating
FROM BlinkIT_Data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC