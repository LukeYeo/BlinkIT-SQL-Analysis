# Blinkit Data Analysis Project

## Overview  
This project is a SQL-based data analysis of Blinkit retail data, designed to develop practical data analysis skills through real-world dataset exploration.

## NOTE , THE RESULTS AND PROCEDURE OF HOW I DID THIS PROJECT IS IN THE WORD FILE

## Project Goals  
- Gain hands-on experience with SQL for data analysis  
- Learn to clean and prepare retail data  
- Practice calculating business metrics and KPIs  
- Develop data visualization skills through SQL  
- Derive actionable insights from raw data  

## Data Source  
Dataset from [Google Drive](https://drive.google.com/drive/folders/1jcM1HxhAunaWUPUkD_6v2rcni0wUJQOm) containing:  
- Sales figures  
- Item types and fat content  
- Outlet characteristics  
- Customer ratings  

## Key Analysis  

### KPI Requirements  
1. **Total sales**: Overall revenue  
2. **Average sales**: Count of different items sold  
3. **Number of items**: Total unique items  
4. **Average customer rating**  

### Granular Analysis  
1. Sales by fat content  
2. Sales by item type  
3. Fat content by outlet  
4. Sales by outlet establishment  

### Visualizations  
1. Percentage of sales by outlet size  
2. Sales by outlet location  
3. Metrics by outlet type  

## Technical Implementation  
```sql
-- Example query structure
SELECT 
    Outlet_Type,
    SUM(Item_Outlet_Sales) AS Total_Sales
FROM 
    Blinkit_dataset
GROUP BY 
    Outlet_Type
