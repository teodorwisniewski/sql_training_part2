


SELECT COUNT(DISTINCT vot.SalesOrderID), 
	SUM(vot.LineTotal)
FROM V_Orders_Test vot


SELECT *,
	SUM(vot.LineTotal) OVER (ORDER BY vot.SalesOrderID) AS Running_total
FROM V_Orders_Test vot
ORDER BY vot.SalesOrderID


SELECT *,
	SUM(vot.LineTotal) OVER (PARTITION BY SalesOrderID ORDER BY vot.OrderDate) AS Running_total
FROM V_Orders_Test vot
ORDER BY vot.SalesOrderID