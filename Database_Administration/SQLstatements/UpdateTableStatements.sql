

select * from Salestaff

update SaleStaff SET salesquota = 500000
update Salestaff set SalesQuota = SalesQuota + 1500000,salesytd = 500,SalesLastYear=SalesLastYear*1.50

update SaleStaff SET TerritoryName = 'UK' WHERE TerritoryName = 'United Kingdom'
update SaleStaff SET TerritoryName = 'UK' WHERE TerritoryName is null and FullName = 'Dyed Abbas'
update SaleStaff SET TerritoryName = 'UK' WHERE territorygroup = 'europe'

update salestaff set salesquota = sp.SalesQuota
from salestaff ss
inner join sales.vsalesperson sp
on ss.fullname = (sp.firstname +' '+sp.lastname)