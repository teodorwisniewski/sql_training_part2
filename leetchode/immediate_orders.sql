WITH delivery_table AS (

  SELECT delivery_id, customer_id, order_date,

        CASE 

        WHEN order_date=customer_pref_delivery_date THEN 'immediate'

        ELSE 'scheduled' END AS order_type

  FROM Delivery



), first_orders AS (

  SELECT customer_id, MIN(order_date) AS first_order_date

  FROM delivery_table

  GROUP BY customer_id

), first_order_with_order_type AS (

  SELECT dt.*

  FROM delivery_table dt

  JOIN first_orders fo

  ON dt.customer_id = fo.customer_id AND fo.first_order_date = dt.order_date

)







SELECT ROUND(100.0*(SELECT COUNT(*) FROM first_order_with_order_type

WHERE order_type='immediate')/COUNT(*),2) AS immediate_percentage 

FROM first_order_with_order_type dt
