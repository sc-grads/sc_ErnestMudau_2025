--char - ASCII - 1 byte
--varchar - ASCII - 1 byte
--nchar - UNICODE - 2 bytes
--nvarchar - UNICODE - 2 bytes

--A-Z, a-z, 0-9,
--65 97 48 32 128
--0-255

--ASCII
--UNICODE

DECLARE @chrMyCharacters as char(10)
set @chrMyCharacters = 'hellothere'
select @chrMyCharacters as myString, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength