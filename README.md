# 🛒 Blinkit Sales Analysis Project (SQL Data Analysis)

Welcome to the **Blinkit Sales Analysis** project! This is a real-world data analysis case study using SQL, inspired by the *Data Tutorials* YouTube channel. In this project, I independently walked through the entire data analysis lifecycle — from data cleaning and transformation to generating KPI metrics and visual insights — using Microsoft SQL Server.

---

## 📊 Project Overview

This project simulates a real-time business data scenario based on Blinkit's grocery sales data. It includes:

- **Data importing and cleaning**
- **Exploratory data analysis using SQL**
- **Generating key business metrics (KPIs)**
- **Segmentation by outlet/item characteristics**
- **Sales and performance visual breakdowns**

---

## 🧰 Tools & Technologies Used

| Tool                  | Purpose                              |
|-----------------------|--------------------------------------|
| SQL Server Management Studio (SSMS) | Querying, data cleaning, and analysis |
| Microsoft SQL Server  | Data warehouse environment           |
| CSV Data              | Raw dataset from Blinkit             |
| Excel / PowerPoint (optional) | Charts and KPIs (not included here) |
| GitHub                | Version control & documentation      |

---

## 🚦 Key Business Questions Answered

### ✅ KPI Metrics

- **Total Sales:** Revenue from all transactions  
- **Average Sales:** Average sale per item  
- **Number of Items:** Unique items sold  
- **Average Rating:** Customer satisfaction per item  

### 📌 Granular Analysis

- Sales by **Fat Content**  
- Sales by **Item Type**  
- Fat content breakdown by **Outlet**  
- Sales by **Outlet Establishment Year**  

### 📊 Chart-Ready Metrics

- Percentage of sales by **Outlet Size**  
- Sales by **Outlet Location**  
- KPIs grouped by **Outlet Type**  

---

## 📂 Data Source

The dataset was obtained from a public source and can be found here:  
📁 [Blinkit Dataset (Google Drive)](https://drive.google.com/drive/folders/1jcM1HxhAunaWUPUkD_6v2rcni0wUJQOm)

---

## 🔎 Data Import & Cleaning Process

```sql
-- Step 1: Create new DB
CREATE DATABASE BlinkitDB;

-- Step 2: Import CSV as flat file into 'Blinkit_dataset'

-- Step 3: Modify column types during import
-- Example: Change NVARCHAR to VARCHAR, SMALLINT to INT, etc.

-- Step 4: Data Cleaning
-- Fix anomalies such as:
-- - 'LF' should be 'Low Fat'
-- - Missing 'Item Weight' values
-- - Typos in 'Outlet Type' (e.g., 'grocery store')
```

---

## 📈 Sample KPI SQL Queries

```sql
-- Total Sales
SELECT SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit_dataset;

-- Average Sales per Item
SELECT AVG(Item_Outlet_Sales) AS Avg_Sales
FROM Blinkit_dataset;

-- Number of Unique Items Sold
SELECT COUNT(DISTINCT Item_Identifier) AS Unique_Items
FROM Blinkit_dataset;

-- Average Customer Rating (if rating field exists)
SELECT AVG(Item_MRP) AS Avg_Rating -- assuming MRP as a proxy
FROM Blinkit_dataset;
```

More complex queries involving `GROUP BY`, `PIVOT`, and joins are used for granular breakdowns.

---

## 📚 Skills Demonstrated

- **SQL for Business Intelligence**
- **Data Cleaning and Normalization**
- **Aggregate Functions and Joins**
- **Data Segmentation (Categorical Analysis)**
- **Performance Optimization of Queries**
- **Real-World Data Interpretation**

---

## 🧠 Key Learning Points

- Understanding data structures in retail datasets  
- Designing KPIs aligned with business objectives  
- Handling real-world inconsistencies in CSV data  
- Writing efficient SQL queries for large datasets  

---

## 🧑‍💼 Author

**Yeo Chee En Luke**  
Statistician & Computer Scientist  
---

## 🎥 Acknowledgements

This project is inspired by the [Data Tutorials](https://www.youtube.com/watch?v=9A9jSvf6KZc&list=PLNr6y7fJuf_f9wCIPQTun4pMosf5e4fFk&index=6) YouTube video series. While I referenced their project scope, all SQL queries and analysis were developed independently to reflect my personal thought process and problem-solving style.

---
