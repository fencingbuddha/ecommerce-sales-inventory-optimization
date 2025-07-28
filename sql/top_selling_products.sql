SELECT 
	t.product_category_name_english AS category,
	oi.product_id,
	COUNT(*) AS total_items_sold
FROM
	order_items oi
JOIN
	products p ON oi.product_id = p.product_id
LEFT JOIN
	product_name_translation t
	ON p.product_category_name = t.product_category_name
GROUP BY
	t.product_category_name_english,
	oi.product_id
ORDER BY
	total_items_sold DESC
LIMIT 10;