

insert into dbo.Employee(EmpID,EmpName,EmpTitle)

VALUES (3,'Dino','Sales Associate'),
	   (11,'Dino','Sr Sales Associate'),
	   (79,'James','Sales Manager')

select * from [dbo].[employee]
select * from [dbo].[Sales]

select * from [dbo].[employee] e
join [dbo].[sales] s
on e.empname=s.empname

select column names
from table name1 join table name2
on column-name1 = column-name 2