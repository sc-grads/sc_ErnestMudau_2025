USE MASTER;
GO
DROP DATABASE IF EXISTS [CORRUPTIONTEST];
GO
CREATE DATABASE [CORRUPTIONTEST];
GO
ALTER DATABASE [CORRUPTIONTEST] SET RECOVERY FULL;
GO
ALTER DATABASE [CORRUPTIONTEST] SET PAGE_VERIFY CHECKSUM;
GO

USE [CORRUPTIONTEST];
GO

CREATE TABLE [dbo].[mssqltips_online] 
(
    increment INT PRIMARY KEY, 
    randomGUID UNIQUEIDENTIFIER , 
    randomValue INT, 
    BigCol CHAR(2000) DEFAULT 'a'
);
GO


CREATE TABLE [dbo].[mssqltips_corrupt] 
(
    increment INT PRIMARY KEY, 
    randomGUID UNIQUEIDENTIFIER DEFAULT NEWID(), 
    randomValue INT, 
    BigCol CHAR(2000) DEFAULT 'a'
);
GO


backup database [master] to disK =N'C:\SQL_BACKUPS\master_backup_test.bak' with noformat, noinit , 
name = N'master full database backup' , skip, norewind, NOUNLOAD ,stats=10
go

RESTORE DATABASE master from disk ='C:\SQL_BACKUPS\master_backup_test.bak' with replace;
--NB if you get the message about a single user you have to run cmd as administrator and stop the mssql server and and start it as a single user 