--tast 1

SELECT 
  c.customer_id,
  c.name,
  c.email,
  c.location,
  c.contact,
  COUNT(o.order_id) AS total_orders
FROM 
  Customers as c
LEFT JOIN Orders as o ON o.customer_id = c.customer_id
GROUP BY 
  c.customer_id
ORDER BY 
  total_orders DESC;


 --task 2 

  SELECT 
  p.name AS product_name,
  o.quantity,
  (o.quantity * o.unit_price) AS total_amount,
  o.order_id
FROM 
  Order_Items as o
JOIN Products as p ON o.product_id = p.product_id
ORDER BY 
  o.order_id ASC;


--task 3

SELECT 
  ct.name AS category_name,
  SUM(o.quantity * o.unit_price) AS total_revenue
FROM 
  Categories as ct
JOIN Products as p ON ct.category_id = p.category_id
JOIN Order_Items as o ON p.product_id = o.product_id
GROUP BY 
  ct.name
ORDER BY 
  total_revenue DESC;


--task 4 

SELECT 
  c.name AS customer_name,
  SUM(o.total_amount) AS total_purchase_amount
FROM 
  Customers as c
JOIN Orders as o ON c.customer_id = o.customer_id
GROUP BY 
  c.customer_id
ORDER BY 
  total_purchase_amount DESC
LIMIT 5;

