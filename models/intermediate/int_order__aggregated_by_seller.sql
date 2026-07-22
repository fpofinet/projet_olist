WITH order_items AS (
    SELECT seller_id,order_id,price 
    FROM {{ ref('stg_order_items_dataset') }}
),

total_by_seller AS (
    SELECT seller_id, COUNT(*) AS total_product, SUM(price) AS total_revenue
    FROM order_items 
    GROUP BY seller_id
    ORDER BY total_product DESC
)

SELECT *
FROM total_by_seller