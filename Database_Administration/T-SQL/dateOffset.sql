-- Declare a variable @myDateOffset of type datetimeoffset(2)
-- The (2) specifies the fractional seconds precision
DECLARE @myDateOffset AS datetimeoffset(2) = '2015-06-25 01:02:03.456 +05:30';

-- Re-assign the value of @myDateOffset to itself (no change)
SELECT @myDateOffset = @myDateOffset;

-- Display the value of @myDateOffset
SELECT @myDateOffset;

-- Display the date part of @myDateOffset
SELECT DATEPART(year, @myDateOffset);

-- Use the TODATETIMEOFFSET function to create a new datetimeoffset value
-- with different time zone offsets
SELECT TODATETIMEOFFSET('2015-06-25 1:1:1.456', '+05:30') AS MyDateOffset;

-- Declare a new variable @myDateOffset2 of type TimeWithOffset
DECLARE @myDateOffset2 AS TimeWithOffset;

-- The above line will result in an error because TimeWithOffset is not a valid data type
-- To fix this, you can use the datetimeoffset data type instead
-- DECLARE @myDateOffset2 AS datetimeoffset;

-- Assign a value to @myDateOffset2 (commented out due to the error above)
-- SELECT @myDateOffset2 = TODATETIMEOFFSET('2015-06-25 01:02:03.456 +05:30', '+05:30');

-- Display the value of @myDateOffset as a datetimeoffset value
DECLARE @myDateOffset3 AS datetimeoffset;
SELECT @myDateOffset3 = '2015-06-25 01:02:03.456 +05:30';
SELECT @myDateOffset3 AS MyDateOffsetTz;