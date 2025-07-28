SELECT
  t.product_category_name_english AS category,
  DATE_TRUNC('month', o.order_approved_at) AS month,
  COUNT(*) AS items_sold,
  ROUND(SUM(oi.price), 2) AS total_sales
FROM
  order_items oi
JOIN
  orders o ON oi.product_id = p.product_id
LEFT JOIN
  product_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY
  t.product_category_name_english, month
ORDER BY 
  month, total_sales DESC;
