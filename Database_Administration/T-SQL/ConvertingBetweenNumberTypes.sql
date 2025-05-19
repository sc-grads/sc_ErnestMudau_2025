--converting between number types

--IMPLICIT

DECLARE @myvar AS DECIMAL (5,2) = 3
SELECT @myvar

--explicit

select convert(decimal(5,2),3)/2
select cast(3 as decimal (5,2))/2

select convert(int, 12.345)