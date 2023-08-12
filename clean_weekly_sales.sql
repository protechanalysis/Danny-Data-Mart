create table clean_weekly_sales as
with week_date_clean as (
select str_to_date(weekly_date, "%d/%m/%y") as week_date, region, platform, segment, customer_type, transactions, sales
from weekly_sales),
week_clean as (
	select week_date, weekofyear(week_date) as week_number, 
		month(week_date) as month_number, year(week_date) as calendar_year,
        region, platform, 
        segment, customer_type, transactions, sales
 from week_date_clean),
 segment_clean as (
		select week_date, week_number, 
		month_number, calendar_year,
        region, platform, 
        case when segment = 'null' then 'unknown' else segment end as segment,
		case when segment != 'null' and  right(segment,1) = 1 then 'Young Adults'
        when segment != 'null' and  right(segment,1) = 2 then 'Middle Aged'
        when segment != 'null' and  right(segment,1) in (3, 4) then 'Retirees'
		when segment = 'null' then 'unknown' end as age_band, 
        case when segment != 'null' and  left(segment,1) = 'C' then 'Couples'
        when segment != 'null' and  left(segment,1) = 'F' then 'Families'
		when segment = 'null' then 'unknown' end as demographic,
		customer_type, transactions, sales,
        round(sales/transactions, 2) as avg_transaction
        from week_clean)
        
 select *
 from segment_clean
 
 
 
 