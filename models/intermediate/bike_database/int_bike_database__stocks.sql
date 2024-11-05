with products_solds as (

select store_id, 
    product_id, 
    sum(item_quantity) as total_item_solds
FROM {{ ref('int_bike_database__order_items') }}
group by store_id, 
    product_id
)


SELECT  products_solds.store_id, 
    products_solds.product_id, 
    products.product_name, 
    quantity as total_product_stock,
    products_solds.total_item_solds

FROM {{ ref('stg_bike_database__stocks') }} AS stocks
left join {{ ref('stg_bike_database__stores') }} AS stores on stocks.store_id = stores.store_id
left join products_solds on stocks.store_id = products_solds.store_id and stocks.product_id = products_solds.product_id
left join {{ ref('stg_bike_database__products') }} AS products on products.product_id = products_solds.product_id