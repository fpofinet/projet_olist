WITH sellers AS(
    SELECT seller_id,seller_city,seller_state
    FROM {{ ref('stg_sellers_dataset') }}
),
order_reviews AS (
    SELECT review_id,order_id,review_score
    FROM {{ ref('stg_order_reviews_dataset') }}
),
orders AS (
    SELECT *
    FROM {{ ref('int_orders_with_items') }}
),
orders_with_review AS (
    SELECT o.order_id, o.seller_id, o.total_items, o.total_price, o.order_status, r.review_score
    FROM orders AS o, order_reviews AS r
    WHERE o.order_id = r.order_id
),
final AS (
    SELECT s.seller_id,SUM(total_items) as total_selled, SUM(total_price) AS total_ca,AVG(review_score) AS mean_review_score,seller_city,seller_state
    FROM sellers AS s, orders_with_review AS o
    WHERE o.seller_id = s.seller_id
    GROUP BY s.seller_id , seller_city,seller_state
)

SELECT * 
FROM final
