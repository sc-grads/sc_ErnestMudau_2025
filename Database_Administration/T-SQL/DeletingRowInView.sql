SELECT * FROM ViewByDepartment

delete from ViewByDepartment
where TotalAmount = 999.99 and EmployeeNumber = 132
GO

CREATE VIEW ViewSimple
as
SELECT * FROM tblTransaction
GO

BEGIN TRAN
delete from ViewSimple
where Amount = 999.99 and EmployeeNumber = 132
ROLLBACK TRAN