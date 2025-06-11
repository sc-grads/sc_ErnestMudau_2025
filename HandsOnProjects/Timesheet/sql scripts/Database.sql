CREATE DATABASE TimesheetDB;
GO

USE TimesheetDB;
GO

-- Consultants Table
CREATE TABLE Consultants (
    ConsultantID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName NVARCHAR(255) NOT NULL UNIQUE
);

-- Clients Table
CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(255) NOT NULL UNIQUE
);

-- Timesheets Table
CREATE TABLE Timesheets (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    ClientID INT NULL FOREIGN KEY REFERENCES Clients(ClientID),
    WorkDate DATE NOT NULL,
    DayOfWeek NVARCHAR(255) NOT NULL,
    ClientProjectName NVARCHAR(255) NULL,
    Description NVARCHAR(255) NOT NULL,
    BillableStatus NVARCHAR(255) NOT NULL CHECK (BillableStatus IN ('Billable', 'Non-Billable')),
    Comments NVARCHAR(255) NULL,
    TotalHours TIME NOT NULL, -- Changed from DECIMAL(10,4) to TIME
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    TimesheetFileName NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_Timesheets_ConsultantDateFile UNIQUE (ConsultantID, WorkDate, TimesheetFileName)
);

-- MonthlySummaries Table
CREATE TABLE MonthlySummaries (
    SummaryID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    MonthYear DATE NOT NULL,
    ForecastedHours DECIMAL(10,2) NOT NULL CHECK (ForecastedHours >= 0),
    ForecastedWorkDays INT NOT NULL CHECK (ForecastedWorkDays >= 0),
    BillableHours DECIMAL(10,2) NOT NULL CHECK (BillableHours >= 0),
    NonBillableHours DECIMAL(10,2) NOT NULL CHECK (NonBillableHours >= 0),
    TotalHours DECIMAL(10,2) NOT NULL CHECK (TotalHours >= 0),
    TimesheetFileName NVARCHAR(255) NOT NULL
);

-- Expenses Table
CREATE TABLE Expenses (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    Month DATE NOT NULL,
    ExpenseDescription NVARCHAR(255) NOT NULL,
    ExpenseType NVARCHAR(255) NOT NULL,
    ZARCost DECIMAL(10,2) NOT NULL CHECK (ZARCost >= 0),
    TimesheetFileName NVARCHAR(255) NOT NULL
);

-- Leaves Table
CREATE TABLE Leaves (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    LeaveType NVARCHAR(255) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    NumberOfDays DECIMAL(5,2) NULL CHECK (NumberOfDays >= 0),
    ApprovalObtained NVARCHAR(255) NULL CHECK (ApprovalObtained IN ('Yes', 'No')),
    SickNote NVARCHAR(255) NULL CHECK (SickNote IN ('Yes', 'No')),
    TimesheetFileName NVARCHAR(255) NOT NULL
);

-- WorkDetails Table
CREATE TABLE WorkDetails (
    WorkDetailID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL FOREIGN KEY REFERENCES Clients(ClientID),
    WorkDescription NVARCHAR(255) NOT NULL,
    TaskType NVARCHAR(255) NOT NULL,
    ResourceName NVARCHAR(255) NOT NULL,
    BillableStatus NVARCHAR(255) NOT NULL CHECK (BillableStatus IN ('Billable', 'Non-Billable')),
    TimesheetFileName NVARCHAR(255) NOT NULL
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

-- Indexes
CREATE NONCLUSTERED INDEX IX_Timesheets_ConsultantDateFile ON Timesheets (ConsultantID, WorkDate, TimesheetFileName);
CREATE NONCLUSTERED INDEX IX_MonthlySummaries_ConsultantMonth ON MonthlySummaries (ConsultantID, MonthYear);
CREATE NONCLUSTERED INDEX IX_Expenses_ConsultantMonth ON Expenses (ConsultantID, Month);
CREATE NONCLUSTERED INDEX IX_Clients_ClientName ON Clients (ClientName);
CREATE NONCLUSTERED INDEX IX_AuditLog_TimestampFile ON AuditLog (ChangeTimestamp, TimesheetFileName);