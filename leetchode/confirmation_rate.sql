WITH countings AS (

    SELECT s.user_id, COUNT(*) as total_count, SUM(

    CASE 

      WHEN action='confirmed' THEN 1

      ELSE 0 END

  ) AS confirmed_count

  FROM Signups s

  LEFT JOIN Confirmations c

  ON s.user_id = c.user_id 

  GROUP BY user_id 

)



SELECT user_id, ROUND(confirmed_count/total_count,2) AS confirmation_rate 

FROM countings


-- SELECT 
--   s.user_id,
--   ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1.00 ELSE 0.00 END),2) AS confirmation_rate
-- FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
-- GROUP BY s.user_id