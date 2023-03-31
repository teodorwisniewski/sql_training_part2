


WITH club_Ranks AS (
	
	SELECT cs.CustomerID, cs.FromDate, cs.Club,
		CASE
			WHEN LOWER(cs.CLUB)='silver' THEN 1
			WHEN LOWER(cs.CLUB)='gold' THEN 2
			 ELSE 3
		END AS club_rank
	FROM Customer_Snapshot cs

), club_hierarchy AS
(
	SELECT cs.CustomerID,
	   cr.club_rank,
	   LAG(cr.club_rank) OVER (PARTITION BY cs.CustomerID ORDER BY cs.FromDate) AS previous_rank,
	   cr.club_rank - LAG(cr.club_rank, 1) OVER (PARTITION BY cs.CustomerID ORDER BY cs.FromDate) AS club_hierarchy_change
	FROM Customer_Snapshot cs
	INNER JOIN club_Ranks AS cr ON cs.CustomerID=cr.CustomerID
	AND cs.FromDate=cr.FromDate
)


SELECT * FROM club_hierarchy
WHERE club_hierarchy_change < 0



