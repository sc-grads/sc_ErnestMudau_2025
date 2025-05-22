-- nested trigger

-- Create a trigger on tblTransaction
ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    -- Capture the nested level of the trigger execution
    SELECT @@NESTLEVEL AS Nest_Level;
    
    -- Log the inserted records
    SELECT * FROM Inserted;
    
    -- Log the deleted records
    SELECT * FROM Deleted;
END
GO

-- Test the trigger with a transaction
BEGIN TRAN
    INSERT INTO tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
    VALUES (123, '2015-07-10', 123);
ROLLBACK TRAN;

BEGIN TRAN
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132
DELETE FROM ViewByDepartment
WHERE TotalAmount = -2.77 AND EmployeeNumber = 132
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132
ROLLBACK TRAN
