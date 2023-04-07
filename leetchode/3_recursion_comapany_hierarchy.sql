
WITH RECURSIVE cte AS (
    SELECT employee_id FROM Employees WHERE employee_id <> 1 AND manager_id = 1
    UNION
    SELECT t1.employee_id FROM Employees t1
    INNER JOIN cte ON t1.manager_id = cte.employee_id
)


SELECT * 
FROM cte