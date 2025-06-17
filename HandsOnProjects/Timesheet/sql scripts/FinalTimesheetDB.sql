CREATE DATABASE TimesheetDB;
GO

USE TimesheetDB;
GO

-- Consultants Table
CREATE TABLE Consultant (
    ConsultantID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName NVARCHAR(255) NOT NULL UNIQUE
);

-- Clients Table
CREATE TABLE Client (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(255) NOT NULL UNIQUE
);

-- Timesheets Table
CREATE TABLE Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultant(ConsultantID), -- Corrected to Consultant
    ClientID INT NULL FOREIGN KEY REFERENCES Client(ClientID),
    WorkDate DATE NOT NULL,
    DayOfWeek NVARCHAR(255) NOT NULL,
    ClientProjectName NVARCHAR(255) NULL,
    Description NVARCHAR(255) NOT NULL,
    BillableStatus NVARCHAR(255) NOT NULL CHECK (BillableStatus IN ('Billable', 'Non-Billable')),
    Comments NVARCHAR(MAX) NULL,
    TotalHours TIME NOT NULL, -- Changed from DECIMAL(10,4) to TIME
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    TimesheetFileName NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_Timesheets_ConsultantDateStartTimeFile UNIQUE (ConsultantID, WorkDate, StartTime, TimesheetFileName)
);

-- Leaves Table
CREATE TABLE Leave (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultant(ConsultantID), -- Corrected to Consultant
    LeaveType NVARCHAR(255) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    NumberOfDays DECIMAL(5,2) NULL CHECK (NumberOfDays >= 0),
    ApprovalObtained NVARCHAR(255) NULL CHECK (ApprovalObtained IN ('Yes', 'No')),
    SickNote NVARCHAR(255) NULL CHECK (SickNote IN ('Yes', 'No')),
    TimesheetFileName NVARCHAR(255) NOT NULL,

);

-- AuditLog Table
CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    OperationType NVARCHAR(255) NOT NULL CHECK (OperationType IN ('INSERT', 'UPDATE', 'DELETE')),
    TableName NVARCHAR(255) NOT NULL,
    RecordID INT NOT NULL,
    ChangeTimestamp DATETIME NOT NULL DEFAULT GETDATE(),
    Details NVARCHAR(255) NULL,
    TimesheetFileName NVARCHAR(255) NOT NULL
);

-- ErrorLog Table
CREATE TABLE ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorTimestamp DATETIME NOT NULL DEFAULT GETDATE(),
    ErrorMessage NVARCHAR(MAX) NOT NULL,
    ErrorSource NVARCHAR(255) NULL,
    TableName NVARCHAR(255) NULL,
    ConsultantID INT NULL FOREIGN KEY REFERENCES Consultant(ConsultantID), -- Corrected to Consultant
    TimesheetFileName NVARCHAR(255) NOT NULL,
    ErrorDetails NVARCHAR(MAX) NULL
);

-- Create index for efficient querying
CREATE NONCLUSTERED INDEX IX_ErrorLog_TimestampFile ON ErrorLog (ErrorTimestamp, TimesheetFileName);
CREATE NONCLUSTERED INDEX IX_Timesheets_ConsultantDateFile ON Timesheet (ConsultantID, WorkDate, TimesheetFileName);
CREATE NONCLUSTERED INDEX IX_Clients_ClientName ON Client (ClientName);
CREATE NONCLUSTERED INDEX IX_AuditLog_TimestampFile ON AuditLog (ChangeTimestamp, TimesheetFileName);

ALTER TABLE Leave
ADD CONSTRAINT UQ_Leave_ConsultantStartDate UNIQUE (ConsultantID, StartDate);

ALTER TABLE Leave
ADD CONSTRAINT DF_Leave_SickNote DEFAULT 'No' FOR SickNote;