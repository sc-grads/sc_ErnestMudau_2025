CREATE TRIGGER TR_Leaves_Audit
ON Leave
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO AuditLog (OperationType, TableName, RecordID, Details, TimesheetFileName)
    SELECT 
        CASE 
            WHEN EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted) THEN 'UPDATE'
            WHEN EXISTS (SELECT 1 FROM inserted) THEN 'INSERT'
            WHEN EXISTS (SELECT 1 FROM deleted) THEN 'DELETE'
        END,
        'Leaves',
        COALESCE(i.LeaveID, d.LeaveID),
        'LeaveType: ' + COALESCE(i.LeaveType, d.LeaveType) + 
        ', StartDate: ' + CONVERT(NVARCHAR(10), COALESCE(i.StartDate, d.StartDate), 120),
        COALESCE(i.TimesheetFileName, d.TimesheetFileName)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.LeaveID = d.LeaveID;
END;
GO