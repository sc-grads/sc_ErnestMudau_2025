-- Drop the existing ErrorLog table if it exists
IF OBJECT_ID('dbo.ErrorLog', 'U') IS NOT NULL
    DROP TABLE dbo.ErrorLog;
GO

-- Create the updated ErrorLog table without ErrorSeverity
CREATE TABLE ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorTimestamp DATETIME NOT NULL DEFAULT GETDATE(),
    ErrorMessage NVARCHAR(MAX) NOT NULL,
    ErrorSource NVARCHAR(255) NULL, -- e.g., package or task name
    TableName NVARCHAR(255) NULL, -- Table related to the error
    RecordID INT NULL, -- ID of the record causing the error
    ConsultantID INT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID), -- Link to Consultant
    TimesheetFileName NVARCHAR(255) NOT NULL, -- File name for traceability
    ErrorDetails NVARCHAR(MAX) NULL -- Additional error context
);

-- Create index for efficient querying
CREATE NONCLUSTERED INDEX IX_ErrorLog_TimestampFile ON ErrorLog (ErrorTimestamp, TimesheetFileName);

