(select *
FROM products
order BY price desc
LIMIT 4)
UNION all
(select *
FROM products
order BY price / weight desc
LIMIT 4)