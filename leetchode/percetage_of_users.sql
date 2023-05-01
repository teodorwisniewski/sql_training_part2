





SELECT r.contest_id, ROUND(100*COUNT(*)/(SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY contest_id 
ORDER BY percentage DESC, contest_id


























# WITH total_user AS
# (
#     SELECT COUNT(DISTINCT user_id) AS cnt
#     FROM Users
# )

# SELECT contest_id, 
# ROUND(COUNT(user_id) * 100 / cnt,2) AS percentage
# FROM Register r, total_user t
# GROUP BY contest_id
# ORDER BY percentage DESC, contest_id