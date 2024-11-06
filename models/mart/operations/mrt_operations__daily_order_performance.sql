select order_date,
    customer_city,
    customer_state,
    COUNT(order_id) as total_orders,
    SUM(total_order_amount) as total_order_amount,
    AVG(total_order_amount) as avg_order_amount
from {{ ref('int_bike_database__orders') }} 
group by order_date,
    customer_city,
    customer_state
