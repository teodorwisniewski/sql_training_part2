


SELECT COUNT(DISTINCT vot.SalesOrderID), 
	SUM(vot.LineTotal)
FROM V_Orders_Test vot


SELECT *,
	SUM(vot.LineTotal) OVER (ORDER BY vot.SalesOrderID) AS Running_total
FROM V_Orders_Test vot
ORDER BY vot.SalesOrderID


SELECT *,
	SUM(vot.LineTotal) OVER (PARTITION BY vot.SalesOrderID ORDER BY vot.SalesOrderDetailID) AS Running_total
FROM V_Orders_Test vot
ORDER BY vot.SalesOrderID



WITH order_running_totals AS (
	SELECT *,
		SUM(vot.LineTotal) OVER (ORDER BY vot.SalesOrderID) AS Running_total,
		DENSE_RANK() OVER (ORDER BY vot.SalesOrderID) AS order_count
	FROM V_Orders_Test vot
)

SELECT TOP 1 *
FROM order_running_totals
WHERE Running_total >= 300000
ORDER BY SalesOrderID





WITH order_running_totals AS (
	SELECT vot.SalesOrderID, SUM(vot.LineTotal) AS TotalOrderValue
	FROM V_Orders_Test vot
	GROUP BY vot.SalesOrderID
)

SELECT  SalesOrderID,
		TotalOrderValue,
		SUM(TotalOrderValue) OVER(ORDER BY SalesOrderID) AS tolling_sum, 
		ROW_NUMBER() OVER(ORDER BY SalesOrderID) AS ranking
FROM order_running_totals
ORDER BY SalesOrderID


