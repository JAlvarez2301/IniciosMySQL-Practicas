Use AdventureWorks2019;

SELECT *
FROM Sales.Customer;

/* Actividad 1 */

SELECT SUM(CustomerID) 
FROM Sales.Customer
GROUP BY TerritoryID;

/* Actividad 2 */

SELECT TOP 10 CreditCardID, ExpMonth, ExpYear
FROM sales.CreditCard
ORDER BY ExpYear DESC, ExpMonth DESC;

/* Actividad 3  */

SELECT TOP 3 ProductID, UnitPrice, UnitPrice*OrderQty as Ganancias
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC, PRODUCTID DESC;

/* Actividad 4 */

SELECT TOP 3 CustomerID, StoreID, SalesYTD
FROM Sales.SalesTerritory as territory, Sales.Customer as customer
WHERE territory.TerritoryID = customer.TerritoryID
ORDER BY SalesYTD DESC;

/* Actividad 5 */

SELECT Production.Product.ProductID	 , Production.ProductSubcategory.ProductSubCategoryID, Production.Product.Name, ListPrice, SellStartDate, Size, Production.ProductSubcategory.Name
FROM Production.Product, Production.ProductSubcategory
WHERE ProductSubcategory.ProductSubcategoryID  = Product.ProductSubcategoryID
AND Product.ProductID IN ( 
SELECT ProductID
FROM [Sales].[ShoppingCartItem]);


