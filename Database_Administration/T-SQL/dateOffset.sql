-- Declare a variable @myDateOffset of type datetimeoffset(2)
-- The (2) specifies the fractional seconds precision
DECLARE @myDateOffset AS datetimeoffset(2) = '2015-06-25 01:02:03.456 +05:30';

-- Re-assign the value of @myDateOffset to itself (no change)
SELECT @myDateOffset = @myDateOffset;

-- Display the value of @myDateOffset
SELECT @myDateOffset AS OriginalDateOffset;

-- Display the year part of @myDateOffset
SELECT DATEPART(year, @myDateOffset) AS YearPart;

-- Use the TODATETIMEOFFSET function to create a new datetimeoffset value
-- with a specific time zone offset
SELECT TODATETIMEOFFSET('2015-06-25 01:01:01.456', '+05:30') AS MyDateOffset;

-- Declare a new variable @myDateOffset2 of type datetimeoffset
DECLARE @myDateOffset2 AS datetimeoffset;

-- Assign a value to @myDateOffset2 using TODATETIMEOFFSET
SELECT @myDateOffset2 = TODATETIMEOFFSET('2015-06-25 01:02:03.456', '+05:30');

-- Display the value of @myDateOffset2
SELECT @myDateOffset2 AS DateOffset2;

-- Declare and assign another datetimeoffset variable
DECLARE @myDateOffset3 AS datetimeoffset;
SELECT @myDateOffset3 = '2015-06-25 01:02:03.456 +05:30';

-- Display @myDateOffset3
SELECT @myDateOffset3 AS MyDateOffsetTz;
