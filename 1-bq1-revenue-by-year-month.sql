-- Revenue and Sales Trend -- 
-- 1.0 -- 
-- Berapa total revenue per bulan, dan bulan apa yang paling tinggi revenuenya? -- 
SELECT 
	YEAR(orders.order_purchase_timestamp) AS Year_of_Purchase, 
	MONTH(orders.order_purchase_timestamp) AS Month_of_Purchase,
	SUM(payments.payment_value) AS Total_Revenue
FROM dbo.olist_order_payments_dataset AS payments
JOIN dbo.olist_orders_dataset AS orders
ON payments.order_id = orders.order_id
GROUP BY YEAR(orders.order_purchase_timestamp), MONTH(orders.order_purchase_timestamp)
ORDER BY Total_Revenue DESC; -- cari bulan mana yang tertinggi

-- 1.1 -- 
SELECT 
	YEAR(orders.order_purchase_timestamp) AS Year_of_Purchase, 
	MONTH(orders.order_purchase_timestamp) AS Month_of_Purchase,
	SUM(payments.payment_value) AS Total_Revenue
FROM dbo.olist_order_payments_dataset AS payments
JOIN dbo.olist_orders_dataset AS orders
ON payments.order_id = orders.order_id
GROUP BY YEAR(orders.order_purchase_timestamp), MONTH(orders.order_purchase_timestamp)
ORDER BY Year_of_Purchase, Month_of_Purchase ASC; -- urutkan berdasarkan tahun dan bulan