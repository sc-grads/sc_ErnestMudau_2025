-- Initialise a variable, give it a data type and an initial value
DECLARE @myvar AS tinyInt = 2

-- Increase that value by 1
SET @myvar = @myvar + 1

-- Retrieve that value
SELECT @myvar AS myVariable

-- Initialise a variable, give it a data type and an initial value
DECLARE @myvari AS smallInt = 2

-- Increase that value by 1
SET @myvari = @myvari - 3

-- Retrieve that value
SELECT @myvari AS myVariable