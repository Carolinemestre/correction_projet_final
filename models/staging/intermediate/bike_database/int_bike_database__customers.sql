with customers_recap as (

select customer_id,
    count(order_id) as total_orders,
    sum(total_order_item_amount) as total_order_amount,
    avg(total_order_item_amount) as avg_order_amount
from {{ ref('int_bike_database__orders' )}}

)

select c.customer_id,
    c.city,
    c.state,
    coalesce(total_orders,0) as total_orders,
    coalesce(total_order_amount,0) as total_order_amount,
    coalesce(avg_order_amount,0) as avg_order_amount
from {{ ref('stg_bike_database__customers') }} as c 
left join customers_recap cr on cr.customer_id = c.customer_id
