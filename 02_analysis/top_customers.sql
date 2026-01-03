-- PROBLEM 1 
-- TOP CUSTOMER ANALYSIS

with customers_orders as (
	select 
		o.customer_id,
		c.name,
		count(o.id) as total_orders,
		sum(o.amount) as total_revenue
	from orders o
	join customers c on
		c.id = o.customer_id
	group by
		o.customer_id,
		c.name
), first_last_orders as (
	select
		customer_id,
		created_at,
		row_number() over (
			partition by customer_id
			order by created_at
		) as rn
	from orders
)

select 
	distinct co.customer_id,
	co.name as customer_name,
	co.total_orders,
	co.total_revenue,
	first_value(flo.created_at) over(
		partition by flo.customer_id
		order by flo.rn asc
	) as first_order_date,
	first_value(flo.created_at) over(
		partition by flo.customer_id
		order by flo.rn desc
	) as last_order_date
from customers_orders co
join first_last_orders flo on
	co.customer_id = flo.customer_id
order by total_revenue desc

-- RESULT:

-- 1	"Andi Wijaya"	4	16550000	"2024-01-05"	"2024-03-12"
-- 4	"Dewi Anggraini"	1	16000000	"2024-02-18"	"2024-02-18"
-- 6	"Fajar Nugroho"	1	15500000	"2024-04-01"	"2024-04-01"
-- 2	"Budi Santoso"	3	15350000	"2024-01-10"	"2024-05-20"
-- 5	"Eko Pratama"	1	5000000	"2024-03-05"	"2024-03-05"
-- 3	"Citra Lestari"	2	3700000	"2024-02-02"	"2024-04-10"
-- 7	"Grace Tan"	1	3200000	"2024-05-03"	"2024-05-03"

