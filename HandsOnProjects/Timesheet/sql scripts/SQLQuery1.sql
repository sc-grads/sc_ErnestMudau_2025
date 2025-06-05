ALTER TABLE dbo.Timesheets
DROP COLUMN ProjectID;

ALTER TABLE dbo.Timesheets
DROP CONSTRAINT FK__Timesheet__Proje__4316F928;

DELETE FROM [dbo].[Consultants];
DELETE FROM [dbo].[Clients];