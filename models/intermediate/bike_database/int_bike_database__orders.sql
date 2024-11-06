select order_id,
    customer_id,
    city,
    state,
    order_status,
    order_date,
    store_id,
    staff_id,
    sum(item_quantity) as total_item_quantity,
    sum(total_order_item_amount) as total_order_amount
from {{ ref('int_bike_database__order_items') }}
group by order_id,
    customer_id,
    city,
    state,
    order_status,
    order_date,
    store_id,
    staff_id