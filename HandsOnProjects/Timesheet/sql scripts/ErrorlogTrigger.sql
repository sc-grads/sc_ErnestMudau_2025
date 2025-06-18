CREATE TRIGGER TR_ErrorLog_Audit
ON ErrorLog
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
        'ErrorLog',
        COALESCE(i.ErrorID, d.ErrorID),
        'ErrorMessage: ' + COALESCE(i.ErrorMessage, d.ErrorMessage) + 
        CASE WHEN COALESCE(i.ErrorSource, d.ErrorSource) IS NOT NULL THEN ', ErrorSource: ' + COALESCE(i.ErrorSource, d.ErrorSource) ELSE '' END +
        CASE WHEN COALESCE(i.ConsultantID, d.ConsultantID) IS NOT NULL THEN ', ConsultantID: ' + CAST(COALESCE(i.ConsultantID, d.ConsultantID) AS NVARCHAR(10)) ELSE '' END +
        CASE WHEN COALESCE(i.ErrorDetails, d.ErrorDetails) IS NOT NULL THEN ', Details: ' + COALESCE(i.ErrorDetails, d.ErrorDetails) ELSE '' END,
        COALESCE(i.TimesheetFileName, d.TimesheetFileName)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.ErrorID = d.ErrorID;
END;
GO