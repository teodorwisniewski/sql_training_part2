WITH values_expressions AS 

(

  SELECT e.*, v.value as left_values,  v2.value as right_values

  FROM Variables v

  JOIN Expressions e

  ON e.left_operand = v.name 

  JOIN Variables v2 ON e.right_operand = v2.name 

)



SELECT left_operand, operator, right_operand ,CASE

        WHEN operator='>' THEN  if(left_values > right_values, 'true', 'false')

        WHEN operator='=' THEN  if(left_values = right_values , 'true', 'false')

        WHEN operator='<' THEN  if(left_values < right_values, 'true', 'false')

      END AS value 

FROM values_expressions

  