
WITH without_duplicates AS (
    SELECT DISTINCT *
    FROM Calls
), making_pairs AS (
    SELECT LEAST(from_id, to_id) AS person1,
           GREATEST(from_id, to_id) AS person2,
           duration
    FROM Calls
)

# SELECT *
# FROM making_pairs

SELECT person1, person2,
        COUNT(duration) AS call_count,
        SUM(duration) AS total_duration 
FROM making_pairs
GROUP BY person1, person2