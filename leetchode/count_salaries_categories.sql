WITH salaries AS (

  SELECT 

  CASE

    WHEN income < 20000 THEN "Low Salary"

    WHEN 20000 <= income and 50000 >= income THEN "Average Salary"

    ELSE "High Salary" END AS category       

  FROM Accounts

), categories AS (

  SELECT "Low Salary" AS category

  UNION

  SELECT "Average Salary" AS category

  UNION

  SELECT "High Salary" AS category

)



SELECT c.category, COUNT(s.category) AS accounts_count 

FROM categories c

LEFT JOIN salaries s

ON c.category = s.category

GROUP BY c.category

ORDER BY COUNT(s.category) DESC


