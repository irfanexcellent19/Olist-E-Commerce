-- Product Performance -- 
-- 4.0 -- 
-- Kategori produk apa yang paling banyak di order? -- 
SELECT
	products.product_category_name, 
	COUNT(quantity.order_id) AS total_orders
FROM dbo.olist_orders_dataset AS quantity
JOIN dbo.olist_order_items_dataset AS items
ON quantity.order_id = items.order_id
JOIN dbo.olist_products_dataset AS products
ON items.product_id = products.product_id
GROUP BY products.product_category_name 
ORDER BY total_orders DESC; 