--if exists (select * from sys.procedures where name='AverageBalance')
--drop proc AverageBalance
go
create proc AverageBalance(@employeeNumberFrom int, @employeeNumberTo Int, @NumberOfRows Int OUTPUT) as
begin
	if exists (Select * from tblEmployee where EmployeeNumber between @employeeNumberFrom and @employeeNumberTo)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName 
		from tblEmployee
		where EmployeeNumber between @employeeNumberFrom and @employeeNumberTo
		SET @NumberOfRows = @@ROWCOUNT
		RETURN 0
	end
	ELSE 
	BEGIN
		SET @NumberOfRows = 0
		RETURN 1
	END
end