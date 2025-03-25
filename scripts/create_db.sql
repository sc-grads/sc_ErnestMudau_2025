-- Create the database
CREATE DATABASE AutoTestDB;

-- Use the database
USE AutoTestDB;

-- Create the user table
CREATE TABLE user (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Surname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE
);

-- Create a stored procedure to insert users
CREATE PROCEDURE InsertUser
    @Name NVARCHAR(50),
    @Surname NVARCHAR(50),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO user (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END;

-- Create Auto_user with full access
CREATE LOGIN Auto_user WITH PASSWORD = 'qwerty'
CREATE USER Auto_user FOR LOGIN Auto_user;
GRANT CONTROL ON DATABASE::AutoTestDB TO Auto_user;
