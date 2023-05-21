WITH first_year AS (
  SELECT product_id, MIN(year) as first_year
  FROM Sales 
  GROUP BY product_id
), sales_first_year AS (
  SELECT s.*
  FROM Sales s
  WHERE (product_id, year) IN
  (
    SELECT * FROM first_year
  )
)


SELECT product_id, year AS first_year, quantity, price 
FROM sales_first_year