select brand_id,
    brand_name
from {{ ref('bike_database', 'brands') }}