

WITH product_detail AS (
	SELECT p.ProductID,
	   p.Name,
	   p.StandardCost,
	   p.ListPrice,
	   (p.ListPrice-p.StandardCost)/p.StandardCost AS Margin
	FROM SalesLT.Product p
), actualSalesPrice AS (
	SELECT vot.*, 
		   d.StandardCost,
		   (vot.LineTotal/vot.OrderQty) AS ActualItemPrice
	FROM V_Orders_Test vot
	JOIN product_detail d
	ON vot.ProductID = d.ProductID
), salesStats AS (
	SELECT asp.ProductID,
	   AVG(asp.LineTotal/asp.OrderQty) AS AvgRealPrice,
	   SUM(asp.LineTotal) AS TotalSalesPerProduct,
	   MAX(asp.StandardCost) AS StandardCost
	FROM actualSalesPrice asp
	GROUP BY asp.ProductID
), SalesNtilesPerProduct AS (
	SELECT 
		*,
		st.AvgRealPrice/st.StandardCost AS ProfitRatio,
		NTILE(5) OVER (ORDER BY st.TotalSalesPerProduct DESC) AS Ntiles,
		st.TotalSalesPerProduct/st.StandardCost AS profitabilityPerProduct
	FROM salesStats st
	
)


SELECT *, AVG(ProfitRatio) OVER (PARTITION BY Ntiles) AS AvgProfitRationInNtile
FROM SalesNtilesPerProduct






 