SELECT 
  t.product_category_name_english AS category,
  DATE_TRUNC('month'), o.order_approved_at) AS month,
  COUNT(*) AS total_items_sold,
  ROUND(SUM(oi.price), 2) AS total_revenue
FROM
  order_items oi
JOIN 
  orders o ON oi.order_id = o.order_id
JOIN 
  products p ON oi.product_id = p.product_id
LEFT JOIN
  product_category_name_translation t
    ON p.product_category_name = t.product_category_name
WHERE
  o.order_approved_at IS NOT NULL
GROUP BY
  t.product_category_name_english,
  DATE_TRUNC('month', o.order_approved_at)
ORDER BY 
  month,
  total_items_sold;
