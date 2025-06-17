CREATE TRIGGER TR_Consultants_Audit
ON Consultant
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
        'Consultants',
        COALESCE(i.ConsultantID, d.ConsultantID),
        'ConsultantName: ' + COALESCE(i.ConsultantName, d.ConsultantName),
        (SELECT TOP 1 TimesheetFileName FROM Timesheets WHERE ConsultantID = COALESCE(i.ConsultantID, d.ConsultantID) ORDER BY TimesheetID DESC)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.ConsultantID = d.ConsultantID;
END;
GO