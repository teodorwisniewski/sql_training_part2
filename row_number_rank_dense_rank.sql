
WITH ranking AS (
	select cs.CustomerID,
	cs.HasMortgage,
	cs.FromDate,
	ROW_NUMBER() OVER (PARTITION BY cs.CustomerID ORDER BY cs.FromDate) rn

	from Customer_Snapshot cs
	WHERE cs.HasMortgage =1
)


SELECT * FROM ranking
where rn=1



select cs2.CustomerID,
	MIN(cs2.FromDate) AS first_occurance_date
	from Customer_Snapshot cs2
	WHERE cs2.HasMortgage =1
	GROUP BY cs2.CustomerID