use AdventureWorks2022
GO

SELECT * FROM PERSON.Address where postalCode ='98011'

SELECT * FROM PERSON.Address where postalCode !='98011'

SELECT * FROM PERSON.Address where postalCode <>'98011'

SELECT count(*) FROM PERSON.Address where postalCode ='98011'

SELECT count(*) FROM PERSON.Address where postalCode !='98011'

SELECT * FROM PERSON.Address where postalCode ='98011'

SELECT * FROM PERSON.Person where firstname like 'mat%'

SELECT max(rate) as payrate FROM [humanresources].[employeepayhistory]
SELECT min(rate) as payrate FROM [humanresources].[employeepayhistory]

SELECT * from [Production].[ProductCostHistory] where startdate = '2013-05-30 00:00:00.000'

SELECT * from [Production].[ProductCostHistory] where startdate = '2013-05-30 00:00:00.000' and standardcost >=200.00
SELECT * from [Production].[ProductCostHistory] where productid in (802,803,820,900)

SELECT * from [Production].[ProductCostHistory] where enddate is null
SELECT * from [Production].[ProductCostHistory] where enddate is not null

select * from [HumanResources].[EmployeePayHistory] ORDER BY RATE  ASC
select * from [HumanResources].[EmployeePayHistory] ORDER BY RATE  DESC

select * from [HumanResources].[EmployeePayHistory]  WHERE year(modifieddate) >= '2011' order by ModifiedDate desc
select count(*) as number_of_addresses 

select count(1) as count_of_product, color from [production].[Product] where color = 'yellow' group by  color

select count(1) as count_of_product, color from [production].[Product] group by  color having color = 'yellow'
select count(1) as count_of_product, color from [production].[Product] group by  color,size having size = '44'