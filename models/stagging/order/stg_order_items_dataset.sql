WITH source_data  AS (
    SELECT *
        REPLACE (
            ROUND(price,2) AS price
        )
    FROM {{source('local_raw_data','olist_order_items_dataset')}}
)

SELECT *
FROM source_data