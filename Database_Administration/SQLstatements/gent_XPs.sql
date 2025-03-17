--gent XPs is disabled on your SQL Server, preventing SQL Server Agent from running.
USE master;
GO
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Agent XPs', 1;
RECONFIGURE;
