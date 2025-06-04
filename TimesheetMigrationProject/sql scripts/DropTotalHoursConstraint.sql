ALTER TABLE dbo.Timesheets
ALTER COLUMN TotalHours NUMERIC(5,2);

ALTER TABLE dbo.Timesheets
DROP CONSTRAINT CK__Timesheet__Total__44FF419A;

