select DepartmentHead, sum(Amount) as SumOfAmount
from tblDepartment
left join tblEmployeA
on tblDepartment.Department = tblEmployeA.Department
left join tblTransaction
on tblEmployeA.EmployeeNumber = tblTransaction.EmployeeNumber
group by DepartmentHead
order by DepartmentHead

insert into tblDepartment(Department,DepartmentHead)
values ('Accounts', 'James')

select D.DepartmentHead, Sum(T.Amount) as SumOfAmount
from tblDepartment as D
left join tblEmployeA as E
on D.Department = E.Department
left join tblTransaction T
on E.EmployeeNumber = T.EmployeeNumber
group by D.DepartmentHead
order by D.DepartmentHead