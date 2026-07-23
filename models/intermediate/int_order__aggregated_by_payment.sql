WITH final_data AS (
    SELECT order_id, SUM(payment_value) AS total_payment
    FROM {{ ref('stg_order_payments_dataset') }}
    GROUP BY order_id
    ORDER BY total_payment DESC
)

SELECT * 
FROM final_data