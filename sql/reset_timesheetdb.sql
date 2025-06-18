USE master;
GO

-- Drop TimesheetDB if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TimesheetDB')
BEGIN
    ALTER DATABASE TimesheetDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TimesheetDB;
END
GO

-- Create Database
CREATE DATABASE TimesheetDB;
GO

USE TimesheetDB;
GO

-- Create Tables
CREATE TABLE Consultant (
    ConsultantID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName NVARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Client (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultant(ConsultantID),
    ClientID INT NULL FOREIGN KEY REFERENCES Client(ClientID),
    WorkDate DATE NOT NULL,
    DayOfWeek NVARCHAR(255) NOT NULL,
    ClientProjectName NVARCHAR(255) NULL,
    Description NVARCHAR(255) NOT NULL,
    BillableStatus NVARCHAR(255) NOT NULL CHECK (BillableStatus IN ('Billable', 'Non-Billable')),
    Comments NVARCHAR(MAX) NULL,
    TotalHours TIME NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    TimesheetFileName NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_Timesheets_ConsultantDateStartTimeFile UNIQUE (ConsultantID, WorkDate, StartTime, TimesheetFileName)
);

CREATE TABLE Leave (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultant(ConsultantID),
    LeaveType NVARCHAR(255) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    NumberOfDays DECIMAL(5,2) NULL CHECK (NumberOfDays >= 0),
    ApprovalObtained NVARCHAR(255) NULL CHECK (ApprovalObtained IN ('Yes', 'No')),
    SickNote NVARCHAR(255) NULL CHECK (SickNote IN ('Yes', 'No')),
    TimesheetFileName NVARCHAR(255) NOT NULL
);

CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    OperationType NVARCHAR(255) NOT NULL CHECK (OperationType IN ('INSERT', 'UPDATE', 'DELETE')),
    TableName NVARCHAR(255) NOT NULL,
    RecordID INT NOT NULL,
    ChangeTimestamp DATETIME NOT NULL DEFAULT GETDATE(),
    Details NVARCHAR(255) NULL,
    TimesheetFileName NVARCHAR(255) NOT NULL
);

CREATE TABLE ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorTimestamp DATETIME NOT NULL DEFAULT GETDATE(),
    ErrorMessage NVARCHAR(MAX) NOT NULL,
    ErrorSource NVARCHAR(255) NULL,
    TableName NVARCHAR(255) NULL,
    ConsultantID INT NULL FOREIGN KEY REFERENCES Consultant(ConsultantID),
    TimesheetFileName NVARCHAR(255) NOT NULL,
    ErrorDetails NVARCHAR(MAX) NULL
);

-- Create Indexes
CREATE NONCLUSTERED INDEX IX_ErrorLog_TimestampFile ON ErrorLog (ErrorTimestamp, TimesheetFileName);
CREATE NONCLUSTERED INDEX IX_Timesheets_ConsultantDateFile ON Timesheet (ConsultantID, WorkDate, TimesheetFileName);
CREATE NONCLUSTERED INDEX IX_Clients_ClientName ON Client (ClientName);
CREATE NONCLUSTERED INDEX IX_AuditLog_TimestampFile ON AuditLog (ChangeTimestamp, TimesheetFileName);

-- Add Constraints
ALTER TABLE Leave
ADD CONSTRAINT UQ_Leave_ConsultantStartDate UNIQUE (ConsultantID, StartDate);

ALTER TABLE Leave
ADD CONSTRAINT DF_Leave_SickNote DEFAULT 'No' FOR SickNote;

-- Create Triggers
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
        'Client',
        COALESCE(i.ClientID, d.ClientID),
        'ClientName: ' + COALESCE(i.ClientName, d.ClientName),
        ISNULL((SELECT TOP 1 TimesheetFileName FROM Timesheet WHERE ClientID = COALESCE(i.ClientID, d.ClientID) ORDER BY TimesheetID DESC), 'Unknown')
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.ClientID = d.ClientID;
END;
GO

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
        'Consultant',
        COALESCE(i.ConsultantID, d.ConsultantID),
        'ConsultantName: ' + COALESCE(i.ConsultantName, d.ConsultantName),
        ISNULL((SELECT TOP 1 TimesheetFileName FROM Timesheet WHERE ConsultantID = COALESCE(i.ConsultantID, d.ConsultantID) ORDER BY TimesheetID DESC), 'Unknown')
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.ConsultantID = d.ConsultantID;
END;
GO

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
        'Leave',
        COALESCE(i.LeaveID, d.LeaveID),
        'LeaveType: ' + COALESCE(i.LeaveType, d.LeaveType) + 
        ', StartDate: ' + CONVERT(NVARCHAR(10), COALESCE(i.StartDate, d.StartDate), 120),
        COALESCE(i.TimesheetFileName, d.TimesheetFileName)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.LeaveID = d.LeaveID;
END;
GO

CREATE TRIGGER TR_Timesheets_Audit
ON Timesheet
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
        'Timesheet',
        COALESCE(i.TimesheetID, d.TimesheetID),
        'WorkDate: ' + CONVERT(NVARCHAR(10), COALESCE(i.WorkDate, d.WorkDate), 120) + 
        ', StartTime: ' + CONVERT(NVARCHAR(8), COALESCE(i.StartTime, d.StartTime), 108),
        COALESCE(i.TimesheetFileName, d.TimesheetFileName)
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.TimesheetID = d.TimesheetID;
END;
GO