CREATE DATABASE AutoTestDB;
GO
USE AutoTestDB;
GO
CREATE LOGIN Auto_user WITH PASSWORD = '$(SQL_USER_PASSWORD)';
CREATE USER Auto_user FOR LOGIN Auto_user;
EXEC sp_addrolemember 'db_owner', 'Auto_user';
GO
CREATE TABLE [user] (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Surname NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE
);
GO
CREATE PROCEDURE InsertUser
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100),
    @Email NVARCHAR(255)
AS
BEGIN
    INSERT INTO [user] (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END
GO
EXEC InsertUser 'Admin', 'User', 'admin@example.com';
EXEC InsertUser 'John', 'Doe', 'john@example.com';
GO
