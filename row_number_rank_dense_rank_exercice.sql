



WITH cus_ranking AS 
(
	SELECT cs.*,
	RANK () OVER (ORDER BY cs.FromDate) AS ranking
	FROM Customer_Snapshot AS cs
	WHERE cs.Manager = 'Jeremy' AND Club = 'Gold'
		AND cs.AccountType = 'Business'
)

SELECT * FROM cus_ranking
where ranking = 1

