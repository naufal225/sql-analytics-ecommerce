-- PROBLEM 2
-- MONTHLY REVENUE TREND

with base as (
	select 
		extract(year from created_at) as year,
		to_char(created_at, 'Month') as month,
		created_at,
		count(id) as total_orders,
		sum(amount) as total_revenue
	from orders
		group by created_at
), numbered_base as (
	select 
		b.year,
		b.month,
		sum(b.total_orders),
		sum(b.total_revenue)
	from base b
	group by 
		b.year,
		b.month
	order by 
		b.year,
		extract(month from to_date(b.month, 'Month'))
)

select * from numbered_base

-- RESULT:

-- 2024	"January  "	3	16000000
-- 2024	"February "	3	19500000
-- 2024	"March    "	3	19800000
-- 2024	"April    "	2	16200000
-- 2024	"May      "	2	3800000
