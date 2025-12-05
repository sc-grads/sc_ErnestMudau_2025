-- 1st problem
select *
from [HumanResources].[Employee]
order by [JobTitle] ASC

----------------------------------------------------------

--2
SELECT *
FROM [Person].[Person] AS employee
ORDER BY employee.LastName ASC;
------------------------------------------------------------
--3
Select FirstName, LastName, BusinessEntityID AS Employee_id
FROM [Person].[Person] order by LastName;
----------------------------------------------------------
--4
select [ProductID],[ProductNumber],[Name]
from[Production].[Product]
where [ProductLine] = 'T' AND [SellStartDate] is not null
order by [Name] asc
------------------------------------------------------------
--5

select [SalesOrderID],[CustomerID],[OrderDate],[SubTotal], ([TaxAmt]/[SubTotal])*100 as tax_percent
from [Sales].[SalesOrderHeader]
order by [SubTotal] desc

----------------------------------------------------------------

--6
select distinct[JobTitle]
from [HumanResources].[Employee]
----------------------------------------------------------------
--7
select [CustomerID],sum([Freight]) as total_freight
from [Sales].[SalesOrderHeader]
group by [CustomerID]
order by [CustomerID]

--8
--------------------------------------------------------------
select [CustomerID],[SalesPersonID],avg([SubTotal]) as avg_subtotaa, sum([Freight]) as total_freight
from [Sales].[SalesOrderHeader]
group by [CustomerID],[SalesPersonID]
order by [CustomerID] desc

--9------------------------------------------------------------------

select [ProductID],sum([Quantity]) as total_quantity
from [Production].[ProductInventory]
where [Shelf] = 'A' or [Shelf] = 'C' or [Shelf]= 'H' 
group by [ProductID]
having sum([Quantity]) > 500
order by [ProductID] asc

--10------------------------------------------------------------------

select sum([Quantity]) as total_quantity
from [Production].[ProductInventory]
group by [LocationID]*10

--11-------------------------------------------------------------------

select p.[BusinessEntityID],p.[FirstName],p.[LastName],pn.[PhoneNumber]
from [Person].[Person] as p
join [Person].[PersonPhone] as pn
on p.[BusinessEntityID] = pn.[BusinessEntityID]
where [LastName] like 'L%'
order by [LastName],[FirstName] asc 

--12--------------------------------------------------------------------

select sum([SalesPersonID]) as salespersonid,[CustomerID],sum([SubTotal]) as sum_subtotal
from [Sales].[SalesOrderHeader]
group by [SalesPersonID],[CustomerID]
having sum([SalesPersonID]) is not null
order by sum([SalesPersonID]) asc

--13---------------------------------------------------------------------------

select [LocationID],[Shelf],sum([Quantity]) as totalquantity
from [Production].[ProductInventory] 
group by [LocationID],[Shelf]


select [LocationID],[Shelf],sum([Quantity]) as total_quantity
from [Production].[ProductInventory]
group by rollup([LocationID],[Shelf])


select sum([Quantity])
from [Production].[ProductInventory]

--14----------------------------------------------------------------

select [LocationID],[Shelf],sum([Quantity]) as total_quantity
from [Production].[ProductInventory]
group by rollup([LocationID],[Shelf])

--15-------------------------------------------------------------------

select [LocationID],sum([Quantity]) as total_quantity
from [Production].[ProductInventory]
group by rollup([LocationID])
order by [LocationID] asc

--16--------------------------------------------------------------------

select [City], count(*) noofemployee
from [Person].[Address]
group by [City] 
order by city asc

--17------------------------------------------------------------------------
select year([OrderDate]) as 'year',sum([TotalDue]) 'Order Amount'
from [Sales].[SalesOrderHeader]
group by year([OrderDate])
order by year([OrderDate])

--18--------------------------------------------------------------------------
select year([OrderDate]) as 'year',sum([TotalDue]) as 'Order Amount'
from [Sales].[SalesOrderHeader]
group by year([OrderDate])
having year([OrderDate]) <= 2016
order by year([OrderDate])

