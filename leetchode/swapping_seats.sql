

SELECT 
    (CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id = (SELECT MAX(id) FROM seat) THEN id
        ELSE id + 1
    END) AS id,
    student
FROM Seat
ORDER BY id

