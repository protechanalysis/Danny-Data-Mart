-- Query to analyze sales growth by region
WITH sale_inspection_region AS (
	SELECT
		region,
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after
	FROM clean_weekly_sales
	GROUP BY region
)
SELECT
	region,
	total_sales_before,
	total_sales_after,
	(total_sales_after - total_sales_before) * 100 / total_sales_before AS growth
FROM sale_inspection_region;

-- Query to analyze sales growth by platform
WITH sale_inspection_platform AS (
	SELECT
		platform,
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after
	FROM clean_weekly_sales
	GROUP BY platform
)
SELECT
	platform,
	total_sales_before,
	total_sales_after,
	(total_sales_after - total_sales_before) * 100 / total_sales_before AS growth
FROM sale_inspection_platform;

-- Query to analyze sales growth by age band
WITH sale_inspection_age_band AS (
	SELECT
		age_band,
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after
	FROM clean_weekly_sales
	GROUP BY age_band
)
SELECT
	age_band,
	total_sales_before,
	total_sales_after,
	(total_sales_after - total_sales_before) * 100 / total_sales_before AS growth
FROM sale_inspection_age_band;

-- Query to analyze sales growth by demographic
WITH sale_inspection_demographic AS (
	SELECT
		demographic,
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after
	FROM clean_weekly_sales
	GROUP BY demographic
)
SELECT
	demographic,
	total_sales_before,
	total_sales_after,
	(total_sales_after - total_sales_before) * 100 / total_sales_before AS growth
FROM sale_inspection_demographic;

-- Query to analyze sales growth by customer type
WITH sale_inspection_customer_type AS (
	SELECT
		customer_type,
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after
	FROM clean_weekly_sales
	GROUP BY customer_type
)
SELECT
	customer_type,
	total_sales_before,
	total_sales_after,
	(total_sales_after - total_sales_before) * 100 / total_sales_before AS growth
FROM sale_inspection_customer_type;

-- Query to analyze sales growth by multiple dimensions (region, platform, age band, demographic, customer type)
WITH sale_inspection AS (
	SELECT
		region,
		platform,
		age_band,
		demographic,
		customer_type,
		SUM(CASE
			WHEN week_date >= '2020-06-15' - INTERVAL '12' WEEK AND week_date < '2020-06-15' THEN sales
		END) AS total_sales_before,
		SUM(CASE
			WHEN week_date > '2020-06-15' AND week_date <= '2020-06-15' + INTERVAL '12' WEEK THEN sales
		END) AS total_sales_after
	FROM clean_weekly_sales
	GROUP BY region, platform, age_band, demographic, customer_type
)
SELECT
	region,
	platform,
	age_band,
	demographic,
	customer_type,
	total_sales_before,
	total_sales_after,
	(total_sales_after - total_sales_before) * 100 / total_sales_before AS growth
FROM sale_inspection
ORDER BY growth ASC;