--19--------------------------------------------------------------------------------

select [ContactTypeID],[Name]
from [Person].[ContactType]
where name like '%Manager' or name like 'Manager%'

--20----------------------------------------------------------------------------------

SELECT 
    c.BusinessEntityID,
    p.LastName,
    p.FirstName
FROM 
    Person.Person AS p
JOIN 
    HumanResources.Employee AS e ON p.BusinessEntityID = e.BusinessEntityID
JOIN 
    Person.BusinessEntityContact AS c ON p.BusinessEntityID = c.[BusinessEntityID]

	where [ContactTypeID] = 15

--21---------------------------------------------------------------------------------------


SELECT

  ROW_NUMBER() OVER (PARTITION BY a.PostalCode ORDER BY sp.SalesYTD DESC) AS RowNum,

  p.LastName,

  sp.SalesYTD,

  a.PostalCode

FROM Sales.SalesPerson AS sp

JOIN Person.Person AS p

  ON sp.BusinessEntityID = p.BusinessEntityID

JOIN Person.BusinessEntityAddress AS bea

  ON p.BusinessEntityID = bea.BusinessEntityID

JOIN Person.Address AS a

  ON bea.AddressID = a.AddressID

WHERE sp.TerritoryID IS NOT NULL    -- salesperson "belongs to a territory"

  AND sp.SalesYTD <> 0              -- SalesYTD is not zero

  AND a.PostalCode IS NOT NULL

ORDER BY a.PostalCode ASC, RowNum ASC;
 
 
--Question 22

SELECT

  ct.ContactTypeID,

  ct.Name AS ContactTypeName,

  COUNT(*) AS BusinessEntityContact

FROM Person.BusinessEntityContact AS bec

JOIN Person.ContactType AS ct

  ON bec.ContactTypeID = ct.ContactTypeID

GROUP BY

  ct.ContactTypeID,

  ct.Name

HAVING

  COUNT(*) >= 100

ORDER BY

  BusinessEntityContact DESC;
 
 
--Question 23

SELECT

    CONVERT(date, eph.RateChangeDate) AS RateChangeDate,

    LTRIM(

        RTRIM(

            p.FirstName + ' ' +

            ISNULL(p.MiddleName + ' ', '') +

            p.LastName

        )

    ) AS NameInFull,

    (eph.Rate * 40) AS WeeklySalary

FROM HumanResources.EmployeePayHistory eph

JOIN HumanResources.Employee e

    ON eph.BusinessEntityID = e.BusinessEntityID

JOIN Person.Person p

    ON p.BusinessEntityID = e.BusinessEntityID

ORDER BY

    NameInFull ASC;
 
 
--Question 24

;WITH LatestRate AS (

    SELECT

        eph.BusinessEntityID,

        eph.Rate,

        eph.RateChangeDate,

        ROW_NUMBER() OVER (

            PARTITION BY eph.BusinessEntityID 

            ORDER BY eph.RateChangeDate DESC

        ) AS rn

    FROM HumanResources.EmployeePayHistory eph

)

SELECT

    CONVERT(date, lr.RateChangeDate) AS RateChangeDate,

    LTRIM(RTRIM(

        p.FirstName + ' ' + 

        ISNULL(p.MiddleName + ' ', '') + 

        p.LastName

    )) AS NameInFull,

    (lr.Rate * 40) AS WeeklySalary

FROM LatestRate lr

JOIN HumanResources.Employee e

    ON lr.BusinessEntityID = e.BusinessEntityID

JOIN Person.Person p

    ON p.BusinessEntityID = e.BusinessEntityID

WHERE lr.rn = 1

ORDER BY NameInFull ASC;
 
 
--Question 25

SELECT

    sod.SalesOrderID,

    sod.ProductID,

    sod.OrderQty,

    SUM(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS SumOrderQty,

    AVG(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS AvgOrderQty,

    COUNT(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS CountOrderQty,

    MAX(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS MaxOrderQty,

    MIN(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS MinOrderQty

FROM Sales.SalesOrderDetail sod

WHERE sod.SalesOrderID IN (43659, 43664);

 