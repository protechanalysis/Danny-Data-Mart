--  What day of the week is used for each week_date value?
-- Output: day_name - The day of the week corresponding to week_date
SELECT week_date,dayname(week_date) AS day_name
FROM clean_weekly_sales
LIMIT 50;
-- Result: Returns the day of the week (e.g., Sunday) for each week_date in the clean_weekly_sales table

-- Query to identify missing week numbers in the dataset
-- Output: week_number - The week numbers that are distinct in the dataset
SELECT DISTINCT week_number
FROM clean_weekly_sales;
-- Result: Returns the week numbers that are present in the dataset; gaps in week numbers indicate missing data

-- Query to calculate the total transactions for each year in the dataset
-- Output: calendar_year - The year of the data, total_transactions - Sum of transactions for each year
SELECT calendar_year, SUM(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY calendar_year;
-- Result: Provides the total number of transactions for each calendar year in the dataset

-- Query to calculate total sales for each region for each month
-- Output: month_number - The month number, region - Sales region, total_sales - Sum of sales for each month and region
SELECT month_number, region, SUM(sales) AS total_sales
FROM clean_weekly_sales
GROUP BY month_number, region;
-- Result: Displays the total sales for each region in each month of the dataset

-- Query to calculate the total count of transactions for each platform
-- Output: platform - The transaction platform, total_transactions - Sum of transactions for each platform
SELECT platform, SUM(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY platform;
-- Result: Shows the total number of transactions for each platform in the dataset

-- Query to calculate the percentage of sales for Shopify and Retail for each month
-- Output: month_number - The month number, percentage_Shopify - Percentage of sales from Shopify, percentage_Retail - Percentage of sales from Retail
SELECT month_number, 
	ROUND(SUM(CASE WHEN platform = 'Shopify' THEN sales END) * 100 / SUM(sales), 2) AS percentage_Shopify, 
    ROUND(SUM(CASE WHEN platform = 'Retail' THEN sales END) * 100 / SUM(sales), 2) AS percentage_Retail
FROM clean_weekly_sales
GROUP BY month_number;
-- Result: Calculates the percentage of sales contributed by Shopify and Retail in each month

-- Query to calculate the percentage of sales by demographic for each year in the dataset
-- Output: calendar_year - The year of the data, percentage_Couples - Percentage of sales from Couples, percentage_Families - Percentage of sales from Families, percentage_unknown - Percentage of sales with unknown demographic
SELECT calendar_year, 
	ROUND(SUM(CASE WHEN demographic = 'Couples' THEN sales END) * 100 / SUM(sales), 2) AS percentage_Couples, 
    ROUND(SUM(CASE WHEN demographic = 'Families' THEN sales END) * 100 / SUM(sales), 2) AS percentage_Families, 
    ROUND(SUM(CASE WHEN demographic = 'unknown' THEN sales END) * 100 / SUM(sales), 2) AS percentage_unknown
FROM clean_weekly_sales
GROUP BY calendar_year;
-- Result: Calculates the percentage of sales contributed by different demographics in each year

-- Query to identify the age_band and demographic values contributing the most to Retail sales
-- Output: age_band - Age group, demographic - Demographic category, total_retail_sales - Total sales for the combination
SELECT age_band, demographic, SUM(sales) AS total_retail_sales
FROM clean_weekly_sales
WHERE platform = 'Retail'
GROUP BY age_band, demographic
ORDER BY total_retail_sales DESC;
-- Result: Lists the age_band and demographic values that contribute the most to Retail sales

-- Query to calculate the average transaction size for each year for Retail vs Shopify
-- Note: This query calculates the average of the 'transactions' column. If you want the average of sales, you would need to calculate it differently.
-- Output: calendar_year - The year of the data, platform - Transaction platform, AVG(transactions) - Average transaction size
SELECT calendar_year, platform, ROUND(AVG(transactions), 2) AS Avg_Transactions
FROM clean_weekly_sales
GROUP BY calendar_year, platform;
-- Result: Provides the average transaction size for each year and platform
