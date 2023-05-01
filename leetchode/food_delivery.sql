WITH classfied_deliveries AS (

    SELECT delivery_id, customer_id,

        CASE

            WHEN order_date=customer_pref_delivery_date THEN 1

    ELSE 0 END AS type_of_transaction

    FROM Delivery



)





SELECT ROUND(100*SUM(cd.type_of_transaction)/(SELECT COUNT(*) FROM Delivery), 2) AS immediate_percentage 

FROM classfied_deliveries cd
