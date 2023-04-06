WITH max_experience AS (

  SELECT project_id,

    MAX(experience_years) max_experience

  FROM Project p

  INNER JOIN Employee USING(employee_id)

  GROUP BY project_id  

)



  SELECT p.project_id, p.employee_id 

  FROM Project p

  INNER JOIN Employee e USING(employee_id)

  INNER JOIN max_experience me ON

  p.project_id = me.project_id AND e.experience_years = me.max_experience
