
-- Use master database to allow dropping the TimesheetDB database
USE master;
GO

-- Drop the database if it exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'TimesheetDB')
BEGIN
    -- Ensure no connections are active to the database
    ALTER DATABASE TimesheetDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the database
    DROP DATABASE TimesheetDB;
END;
GO