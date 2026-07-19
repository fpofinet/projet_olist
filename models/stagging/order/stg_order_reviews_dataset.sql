WITH source_data  AS (
    SELECT * 
    FROM {{source('local_raw_data','olist_order_reviews_dataset')}}
)

SELECT *
FROM source_data