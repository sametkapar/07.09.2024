USE NORTHWND

SELECT * FROM Categories
SELECT * FROM Products

SELECT Products.*,Categories.*
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName, Categories.Description AS [Kategori A��klama], Products.QuantityPerUnit, Products.UnitPrice, Products.UnitsInStock, Products.ReorderLevel, Products.Discontinued
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT p.ProductID, p.ProductName, c.CategoryName, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.ReorderLevel, p.Discontinued
FROM Products AS P
JOIN Categories AS C ON p.CategoryID = C.CategoryID


--�r�nleri Kategori ad� ve tedarik�i ad�yla yaz�n�z

SELECT p.ProductID, p.ProductName, C.CategoryName, S.CompanyName,P.UnitPrice,P.UnitsInStock,P.ReorderLevel
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON S.SupplierID = S.SupplierID

--Siprai� vermem gereken �r�nlerin id , isim, kategor, tedarik�i firma, firma yetkilisi, yetkili �nvan, telefon no

SELECT p.ProductID, p.ProductName, C.CategoryName, S.CompanyName, S.ContactName,S.ContactTitle,S.Phone,p.UnitPrice, P.UnitsInStock, P.ReorderLevel
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON p.SupplierID = S.SupplierID
WHERE p.UnitsInStock <= p.ReorderLevel AND p.Discontinued = 0 --AND s.CompanyName LIKE '%Ex%'

--Sipari� detaylar�nda �r�n ad� sat�� fiyat� liste fiyat�yla yaz�n�z

SELECT OD.OrderID, P.ProductName, p.UnitPrice AS [Liste Fiyat�], Od.UnitPrice AS [Sat�� Fiyat�], 
OD.Quantity AS Adet, OD.Quantity*OD.UnitPrice AS [Toplam Sat��], P.UnitPrice-OD.UnitPrice AS [�ndirim],
Od.Discount
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID =P.ProductID

SELECT EmployeeID, FirstName, LastName,TitleOfCourtesy
FROM Employees

SELECT EmployeeID, TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS Name
From Employees




