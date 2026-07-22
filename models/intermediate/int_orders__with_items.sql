WITH orders  AS (
    SELECT * 
    FROM {{ ref('stg_orders_dataset') }}
), 

order_items AS (
    SELECT order_id, COUNT(*) AS total_items, SUM(price) AS total_price,seller_id
    FROM {{ ref('stg_order_items_dataset') }}
    GROUP BY order_id,seller_id
),

order_with_item AS (
    SELECT od.order_id, od.order_status, oi.total_items, oi.total_price, oi.seller_id
    FROM order_items AS oi,orders AS od
    WHERE od.order_id = oi.order_id
)

SELECT *
FROM order_with_item