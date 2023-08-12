-- Query to analyze total sales for the 4 weeks before and after a specific date
-- Calculates the growth or reduction rate in actual values and percentage of sales
WITH sale_inspection_4wks AS (
	SELECT
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '4' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before_16_4wks,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '4' WEEK THEN sales
		END) AS total_sales_after_16_4wks
	FROM clean_weekly_sales
)
SELECT
	total_sales_before_16_4wks,
	total_sales_after_16_4wks,
	(total_sales_after_16_4wks - total_sales_before_16_4wks) * 100 / total_sales_before_16_4wks AS growth_16_4wks
FROM sale_inspection_4wks;

-- Query to analyze total sales for the entire 12 weeks before and after a specific date
-- Calculates the growth or reduction rate in actual values and percentage of sales
WITH sale_inspection_12wks AS (
	SELECT
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before_16_12wks,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after_16_12wks
	FROM clean_weekly_sales
)
SELECT
	total_sales_before_16_12wks,
	total_sales_after_16_12wks,
	(total_sales_after_16_12wks - total_sales_before_16_12wks) * 100 / total_sales_before_16_12wks AS growth_16_12wks
FROM sale_inspection_12wks;

-- Query to compare sales metrics for specified periods with previous years (2018 and 2019)
-- 2018_4wks
WITH sale_inspection_4wks_18 AS (
	SELECT
		SUM(CASE
			WHEN week_date >= '2018-06-15' - INTERVAL '4' WEEK AND week_date < '2018-06-15' THEN sales
		END) AS total_sales_before_18_4wks,
		SUM(CASE
			WHEN week_date > '2018-06-15' AND week_date <= '2018-06-15' + INTERVAL '4' WEEK THEN sales
		END) AS total_sales_after_18_4wks
	FROM clean_weekly_sales
)
SELECT
	total_sales_before_18_4wks,
	total_sales_after_18_4wks,
	(total_sales_after_18_4wks - total_sales_before_18_4wks) * 100 / total_sales_before_18_4wks AS growth_18_4wks
FROM sale_inspection_4wks_18;

-- 2019_4wks
WITH sale_inspection_4wks_19 AS (
	SELECT
		SUM(CASE
			WHEN week_date >= '2019-06-15' - INTERVAL '4' WEEK AND week_date < '2019-06-15' THEN sales
		END) AS total_sales_before_19_4wks,
		SUM(CASE
			WHEN week_date > '2019-06-15' AND week_date <= '2019-06-15' + INTERVAL '4' WEEK THEN sales
		END) AS total_sales_after_19_4wks
	FROM clean_weekly_sales
)
SELECT
	total_sales_before_19_4wks,
	total_sales_after_19_4wks,
	(total_sales_after_19_4wks - total_sales_before_19_4wks) * 100 / total_sales_before_19_4wks AS growth_19_4wks
FROM sale_inspection_4wks_19;

-- 2018_12wks
WITH sale_inspection_12wks_18 AS (
	SELECT
		SUM(CASE
			WHEN week_date >= '2018-06-15' - INTERVAL '12' WEEK AND week_date < '2018-06-15' THEN sales
		END) AS total_sales_before_18_12wks,
		SUM(CASE
			WHEN week_date > '2018-06-15' AND week_date <= '2018-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after_18_12wks
	FROM clean_weekly_sales
)
SELECT
	total_sales_before_18_12wks,
	total_sales_after_18_12wks,
	(total_sales_after_18_12wks - total_sales_before_18_12wks) * 100 / total_sales_before_18_12wks AS growth_18_12wks
FROM sale_inspection_12wks_18;

-- 2019_12wks
WITH sale_inspection_12wks_19 AS (
	SELECT
		SUM(CASE
			WHEN week_date >= '2019-06-15' - INTERVAL '12' WEEK AND week_date < '2019-06-15' THEN sales
		END) AS total_sales_before_19_12wks,
		SUM(CASE
			WHEN week_date > '2019-06-15' AND week_date <= '2019-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after_19_12wks
	FROM clean_weekly_sales
)
SELECT
	total_sales_before_19_12wks,
	total_sales_after_19_12wks,
	(total_sales_after_19_12wks - total_sales_before_19_12wks) * 100 / total_sales_before_19_12wks AS growth_19_12wks
FROM sale_inspection_12wks_19;
