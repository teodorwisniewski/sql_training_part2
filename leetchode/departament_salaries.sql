WITH max_salaries AS(

  SELECT e.departmentId, d.name AS Department, MAX(e.salary) AS Salary

  FROM Employee e

  JOIN Department d

  ON e.departmentId = d.id

  GROUP BY e.departmentId, d.name

)



SELECT Department, e.name AS Employee, ms.Salary

FROM Employee e

JOIN max_salaries ms

ON e.salary = ms.Salary AND ms.departmentId=e.departmentId 


