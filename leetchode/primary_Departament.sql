-- WITH counted_departaments AS (
--   SELECT employee_id, COUNT(department_id) dept_count
--   FROM Employee 
--   GROUP BY employee_id 
-- ), only_one_dept AS (
--   SELECT e.employee_id, e.department_id 
--   FROM (SELECT * FROM counted_departaments WHERE dept_count=1) ond
--   JOIN Employee e
--   ON ond.employee_id = e.employee_id 
-- ), multiple_dept AS (
--   SELECT e.employee_id, e.department_id 
--   FROM (SELECT * FROM counted_departaments WHERE dept_count>1) ond
--   JOIN Employee e
--   ON ond.employee_id = e.employee_id   
--   WHERE e.primary_flag = 'Y'
-- ), joined_results AS (
--   SELECT *
--   FROM multiple_dept
--   UNION 
--   SELECT *
--   FROM only_one_dept
-- )

-- SELECT *
-- FROM joined_results
-- ORDER BY employee_id 


SELECT DISTINCT employee_id, department_id
FROM Employee
WHERE employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1
  )
  OR primary_flag = 'Y'
ORDER BY employee_id;