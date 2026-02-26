-- Delivery & Operations -- 
-- 5.0 -- 
-- Berapa rata - rata keterlambatan pengiriman (est vs act)? -- 
SELECT 
	AVG(DATEDIFF(DAY, o.order_estimated_delivery_date, o.order_delivered_customer_date)) AS average_delivery_delay
FROM dbo.olist_orders_dataset AS o
WHERE o.order_delivered_customer_date IS NOT NULL