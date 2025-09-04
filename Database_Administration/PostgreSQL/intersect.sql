(select *
 FROM products
 order BY price DESC
 LIMIT 4
  )
INTERSECT --you only see rows that are common in both queries
  (
    SELECT *
    FROM products
    order BY price / weight DESC
    LIMIT 4
    )