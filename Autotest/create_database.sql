IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
END
GO
