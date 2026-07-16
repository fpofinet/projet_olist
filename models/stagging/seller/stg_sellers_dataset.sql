WITH source_data  AS (
    SELECT * 
    FROM {{source('local_raw_data','olist_sellers_dataset')}}
)

SELECT *
FROM source_data