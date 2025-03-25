USE AutoTestDB;

-- Insert sample data using the stored procedure
EXEC InsertUser 'John', 'Doe', 'john.doe@example.com';
EXEC InsertUser 'Jane', 'Smith', 'jane.smith@example.com';
EXEC InsertUser 'Bob', 'Johnson', 'bob.johnson@example.com';
