CREATE TRIGGER TR_Timesheets_Audit
ON Timesheets
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
        'Timesheets',
        COALESCE(i.TimesheetID, d.TimesheetID),
        'WorkDate: ' + CONVERT(NVARCHAR(10), COALESCE(i.WorkDate, d.WorkDate), 120) + 
        ', StartTime: ' + CONVERT(NVARCHAR(8), COALESCE(i.StartTime, d.StartTime), 108),
        COALESCE(i.TimesheetFileName, d.TimesheetFileName)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.TimesheetID = d.TimesheetID;
END;
GO