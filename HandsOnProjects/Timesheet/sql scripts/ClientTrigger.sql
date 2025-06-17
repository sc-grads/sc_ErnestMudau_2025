CREATE TRIGGER TR_Clients_Audit
ON Client
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
        'Clients',
        COALESCE(i.ClientID, d.ClientID),
        'ClientName: ' + COALESCE(i.ClientName, d.ClientName),
        (SELECT TOP 1 TimesheetFileName FROM Timesheets WHERE ClientID = COALESCE(i.ClientID, d.ClientID) ORDER BY TimesheetID DESC)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.ClientID = d.ClientID;
END;
GO