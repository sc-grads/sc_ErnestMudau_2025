WITH RECURSIVE countdown(val) AS (
SELECT 11 AS val--initial, non-recursive query
UNION --every recursive cte will have a union
SELECT val - 1 FROM countdown WHERE val > 1 --recursive
)
SELECT * FROM countdown;

WITH RECURSIVE countdown(val) AS (
SELECT 11 AS val--initial, non-recursive query
UNION --every recursive cte will have a union
SELECT val - 2 FROM countdown WHERE val > 1 --recursive
)
SELECT * FROM countdown;