--subqueries in a where clause
select id
FROM orders
WHERE product_id in (
  select id FROM products WHERE price/weight > 50)