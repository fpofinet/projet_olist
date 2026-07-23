WITH order_dates AS(
    SELECT *
    FROM {{ ref('int_order__with_delay') }}
),

order_payment AS(
    SELECT *
    FROM {{ ref('int_order__aggregated_by_payment') }}
),
order_items_and_freight_value AS(
    SELECT *
    FROM {{ ref('int_order__joined_with_item_and_freight') }}
),
final_data AS (
    SELECT 
        od.order_id,
        od.order_status,
        od.livraison_delay,
        od.is_delayed,
        ov.total_item,
        ROUND(ov.total_price,2) AS total_item_price,
        ROUND(ov.total_freight_value,2),
        ROUND(op.total_payment,2) AS total_customer_payment
    FROM order_items_and_freight_value AS ov, order_payment AS op, order_dates AS od
    WHERE od.order_id = ov.order_id AND od.order_id= op.order_id
)

SELECT * 
FROM final_data