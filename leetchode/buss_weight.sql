

WITH rolling_weight AS (

  SELECT person_id, person_name,

      SUM(weight) OVER(ORDER BY turn) total_weigth

  FROM Queue

)



SELECT person_name

FROM rolling_weight

WHERE total_weigth <= 1000

ORDER BY total_weigth DESC

LIMIT 1
