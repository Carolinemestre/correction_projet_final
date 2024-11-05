select order_id,
    order_item_id,
    customer_id,
    order_status,
    order_date,
    store_id,
    staff_id,
    product_id,
    item_quantity,
    item_price,
    total_order_item_amount
from {{ ref('stg_bike_database__order_items') }} AS oi
left join {{ ref('stg_bike_database__orders') }} AS o ON o.order_id = oi.order_id 