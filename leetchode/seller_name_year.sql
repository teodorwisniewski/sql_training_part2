WITH seller_name_2020 AS (

  SELECT o.seller_id   

  FROM Orders o 

  INNER JOIN Seller  s 

  ON o.seller_id = s.seller_id

  WHERE YEAR(sale_date) = '2020'

)



SELECT seller_name 

FROM Seller 

WHERE seller_id NOT IN (

  SELECT * FROM seller_name_2020

)

ORDER BY 1




