SELECT
    oi.product_id,
    c.category_name,
    b.brand_name,
    SUM(oi.quantity * (oi.list_price * (1 - oi.discount))) AS total_sales,
    SUM(oi.quantity) AS total_quantity_sold
FROM {{ ref('int_bike_database__order_items') }} as oi
LEFT JOIN {{ ref('stg_bike_database__products') }} as p ON oi.product_id = p.product_id
LEFT JOIN {{ ref('stg_bike_database__categories')}} as c ON c.category_id = p.category_id
LEFT JOIN {{ ref('stg_bike_database__brands') }} as b ON b.brand_id = p.brand_id
GROUP BY
    product_id,
    category_name,
    brand_name;