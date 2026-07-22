WITH final_data AS (
    SELECT order_id, COUNT (*) AS total_item, SUM(price) AS total_price, SUM (freight_value) AS total_freight_value
    FROM {{ ref('stg_order_items_dataset') }}
    GROUP BY order_id
    ORDER BY total_price DESC
)

SELECT * 
FROM final_data