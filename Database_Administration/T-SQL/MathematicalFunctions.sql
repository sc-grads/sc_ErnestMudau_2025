--initialise a variable , give it a data type and an initial value

declare @myvar as numeric (7,2) = 3

select power(@myvar,2)
select square(@myvar)
select power(@myvar,0.5)
select sqrt(@myvar)

go 

declare @myvar as numeric(7,2) = 3.7

select floor(@myvar) as myfloor
select ceiling(@myvar) as myceiling
select round(@myvar,2) as myRound
select round(@myvar,-1) as myRound

GO

SELECT PI() as myPI
SELECT EXP(1) AS e

declare @myvar as numeric (7,2) = 1234.56
