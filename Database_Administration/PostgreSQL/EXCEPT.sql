(select *
 FROM products
 order BY price DESC
 LIMIT 4
  )
EXCEPT -- it returns the everything on the leftside that is not common to the right
  (
    SELECT *
    FROM products
    order BY price / weight DESC
    LIMIT 4
    )