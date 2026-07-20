WITH orders  AS (
    SELECT * 
    FROM {{ ref('stg_order_items_dataset') }}
),
order_review_score AS (
    SELECT review_id,order_id,review_score
    FROM {{ ref('stg_order_reviews_dataset') }}
),
order_with_score AS (
    SELECT o.order_id,o.seller_id,r.review_score
    FROM order_review_score AS r, orders AS o
    WHERE o.order_id = r.order_id
)
SELECT DISTINCT order_id,seller_id,review_score
FROM order_with_score