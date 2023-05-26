-- WITH consequitive AS (
--        SELECT num, 
--        LEAD(num, 1) OVER() num1,
--        LEAD(num, 2) OVER() num2
--        FROM Logs
-- )

-- SELECT DISTINCT num AS ConsecutiveNums  FROM consequitive
-- WHERE
--        num=num1 AND
--        num=num2


SELECT DISTINCT(l1.num) AS ConsecutiveNums 
FROM logs l1, logs l2, logs l3
WHERE 
    l1.id = l2.id +1 AND
    l2.id = l3.id + 1 AND
    l1.num = l2.num AND
    l2.num = l3.num