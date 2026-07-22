WITH orders  AS (
    SELECT * 
    FROM {{ ref('stg_orders_dataset') }}
    WHERE order_delivered_carrier_date IS NOT NULL
        AND order_approved_at IS NOT NULL
        AND order_delivered_customer_date IS NOT NULL 
        AND order_delivered_carrier_date < order_delivered_customer_date 
), 
final_data AS (
    SELECT order_id,order_status, 
        DATE_DIFF('day', order_purchase_timestamp,order_delivered_customer_date) AS livraison_delay,
        CASE
            WHEN order_delivered_customer_date <= order_estimated_delivery_date
                THEN 0
                ELSE 1
        END AS is_delayed
    FROM orders as o
)

SELECT *
FROM final_data

