SELECT min(rate)
  FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

  SELECT count(*)
  FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

  SELECT sum(rate)
  FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

  print upper('dotnet') --can lso use lower for lower case
  print getdate()

    print day(getdate())
	  print month(getdate())
	    print year(getdate())

create table FuntionEmployee

(
EmpID int primary key,
FirstName varchar(50) null,
LastName varchar(50) null,
salary int null,
Address varchar(100) null,
)

insert into FuntionEmployee(EmpID,FirstName,LastName,salary,Address) values(1,'Mohan','Chauahn',22000,'Delhi')
insert into FuntionEmployee(EmpID,FirstName,LastName,salary,Address) values(2,'Asif','khan',15000,'Delhi')
insert into FuntionEmployee(EmpID,FirstName,LastName,salary,Address) values(3,'Bhuvnesh','Shakya',19000,'Noida')
insert into FuntionEmployee(EmpID,FirstName,LastName,salary,Address) values(4,'Deepak','Kumar',19000,'Noida')

select * from FuntionEmployee

create function fnGetEmpFullName
	(@firstName varchar(50), @lastName varchar(50))
	returns varchar (101)
	as
	begin
	return (select @firstName + ' ' +@lastName);
	end

	select dbo.fnGetEmpFullName (FirstName,LastName) as FullName , salary from FuntionEmployee

	select (FirstName,LastName) as FullName , salary from FuntionEmployee

	create function FnGetEmployee()
	returns Table
	as
	return (select * from FuntionEmployee)

	select * from dbo.FuntionEmployee


	CREATE FUNCTION fnGetMulEmployeen()
RETURNS @Emp TABLE
(
    Empid INT,
    FirstName VARCHAR(50),
    Salary INT
)
AS 
BEGIN 
    -- Insert all required columns into @Emp
    INSERT INTO @Emp 
    SELECT e.EmpID, e.FirstName, e.Salary FROM FuntionEmployee e;

    -- Update salary of first employee in @Emp (not affecting the original table)
    UPDATE @Emp 
    SET Salary = 25000 
    WHERE EmpID = 1;

    RETURN;
END;

SELECT * FROM fnGetMulEmployeen()