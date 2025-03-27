-- 1. Create a stored procedure to create the database
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'CreateAutoDBErnest')
BEGIN
    DROP PROCEDURE CreateAutoDBErnest;
END
GO

CREATE PROCEDURE CreateAutoDBErnest
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoDBErnest')
    BEGIN
        CREATE DATABASE AutoDBErnest;
    END
END
GO

-- Execute the stored procedure to create the database
EXEC CreateAutoDBErnest;
GO

-- 2. Switch to the AutoDBErnest database
USE AutoDBErnest;
GO

-- 3. Create the user table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
BEGIN
    CREATE TABLE [dbo].[user] (
        Name NVARCHAR(50) NOT NULL,
        Surname NVARCHAR(50) NOT NULL,
        Email NVARCHAR(100) NOT NULL
    );
END
GO

-- 4. Create a stored procedure to insert data into the user table
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'InsertUsers')
BEGIN
    DROP PROCEDURE InsertUsers;
END
GO

CREATE PROCEDURE InsertUsers
    @Name NVARCHAR(50),
    @Surname NVARCHAR(50),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO [dbo].[user] (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END
GO

-- 5. Insert sample data using the stored procedure
EXEC InsertUsers @Name = 'John', @Surname = 'Doe', @Email = 'john.doe@example.com';
EXEC InsertUsers @Name = 'Jane', @Surname = 'Smith', @Email = 'jane.smith@example.com';
GO
