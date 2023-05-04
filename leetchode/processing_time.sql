SELECT s.machine_id, ROUND(AVG(e.timestamp-s.timestamp), 3) AS processing_time
FROM Activity s JOIN Activity e ON
    s.machine_id = e.machine_id AND s.process_id = e.process_id AND
    s.activity_type = 'start' AND e.activity_type = 'end'
GROUP BY s.machine_id

-- WITH processing_time_per_machine_per_process AS (

--     SELECT machine_id, process_id, SUM(timestamp) AS processing_time 

--   FROM (

--     SELECT machine_id,

--         process_id,

--         CASE 

--           WHEN activity_type='end' THEN timestamp 

--           ELSE -timestamp END AS timestamp 

--     FROM Activity

--   ) t

--   GROUP BY machine_id, process_id

-- )



-- SELECT machine_id, ROUND(AVG(processing_time), 3)  AS processing_time    

-- FROM processing_time_per_machine_per_process

-- GROUP BY machine_id 


