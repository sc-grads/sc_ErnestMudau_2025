--26-------------------------------------------------------------------------------------------------------------------------------------------------
select [SalesOrderID]as ordernumber,[ProductID],[OrderQty] as quantity, sum([OrderQty]) as total, avg([OrderQty]) as avg,count([OrderQty]) as count
from [Sales].[SalesOrderDetail]
where SalesOrderID in (43659, 43664)
  and ProductID like '71%'
group by SalesOrderID,ProductID,OrderQty
order by SalesOrderID,ProductID;

--27------------------------------------------------------------------------------------------

select [SalesOrderID],sum([UnitPrice]*[OrderQty]) as orderidcost
from [Sales].[SalesOrderDetail]
group by [SalesOrderID]
having sum([UnitPrice]*[OrderQty]) > 100000

--28--------------------------------------------------------------------------------------------

select [ProductID],[Name]
from [Production].[Product]
where [Name] like 'Lock Washer%'
order by [ProductID] asc

--29-----------------------------------------------------------------------------
select [ProductID],[Name],[Color]
from [Production].[Product]
order by [ListPrice] asc

--30-------------------------------------------------------------------------------------
select [BusinessEntityID],[JobTitle],[HireDate]
from [HumanResources].[Employee]
order by year([HireDate]) asc

--31---------------------------------------------------------------------------------------
SELECT [LastName], [FirstName]
FROM [Person].[Person]
WHERE [LastName] LIKE 'R%'
ORDER BY [FirstName] ASC, [LastName] DESC ;
--32----------------------------------------------------------------------------------------
SELECT [BusinessEntityID], [SalariedFlag]
FROM [HumanResources].[Employee]
ORDER BY 
    CASE 
        WHEN [SalariedFlag] = 1 THEN -[BusinessEntityID]  -- Descending for true
        ELSE [BusinessEntityID]                           -- Ascending for false
    END;
--33-------------------------------------------------------------------------------------------

SELECT pp.[BusinessEntityID],pp.[LastName],st.Name,pcr.[Name]
FROM [Person].[Person] AS pp
JOIN [Sales].[SalesPerson] AS ss ON pp.[BusinessEntityID] = ss.[BusinessEntityID]
JOIN [Sales].[SalesTerritory] AS st ON ss.[TerritoryID] = st.TerritoryID
JOIN [Person].[CountryRegion] as pcr ON st.CountryRegionCode = pcr.CountryRegionCode
ORDER BY 
    CASE 
        WHEN pcr.[Name] = 'United States' THEN st.[Name]
        ELSE pcr.Name
    END;

--34-------------------------------------------------------------------------------------------
SELECT p.FirstName,p.LastName,
    ROW_NUMBER() OVER (ORDER BY a.PostalCode) AS [Row Number],
    RANK() OVER (ORDER BY a.PostalCode) AS [Rank],
    DENSE_RANK() OVER (ORDER BY a.PostalCode) AS [Dense Rank],
    NTILE(4) OVER (ORDER BY a.PostalCode) AS [Quartile],
    e.SalesYTD,a.PostalCode
FROM Sales.SalesPerson AS e
JOIN HumanResources.Employee AS hr ON e.BusinessEntityID = hr.BusinessEntityID
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
JOIN Person.Address AS a ON e.BusinessEntityID = a.AddressID
WHERE e.TerritoryID IS NOT NULL AND e.SalesYTD <> 0
ORDER BY a.PostalCode ASC;


--35--------------------------------------------------
SELECT [DepartmentID], [Name], [GroupName]
FROM [HumanResources].[Department]
ORDER BY [DepartmentID]
OFFSET 10 ROWS;

--36-------------------------------------------------
SELECT [DepartmentID], [Name], [GroupName]
FROM [HumanResources].[Department]
ORDER BY [DepartmentID]
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

--37----------------------------------------------------------
SELECT [Name], [Color], [ListPrice]
FROM [Production].[Product]
WHERE [Color] IN ('Red', 'Blue')
ORDER BY [ListPrice];

--38-------------------------------------------------------

SELECT p.Name,sod.SalesOrderID
FROM Production.Product AS p
FULL OUTER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
ORDER BY p.Name ;

--39----------------------------------------------------------------------------

SELECT p.Name,sod.SalesOrderID
FROM Production.Product AS p
LEFT JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
ORDER BY p.Name;

--40-------------------------------
SELECT p.Name,sod.SalesOrderID
FROM Production.Product AS p
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
ORDER BY p.Name;

--41-------------------------------------------------------------------
SELECT t.Name AS Territory,sp.BusinessEntityID
FROM Sales.SalesPerson AS sp
LEFT JOIN Sales.SalesTerritory AS t
ON sp.TerritoryID = t.TerritoryID
ORDER BY t.Name ASC;

--42---------------------------------------------------------------
SELECT p.FirstName + ' ' + p.LastName AS Name,a.City
FROM HumanResources.Employee AS e
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
JOIN Person.Address AS a ON e.BusinessEntityID = a.AddressID
ORDER BY p.LastName, p.FirstName;

--43----------------------------------------------------------------------------------------------
SELECT d.BusinessEntityID,d.FirstName,d.LastName
FROM ( SELECT BusinessEntityID,FirstName,LastName,PersonType
        FROM Person.Person) AS d
WHERE d.PersonType = 'IN' AND d.LastName = 'Adams'
ORDER BY d.FirstName ASC;
 
--44---------------------------------------------------------------------------------
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID <= 1500 AND LastName LIKE 'Al%' AND FirstName LIKE 'M%';
 
--45----------------------------------------------------------------------------------
SELECT p.ProductID, p.Name, ISNULL(p.Color, '') AS Color
FROM Production.Product p
JOIN (VALUES 
        ('Blade'),
        ('Crown Race'),
        ('AWC Logo Cap')
    ) AS d(Name)
        ON p.Name = d.Name;
 
--46------------------------------------------------------------------------------------------------
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, YEAR(OrderDate) AS SalesYear
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID, YEAR(OrderDate)
ORDER BY SalesPersonID, YEAR(OrderDate);
 
--47------------------------------------------------------------------------------------------------
 
SELECT AVG(TotalSales) AS [Average Sales Per Person]
FROM (
        SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
        GROUP BY SalesPersonID
    ) AS SalesTotals;
 
--48-----------------------------------------------------------------------------------------------
 
SELECT *
FROM Production.ProductPhoto
WHERE LargePhotoFileName LIKE '%green_%';
 
--49----------------------------------------------------------------------------------------------
 
SELECT a.AddressLine1,a.AddressLine2,a.City,a.PostalCode,sp.CountryRegionCode
FROM Person.Address a
JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
JOIN Person.BusinessEntityAddress bea ON a.AddressID = bea.AddressID
JOIN Person.AddressType at ON bea.AddressTypeID = at.AddressTypeID
WHERE sp.CountryRegionCode <> 'US' AND a.City LIKE 'Pa%' AND at.Name = 'Mailing';
 
--50-----------------------------------------------------------------------------------------
 
SELECT TOP 20 JobTitle, HireDate
FROM HumanResources.Employee
ORDER BY HireDate DESC;
