CREATE LOGIN YourLogin WITH PASSWORD = 'YourPassword';
USE TimesheetDB;
CREATE USER YourUser FOR LOGIN YourLogin;
GRANT SELECT ON AuditLog TO YourUser;