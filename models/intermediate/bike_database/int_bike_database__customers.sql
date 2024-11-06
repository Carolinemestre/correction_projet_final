select customer_id,
    customer_city,
    customer_state,
    COUNT(order_id) as total_orders,
    SUM(total_order_amount) as total_order_amount,
    AVG(total_order_amount) as avg_order_amount,
    DATE_DIFF(DATE(MAX(order_date)), DATE(MIN(order_date)), DAY) / 365.0 as customer_lifespan
from {{ ref('int_bike_database__orders' )}} 
group by customer_id,
    customer_city,
    customer_state
