create proc NameEmployees as
begin
    select EmployeeNumber, EmployeeFirstName, EmployeeLastName
    from tblEmployeA
end
go

NameEmployees
execute NameEmployees
exec NameEmployees