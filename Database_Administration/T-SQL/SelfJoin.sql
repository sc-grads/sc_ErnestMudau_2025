begin tran
alter table tblEmployeA
add Manager int
go
update tblEmployeA
set Manager = ((EmployeeNumber-123)/10)+123
where EmployeeNumber>=123
select E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, E.Manager,
M.EmployeeNumber, M.EmployeeFirstName, M.EmployeeLastName, M.Manager
from tblEmployee as E
left JOIN tblEmployeA as M
on E.Manager = M.EmployeeNumber
rollback tran