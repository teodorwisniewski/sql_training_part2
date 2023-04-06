WITH no_duplicates AS (
    SELECT DISTINCT *
    FROM Activity
    WHERE activity_date <= "2019-07-27" AND
    activity_date > DATE_ADD("2019-07-27", INTERVAL -30 DAY)
)

SELECT activity_date AS day, count(DISTINCT user_id) AS active_users 
FROM no_duplicates
GROUP BY activity_date 