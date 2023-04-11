# Write your MySQL query statement below

WITH approved_counts AS

(

    SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country, 

          count(amount) AS approved_count,

          sum(amount) AS approved_total_amount

    FROM Transactions 

    WHERE state='approved'

    GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country 

), all_counts AS (

  SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country, 

       count(amount) AS trans_count,

      sum(amount) AS trans_total_amount  

FROM Transactions t

GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country 

)



SELECT al.month, al.country, al.trans_count, COALESCE(ap.approved_count, 0) AS approved_count,

       al.trans_total_amount, COALESCE(ap.approved_total_amount, 0) AS approved_total_amount

FROM all_counts al

LEFT JOIN approved_counts ap

ON al.month = ap.month 

AND al.country = ap.country 