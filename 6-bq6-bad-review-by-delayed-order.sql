-- Delivery & Operations -- 
-- 6.0 -- 
-- Apakah order yang lambat cenderung dapat review lebih buruk? -- 
SELECT 
	rev_score.order_id,
	rev_score.review_score, 
	delayed_delivery.order_delivered_customer_date, 
	delayed_delivery.order_estimated_delivery_date
FROM dbo.olist_order_reviews_dataset AS rev_score
JOIN dbo.olist_orders_dataset AS delayed_delivery
ON delayed_delivery.order_id = rev_score.order_id
WHERE order_delivered_customer_date > order_estimated_delivery_date
ORDER BY review_score ASC; 

-- V2.0 -- 

SELECT 
	CASE 
		WHEN order_delivered_customer_date > order_estimated_delivery_date
		THEN 'Delayed'
		ELSE 'On Time'
	END AS delivery_status,
	AVG(CAST(rev_score.review_score AS FLOAT)) AS average_review_score
FROM dbo.olist_order_reviews_dataset AS rev_score
JOIN dbo.olist_orders_dataset AS delayed_delivery
ON delayed_delivery.order_id = rev_score.order_id
WHERE order_delivered_customer_date IS NOT NULL 
GROUP BY 
	CASE 
		WHEN order_delivered_customer_date > order_estimated_delivery_date
		THEN 'Delayed'
		ELSE 'On Time'
	END;