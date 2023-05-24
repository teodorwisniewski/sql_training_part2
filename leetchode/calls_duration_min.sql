
-- WITH without_duplicates AS (
--     SELECT DISTINCT *
--     FROM Calls
-- ), making_pairs AS (
--     SELECT LEAST(from_id, to_id) AS person1,
--            GREATEST(from_id, to_id) AS person2,
--            duration
--     FROM Calls
-- )

-- # SELECT *
-- # FROM making_pairs

-- SELECT person1, person2,
--         COUNT(duration) AS call_count,
--         SUM(duration) AS total_duration 
-- FROM making_pairs
-- GROUP BY person1, person2

select mgr.employee_id, mgr.name, COUNT(emp.employee_id) as reports_count, ROUND(AVG(emp.age)) as average_age
from employees emp join employees mgr
on emp.reports_to = mgr.employee_id
group by employee_id
order by employee_id
