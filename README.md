# Hotel-revenue-Data-Analysis-and-Visualization
## Overview:
This project focuses on analyzing hotel booking data to understand trends and performance metrics. The analysis utilizes SQL and Power BI to extract insights from a historical dataset. Key findings include revenue trends, ADR analysis, occupancy analysis, and car space utilization. The project also provides recommendations for future improvements in pricing, capacity planning, and marketing strategies.
## Project Steps:

1. Data Acquisition and Preparation:
````
  a.  Acquire hotel booking data from Excel spreadsheets.
  b.  Create a SQL Server database and import the data.
  c.  Clean and transform the data to ensure consistency and accuracy.
  ````
  ```sql
  WITH hotel AS
(
SELECT *  FROM [Projects].[dbo].[historical revenue 2018]
UNION
SELECT *  FROM [Projects].[dbo].[historical revenue 2019]
UNION
SELECT *  FROM [Projects].[dbo].[historical revenue 2020]
)

SELECT * FROM hotel
left join [Projects].[dbo].[historical revenue market segment] AS mkt
ON hotel.market_segment = mkt.market_segment
left join [Projects].[dbo].[historical segment meal cost] AS mealcost
ON hotel.meal = mealcost.meal
```
3. SQL Query Development:
  ````
 a. Write SQL queries to explore the data and identify key trends.
 b. Aggregate data from multiple tables to create a unified dataset.
 c. Calculate new fields like revenue and total nights to facilitate analysis.
  ````
  ``` sql
    WITH hotel AS
(
SELECT *  FROM [Projects].[dbo].[historical revenue 2018]
UNION
SELECT *  FROM [Projects].[dbo].[historical revenue 2019]
UNION
SELECT *  FROM [Projects].[dbo].[historical revenue 2020]
)

SELECT
	arrival_date_year,
	hotel,
    SUM((CAST(stays_in_week_nights AS INT) + CAST(stays_in_weekend_nights AS INT)) * CAST(adr AS decimal(10,2))) AS revenue
FROM hotel
GROUP BY arrival_date_year,hotel;
 ```
  
5. Power BI Data Modeling and Visualization:
 ````
  a. Import the SQL query results into Power BI.
  b. Create a data model to establish relationships between tables and fields.
  c. Design an interactive dashboard to visualize key insights:
  d. Revenue Trends
  e. ADR Analysis
  f. Occupancy Analysis
  g. Car Space Utilization
  ````
## Power BI dashboard
![image](https://github.com/user-attachments/assets/589ec454-936d-424e-a398-7ac9b2e8d8fe)

7. Insights and Recommendations:
````
Present actionable insights to hotel management based on the analysis.
Suggest strategies to improve revenue, occupancy, and car space utilization.
Provide recommendations for future data analysis and dashboard enhancements.
Tools and Technologies:
Microsoft SQL Server Management Studio
Power BI
Key Learnings:
End-to-end data analysis process, from data acquisition to visualization.
SQL query writing and optimization techniques.
Data cleaning and transformation best practices.
Effective data visualization techniques to communicate insights.
Use of Power BI's features to create interactive and informative dashboards.
Future Improvements:
Explore advanced analytics techniques, such as machine learning, to predict future trends.
Automate the data pipeline to streamline the analysis process.
Enhance the dashboard with more interactive features and visualizations.
Implement robust data governance and security measures.
````
