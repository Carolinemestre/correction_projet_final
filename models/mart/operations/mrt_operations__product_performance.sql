with sales_grouped_by_product AS (

select
    product_id,
    SUM(total_order_item_amount) AS total_sales,
    SUM(item_quantity) AS total_quantity_sold
from {{ ref('int_bike_database__order_items') }} as oi

)

SELECT
    products.product_id,
    products.category_name,
    products.brand_name,
    sales.total_sales,
    sales.total_quantity_sold
FROM {{ ref('int_bike_database__products') }} as products
left join sales_grouped_by_product as sales
