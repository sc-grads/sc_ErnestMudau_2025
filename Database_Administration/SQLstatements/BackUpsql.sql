BACKUP DATABASE [AdventureWorks2022] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\adventureworks' WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'AdventureWorks2022' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'AdventureWorks2022' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''AdventureWorks2022'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\adventureworks' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
