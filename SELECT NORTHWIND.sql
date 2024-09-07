USE NORTHWND

SELECT * FROM Categories
SELECT * FROM Products

SELECT Products.*,Categories.*
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName, Categories.Description AS [Kategori Açýklama], Products.QuantityPerUnit, Products.UnitPrice, Products.UnitsInStock, Products.ReorderLevel, Products.Discontinued
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT p.ProductID, p.ProductName, c.CategoryName, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.ReorderLevel, p.Discontinued
FROM Products AS P
JOIN Categories AS C ON p.CategoryID = C.CategoryID


--Ürünleri Kategori adý ve tedarikçi adýyla yazýnýz

SELECT p.ProductID, p.ProductName, C.CategoryName, S.CompanyName,P.UnitPrice,P.UnitsInStock,P.ReorderLevel
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON S.SupplierID = S.SupplierID

--Sipraiþ vermem gereken ürünlerin id , isim, kategor, tedarikçi firma, firma yetkilisi, yetkili ünvan, telefon no

SELECT p.ProductID, p.ProductName, C.CategoryName, S.CompanyName, S.ContactName,S.ContactTitle,S.Phone,p.UnitPrice, P.UnitsInStock, P.ReorderLevel
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON p.SupplierID = S.SupplierID
WHERE p.UnitsInStock <= p.ReorderLevel AND p.Discontinued = 0 --AND s.CompanyName LIKE '%Ex%'

--Sipariþ detaylarýnda ürün adý satýþ fiyatý liste fiyatýyla yazýnýz

SELECT OD.OrderID, P.ProductName, p.UnitPrice AS [Liste Fiyatý], Od.UnitPrice AS [Satýþ Fiyatý], 
OD.Quantity AS Adet, OD.Quantity*OD.UnitPrice AS [Toplam Satýþ], P.UnitPrice-OD.UnitPrice AS [Ýndirim],
Od.Discount
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID =P.ProductID

SELECT EmployeeID, FirstName, LastName,TitleOfCourtesy
FROM Employees

SELECT EmployeeID, TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS Name
From Employees




