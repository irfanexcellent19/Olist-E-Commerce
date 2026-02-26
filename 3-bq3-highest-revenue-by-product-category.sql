-- Product Performance -- 
-- 3.0 -- 
-- Kategori produk apa yang menghasilkan revenue tertinggi -- 
SELECT 
	products.product_category_name AS Product_Category, 
	SUM(payments.payment_value) AS Total_Revenue
FROM dbo.olist_order_payments_dataset AS payments -- cari revenue (angka)
JOIN dbo.olist_order_items_dataset AS items -- cari jembatan -- JOIN (1)
ON payments.order_id = items.order_id
JOIN dbo.olist_products_dataset AS products -- cari konteks -- JOIN (2)
ON items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY Total_Revenue DESC; -- urutkan berdasarkan revenue tertinggi