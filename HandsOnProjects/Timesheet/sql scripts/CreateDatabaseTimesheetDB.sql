
CREATE DATABASE TimesheetDB;
GO

USE TimesheetDB;
GO

-- Consultants Table
CREATE TABLE Consultants (
    ConsultantID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName NVARCHAR(100) NOT NULL UNIQUE
);
--
-- Clients Table
CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(100) NOT NULL UNIQUE
);

-- Projects Table
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL FOREIGN KEY REFERENCES Clients(ClientID),
    ProjectName NVARCHAR(100) NOT NULL
);

-- Timesheets Table
CREATE TABLE Timesheets (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    ClientID INT NULL FOREIGN KEY REFERENCES Clients(ClientID),
    ProjectID INT NULL FOREIGN KEY REFERENCES Projects(ProjectID),
    WorkDate DATE NOT NULL,
    DayOfWeek NVARCHAR(10) NOT NULL,
    Description NVARCHAR(100) NOT NULL,
    BillableStatus NVARCHAR(20) NOT NULL CHECK (BillableStatus IN ('Billable', 'Non-Billable')),
    Comments NVARCHAR(MAX) NULL,
    TotalHours DECIMAL(10,4) NOT NULL CHECK (TotalHours >= 0),
    StartTime DECIMAL(10,4) NOT NULL CHECK (StartTime >= 0),
    EndTime DECIMAL(10,4) NOT NULL CHECK (EndTime >= 0),
    TimesheetFileName NVARCHAR(200) NOT NULL,
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
    TimesheetFileName NVARCHAR(200) NOT NULL
);

-- Expenses Table
CREATE TABLE Expenses (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    Month DATE NOT NULL,
    ExpenseDescription NVARCHAR(200) NOT NULL,
    ExpenseType NVARCHAR(50) NOT NULL,
    ZARCost DECIMAL(10,2) NOT NULL CHECK (ZARCost >= 0),
    TimesheetFileName NVARCHAR(200) NOT NULL
);

-- Leaves Table
CREATE TABLE Leaves (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantID INT NOT NULL FOREIGN KEY REFERENCES Consultants(ConsultantID),
    LeaveType NVARCHAR(50) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    NumberOfDays DECIMAL(5,2) NULL CHECK (NumberOfDays >= 0),
    ApprovalObtained NVARCHAR(3) NULL CHECK (ApprovalObtained IN ('Yes', 'No')),
    SickNote NVARCHAR(3) NULL CHECK (SickNote IN ('Yes', 'No')),
    TimesheetFileName NVARCHAR(200) NOT NULL
);

-- WorkDetails Table
CREATE TABLE WorkDetails (
    WorkDetailID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL FOREIGN KEY REFERENCES Clients(ClientID),
    WorkDescription NVARCHAR(200) NOT NULL,
    TaskType NVARCHAR(100) NOT NULL,
    ResourceName NVARCHAR(100) NOT NULL,
    BillableStatus NVARCHAR(20) NOT NULL CHECK (BillableStatus IN ('Billable', 'Non-Billable')),
    TimesheetFileName NVARCHAR(200) NOT NULL
);

-- AuditLog Table
CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    OperationType NVARCHAR(20) NOT NULL CHECK (OperationType IN ('INSERT', 'UPDATE', 'DELETE')),
    TableName NVARCHAR(50) NOT NULL,
    RecordID INT NOT NULL,
    ChangeTimestamp DATETIME NOT NULL DEFAULT GETDATE(),
    Details NVARCHAR(MAX) NULL,
    TimesheetFileName NVARCHAR(200) NOT NULL
);

-- Indexes
CREATE NONCLUSTERED INDEX IX_Timesheets_ConsultantDateFile ON Timesheets (ConsultantID, WorkDate, TimesheetFileName);
CREATE NONCLUSTERED INDEX IX_MonthlySummaries_ConsultantMonth ON MonthlySummaries (ConsultantID, MonthYear);
CREATE NONCLUSTERED INDEX IX_Expenses_ConsultantMonth ON Expenses (ConsultantID, Month);
CREATE NONCLUSTERED INDEX IX_Clients_ClientName ON Clients (ClientName);
CREATE NONCLUSTERED INDEX IX_AuditLog_TimestampFile ON AuditLog (ChangeTimestamp, TimesheetFileName);