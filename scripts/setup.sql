-- 1. Create the AutoTest database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
END
GO

-- 2. Switch to the AutoTest database
USE AutoTest;
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

-- 4. Create the stored procedure to insert data
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'InsertUser')
BEGIN
    DROP PROCEDURE InsertUser;
END
GO

CREATE PROCEDURE InsertUser
    @Name NVARCHAR(50),
    @Surname NVARCHAR(50),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO [dbo].[user] (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END
GO

-- 5. Create the Auto_user login and user (if not already created)
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'Auto_user')
BEGIN
    CREATE LOGIN Auto_user WITH PASSWORD = 'SecurePassword123';
END
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Auto_user')
BEGIN
    CREATE USER Auto_user FOR LOGIN Auto_user;
    ALTER ROLE db_owner ADD MEMBER Auto_user; -- Grant db_owner role for AutoTest database
END
GO

-- 6. Insert sample data using the stored procedure
EXEC InsertUser @Name = 'John', @Surname = 'Doe', @Email = 'john.doe@example.com';
EXEC InsertUser @Name = 'Jane', @Surname = 'Smith', @Email = 'jane.smith@example.com';
GO
