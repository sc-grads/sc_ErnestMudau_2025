-- Retrieve all data from the table
SELECT * FROM [dbo].[tableFirst];

-- Remove the table entirely, including its structure and data
DROP TABLE [dbo].[tableFirst];

--  to remove all data but keep the table structure:
TRUNCATE TABLE [dbo].[tableFirst];  -- Faster, but can't be used with foreign key constraints
DELETE FROM [dbo].[tableFirst];  -- Slower, but can be used with foreign key constraints
