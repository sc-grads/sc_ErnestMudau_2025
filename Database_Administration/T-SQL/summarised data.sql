select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployeA
group by left(EmployeeLastName,1)
order by count(*) DESC --left(EmployeeLastName,1)


select top 5 left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployeA
group by left(EmployeeLastName,1)
order by count(*) DESC --left(EmployeeLastName,1)


select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployeA
where 1=1
group by left(EmployeeLastName,1)
having count(*) > 50
order by count(*) DESC


select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployeA
where 1=1
group by left(EmployeeLastName,1)
having count(*) > 50
order by count(*) DESC