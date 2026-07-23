WITH order_dates AS(
    SELECT *
    FROM {{ ref('stg_orders_dataset') }}
),

order_payment AS(
    SELECT *
    FROM {{ ref('int_order__aggregated_by_payment') }}
),

customers AS (
    SELECT customer_id,customer_unique_id,customer_city,customer_state
    FROM {{ ref('stg_customers_dataset') }}
),
final_data AS (
    SELECT 
        c.customer_unique_id,
        c.customer_state,
        c.customer_city,
        MAX(o.order_purchase_timestamp) AS max_order_date,
        Min(o.order_purchase_timestamp) AS min_order_date,
        COUNT(p.order_id) AS customer_total_orders,
        ROUND(ANY_VALUE(p.total_payment),2) AS customer_total_payment
    FROM 
        customers AS c, 
        order_dates AS o,
        order_payment AS p
    WHERE 
        c.customer_id = o.customer_id AND o.order_id= p.order_id
    GROUP BY c.customer_unique_id,c.customer_state,c.customer_city
)

SELECT * 
FROM final_data