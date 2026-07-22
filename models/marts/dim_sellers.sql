WITH sellers AS(
    SELECT seller_id,seller_city,seller_state
    FROM {{ ref('stg_sellers_dataset') }}
),
total_by_seller AS(
    SELECT *
    FROM {{ ref('int_order__aggregated_by_seller') }}
),
avg_review_score_by AS (
    SELECT seller_id,AVG(review_score) AS r_score
    FROM {{ ref('int_order__with_review_score') }}
    GROUP BY seller_id
),
final AS (
    SELECT s.seller_id,s.seller_city,s.seller_state,t.total_revenue,t.total_product,r.r_score
    FROM sellers AS s, total_by_seller AS t, avg_review_score_by AS r
    WHERE s.seller_id = t.seller_id AND t.seller_id = r.seller_id
)

SELECT * REPLACE (
    ROUND(total_revenue, 2) AS total_revenue, 
    ROUND(r_score, 2) AS r_score
)
FROM final