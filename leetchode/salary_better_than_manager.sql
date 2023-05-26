SELECT e1.name AS Employee
FROM Employee e1, Employee e2
WHERE e1.managerId  = e2.id and e1.managerId IS NOT NULL
AND e1.salary > e2.salary