-- execution des requetes avec duckdb .read './analyses/analyse_seller.sql'

-- on calcule le nombre total de commande
SELECT count(*)
FROM read_csv_auto('data/olist_sellers_dataset.csv');

-- on fait une description de notre dataset 
DESCRIBE 'data/olist_sellers_dataset.csv';
--on affiche une partie du dataset 
SELECT *
FROM read_csv_auto('data/olist_sellers_dataset.csv')
LIMIT 20;
-- -- on affiche les vendeurs par ville
-- SELECT COUNT(*) total_par_state,  seller_state  
-- FROM read_csv_auto('data/olist_sellers_dataset.csv')
-- GROUP BY  seller_state 
-- ORDER BY total_par_state DESC;

-- SELECT COUNT(*) total_par_ville,  seller_city   
-- FROM read_csv_auto('data/olist_sellers_dataset.csv')
-- GROUP BY  seller_city  
-- ORDER BY total_par_ville DESC;

-- SELECT COUNT(DISTINCT seller_id)
-- FROM read_csv_auto('data/olist_sellers_dataset.csv');

-- SUMMARIZE 'data/olist_sellers_dataset.csv';