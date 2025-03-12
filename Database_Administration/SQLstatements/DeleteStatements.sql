create table salesstaff
(
staffId int not null primary key,
firstname nvarchar(50)not null,
lastname nvarchar(50)not null,
countryRegion nvarchar(50) not null,
)

select * from salesstaff
insert into salesstaff

select businessentityid,firstname,lastname,countryregionname from sales.vSalesPerson

delete from salesstaff

delete from salesstaff where countryRegion = 'united state' 

begin tran
delete from salesstaff where countryRegion = 'united state' 

commit
rollback tran

delete salesstaff
where staffid in
(select [businessEntityID] from sales.vsalesperson where saleslastyear = 0)


DELETE salesstaff
from sales.vsalesperson sp
inner join salesstaff ss
on sp.BusinessEntityID =ss.staffID
WHERE sp.SalesLastYear = 0