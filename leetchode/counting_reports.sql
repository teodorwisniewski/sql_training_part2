WITH counting_reports AS
(
  Select reports_to, COUNT(*) as reports_count, ROUND(AVG(age), 0) AS average_age 
  FROM Employees e1
  WHERE reports_to IS NOT NULL
  GROUP BY reports_to 
)



SELECT cr.reports_to AS employee_id , e2.name, cr.reports_count, cr.average_age
FROM counting_reports cr
JOIN Employees e2 ON
e2.employee_id = cr.reports_to
ORDER BY employee_id