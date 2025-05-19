-- Declare variables for ASCII and Unicode strings
DECLARE @chrASCII varchar(10) = ' hello ';
DECLARE @chrUNICODE nvarchar(10) = N'hello3';

-- Select the first 2 characters from the left of @chrASCII
SELECT LEFT(@chrASCII, 2) AS myASCII;

-- Select the last 2 characters from the right of @chrUNICODE
SELECT RIGHT(@chrUNICODE, 2) AS myUNICODE;

-- Select a substring from @chrASCII starting at position 3 with a length of 2
SELECT SUBSTRING(@chrASCII, 3, 2) AS middleletters;

-- Trim leading and trailing whitespace from @chrASCII
SELECT LTRIM(RTRIM(@chrASCII)) AS TRIM;

-- Replace 'l' with 'L' in @chrASCII
SELECT REPLACE(@chrASCII, 'l', 'L') AS myReplace;

-- Convert @chrASCII to uppercase
SELECT UPPER(@chrASCII) AS myUpper;

-- Convert @chrASCII to lowercase
SELECT LOWER(@chrASCII) AS myLower;