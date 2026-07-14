-- execution des requetes avec duckdb .read './analyses/analyse_product.sql'

-- on calcule le nombre total de commande
SELECT count(*)
FROM read_csv_auto('data/olist_products_dataset.csv');

-- on fait une description de notre dataset 
DESCRIBE 'data/olist_products_dataset.csv';
-- on affiche une partie du dataset 
SELECT *
FROM read_csv_auto('data/olist_products_dataset.csv')
LIMIT 20;
-- on affiche le nombre de produit par categorie
SELECT product_category_name,  COUNT(*) total_par_categ   
FROM read_csv_auto('data/olist_products_dataset.csv')
GROUP BY  product_category_name       
ORDER BY total_par_categ DESC;

SUMMARIZE 'data/olist_products_dataset.csv';