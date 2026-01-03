
-- PROBLEM 3
-- SIMPLE COHORT ANALUSIS (RETENTION AWARENESS)

with customers_orders as (
	select 
		customer_id,
		created_at
	from orders
), first_order_customers as (
	select 
		distinct customer_id,
		first_value(created_at) over(
			partition by customer_id
			order by created_at asc
		) as first_order_date
	from customers_orders
), first_cohort_month as (
	select 
		customer_id, 
		date_trunc(
			'month', 
			first_order_date
		) as cohort_month
	from first_order_customers
)

select
	focm.cohort_month,
	(
		extract(year from o.created_at) * 12 + extract(month from o.created_at)
	) -
	(
		extract(year from focm.cohort_month) * 12 + extract(month from focm.cohort_month)
	) as month_since,
	count(distinct o.customer_id) as active_customers
from orders o
join first_cohort_month focm on
	focm.customer_id = o.customer_id
group by
	focm.cohort_month,
	month_since
order by 
	focm.cohort_month,
	month_since

-- RESULT:

-- "2024-01-01 00:00:00+07"	0	2
-- "2024-01-01 00:00:00+07"	1	1
-- "2024-01-01 00:00:00+07"	2	2
-- "2024-01-01 00:00:00+07"	4	1
-- "2024-02-01 00:00:00+07"	0	2
-- "2024-02-01 00:00:00+07"	2	1
-- "2024-03-01 00:00:00+07"	0	1
-- "2024-04-01 00:00:00+07"	0	1
-- "2024-05-01 00:00:00+07"	0	1



