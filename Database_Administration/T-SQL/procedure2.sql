--if exists (select * from sys.procedures where name='NameEmployees')
--if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create proc NameEmployees (@EmployeeNumber int) as
begin
    if exists (Select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
    begin
        select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
        from tblEmployeA
        where EmployeeNumber = @EmployeeNumber
        --and 
        --EmployeeNumber = 222
        --and lastname = 'Loret'
    end
end