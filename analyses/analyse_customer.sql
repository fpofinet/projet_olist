-- execution des requetes avec duckdb .read './analyses/analyse_customer.sql'

--- on affiche le nombre total de ligne de notre dataset
SELECT count(DISTINCT (customer_unique_id))
FROM read_csv_auto('data/olist_customers_dataset.csv');

-- ---  on affiche une vue limite de notre dataset
-- SELECT *
-- FROM read_csv_auto('data/olist_customers_dataset.csv')
-- LIMIT 20;

-- --- on fait une description de notre dataset 
DESCRIBE 'data/olist_customers_dataset.csv';

-- ---  on affiche le nombre de customer par customer_city
-- SELECT count(*) AS total, customer_city AS city
-- FROM read_csv_auto('data/olist_customers_dataset.csv')
-- GROUP BY customer_city
-- ORDER BY total;

-- ---  on affiche le nombre de customer par customer_state
-- SELECT count(*) AS total, customer_state AS state
-- FROM read_csv_auto('data/olist_customers_dataset.csv')
-- GROUP BY customer_state
-- ORDER BY total;

-- ---  on affiche le nombre total de customer_city 
-- SELECT DISTINCT COUNT(DISTINCT customer_city) AS total_city
-- FROM read_csv_auto('data/olist_customers_dataset.csv');

-- ---  on affiche le nombre total de customer_state 
-- SELECT DISTINCT COUNT(DISTINCT customer_state) AS total_state
-- FROM read_csv_auto('data/olist_customers_dataset.csv');

-- ---  on affiche le nombre total de customer via  customer_unique_id
-- SELECT DISTINCT COUNT( DISTINCT customer_unique_id) AS total_customer
-- FROM read_csv_auto('data/olist_customers_dataset.csv');

---  on affiche le nombre total de customer via  customer_unique_id
-- SELECT COUNT(* ) AS total_customer_unique_ID ,customer_unique_id
-- FROM read_csv_auto('data/olist_customers_dataset.csv')
-- -- WHERE total_customer_unique_ID > 2
-- GROUP BY customer_unique_id
-- ORDER BY total_customer_unique_ID DESC;


-- SELECT DISTINCT COUNT(* ),customer_id AS total_customer_ID
-- FROM read_csv_auto('data/olist_customers_dataset.csv')
-- GROUP BY customer_id;

--- on affiche quelques statistique de notre dataset
SUMMARIZE 'data/olist_customers_dataset.csv';