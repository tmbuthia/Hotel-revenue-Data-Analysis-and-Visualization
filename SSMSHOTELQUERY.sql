
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
GROUP BY arrival_date_year,	hotel;