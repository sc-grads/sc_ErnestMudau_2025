USE AutoTest;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertUser')
BEGIN
    EXEC('
    CREATE PROCEDURE InsertUser
        @Name NVARCHAR(50),
        @Surname NVARCHAR(50),
        @Email NVARCHAR(100)
    AS
    BEGIN
        INSERT INTO [user] (Name, Surname, Email)
        VALUES (@Name, @Surname, @Email);
    END
    ');
END
GO

