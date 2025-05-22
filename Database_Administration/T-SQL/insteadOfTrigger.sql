alter TRIGGER tr_ViewByDepartment
ON dbo.ViewByDepartment
INSTEAD OF DELETE
AS
BEGIN
    declare @EmployeeNumber as int
    declare @DateOfTransaction as smalldatetime
    declare @Amount as smallmoney

    select EmployeeNumber, DateOfTransaction, TotalAmount
    from deleted
    --SELECT * FROM deleted

    delete from tblTransaction as T
    where T.EmployeeNumber = @EmployeeNumber
    and T.DateOfTransaction = @DateOfTransaction
    and T.Amount = @Amount
END

BEGIN TRAN
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRAN