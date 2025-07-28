SELECT 
  oi.product_id,
  t.product_category_name_english AS category,
  DATE_TRUNC('month', o.order_approved_at) AS month,
  COUNT(*) AS units_sold,
  ROUND(AVG(oi.price), 2) AS ave_price,
  ROUND(SUM(oi.price), 2) AS total_revenue
FROM
  order_items oi
JOIN
  orders o ON oi.order_id = o.order_id
JOIN 
  products p ON oi.product_id = p.product_id
LEFT JOIN
  product_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY 
  oi.product_id, category, month
ORDER BY
  oi.product_id, month;
