-- execution des requetes avec duckdb .read './analyses/analyse_order.sql'

-- -- on calcule le nombre total de commande
-- SELECT count(*)
-- FROM read_csv_auto('data/olist_orders_dataset.csv');

-- on fait une description de notre dataset 
DESCRIBE 'data/olist_orders_dataset.csv';
-- -- On compte les commandes qui ont une date de livraison effective superieur a la date estime 
-- SELECT COUNT(*)
-- FROM read_csv_auto('data/olist_orders_dataset.csv')
-- WHERE order_estimated_delivery_date < order_delivered_customer_date

-- -- on affiche une petite partie des donnees 
-- SELECT *
-- FROM  read_csv_auto('data/olist_orders_dataset.csv')
-- LIMIT 20;
-- SUMMARIZE 'data/olist_orders_dataset.csv';

-- SELECT count(*)
-- FROM read_csv_auto('data/olist_order_items_dataset.csv');

--- on fait une description du dataset des produits de la commande

DESCRIBE 'data/olist_order_items_dataset.csv';
-- -- on affiche une petite partie des donnees
-- SELECT *
-- FROM  read_csv_auto('data/olist_order_items_dataset.csv')
-- LIMIT 20;
----------------------
SELECT DISTINCT seller_id , order_id, COUNT (*) as tt
FROM  read_csv_auto('data/olist_order_items_dataset.csv')
GROUP BY order_id, seller_id
ORDER BY tt DESC;
-----------------------------------------------------------------------------
SELECT DISTINCT order_id,seller_id
FROM  read_csv_auto('data/olist_order_items_dataset.csv');

-----------------------------------------------------------------
-- SELECT order_id, COUNT(*), SUM(price), seller_id
-- FROM  read_csv_auto('data/olist_order_items_dataset.csv')
-- GROUP BY order_id, seller_id
-- ORDER BY COUNT(*) DESC;

-- SUMMARIZE 'data/olist_order_items_dataset.csv';

-- SELECT count(*)
-- FROM read_csv_auto('data/olist_order_reviews_dataset.csv');
-- --- on fait une description du dataset order reviews
DESCRIBE 'data/olist_order_reviews_dataset.csv';
-- -- on affiche une petite partie des donnees
-- SELECT *
-- FROM  read_csv_auto('data/olist_order_reviews_dataset.csv')
-- LIMIT 20;
-- --- On verifie s'il y'a des reviews qui ont des dates incoherentes
-- SELECT COUNT(*) AS total_aberrante
-- FROM  read_csv_auto('data/olist_order_reviews_dataset.csv')
-- WHERE review_creation_date > review_answer_timestamp;

-- SUMMARIZE 'data/olist_order_reviews_dataset.csv';

-- SELECT count(*)
-- FROM read_csv_auto('data/olist_order_payments_dataset.csv');
-- --- on fait une description du dataset
-- DESCRIBE 'data/olist_order_payments_dataset.csv';
-- -- -- on affiche une petite partie des donnees 
-- -- SELECT *
-- -- FROM  read_csv_auto('data/olist_order_payments_dataset.csv')
-- -- LIMIT 20;

-- -- --- on affiche quelques statistique de notre dataset
-- SUMMARIZE 'data/olist_order_payments_dataset.csv';
-- SELECT COUNT(*), payment_type 
-- FROM read_csv_auto('data/olist_order_payments_dataset.csv')
-- GROUP BY payment_type;


