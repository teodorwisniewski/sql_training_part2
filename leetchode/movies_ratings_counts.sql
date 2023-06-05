WITH active_user AS (

    SELECT u.name AS results  

    FROM Users u

    JOIN MovieRating  mr

    ON u.user_id = mr.user_id    

    GROUP BY    u.user_id, u.name      

    ORDER BY COUNT(*) DESC, u.name 

    LIMIT 1

), highest_average AS (

    SELECT m.title AS results  

    FROM Movies  m 

    JOIN MovieRating  mr

    ON mr.movie_id = m.movie_id    

    WHERE MONTH(created_at) = 2  and YEAR(created_at) = 2020

    GROUP BY m.movie_id, m.title     

    ORDER BY AVG(mr.rating) DESC, m.title

    LIMIT 1

)





SELECT *

FROM active_user

UNION ALL

SELECT *

FROM highest_average