

WITH friends_user1_id AS
(
    SELECT user2_id 
    FROM Friendship 
    WHERE user1_id=1
    UNION 
    SELECT user1_id 
    FROM Friendship 
    WHERE user2_id=1
), aleady_liked_by_user1 AS (
    SELECT page_id
    FROM Likes
    WHERE user_id =1 
)

# SELECT * FROM friends_user1_id
SELECT DISTINCT page_id AS recommended_page 
FROM Likes
WHERE user_id IN (SELECT * FROM friends_user1_id)
AND page_id NOT IN (SELECT * FROM aleady_liked_by_user1)