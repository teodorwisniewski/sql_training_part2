WITH unique_products AS (
  SELECT DISTINCT product_id 
  FROM Products 
), change_date AS (
  SELECT *
  FROM Products
  WHERE change_date <= '2019-08-16'
), last_date AS (
  SELECT up.product_id, MAX(cd.change_date) as last_date
  FROM unique_products up 
  LEFT JOIN change_date cd
  ON up.product_id = cd.product_id 
  GROUP BY up.product_id 

)


SELECT up.product_id,  IFNULL(p.new_price, 10) AS price
FROM Products p 
JOIN last_date ld
ON p.product_id=ld.product_id AND p.change_date = ld.last_date
RIGHT JOIN unique_products up ON p.product_id=up.product_id