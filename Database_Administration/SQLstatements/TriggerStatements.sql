SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[EmpTitle]
  FROM [AdventureWorks2022].[dbo].[Employee]

  CREATE TRIGGER EmployeeInsert 
   ON Employee 
   AFTER INSERT
   AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	insert into EmployeeTriggerHistory values((select top(1) EmpID from employee),'insert')

END
GO

select * from EmployeeTriggerHistory