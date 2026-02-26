-- Revenue and Sales Trend --
-- 2.0 --
-- Berapa jumlah order per bulan? Apakah trennya naik atau turun -- 
SELECT 
	YEAR(orders.order_purchase_timestamp) AS Purchase_Year, 
	MONTH(orders.order_purchase_timestamp) AS Purchase_Month,
	COUNT(orders.order_id) AS Total_Orders
FROM dbo.olist_orders_dataset AS orders
GROUP BY 
	YEAR(orders.order_purchase_timestamp),
	MONTH(orders.order_purchase_timestamp)
ORDER BY 
	Purchase_Year,
	Purchase_Month ASC; -- urutkan berdasarkan tahun dan bulan