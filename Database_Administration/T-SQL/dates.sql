
Declare @mydate as datetime = '2015-06-24 12:34:56.124'
select @mydate as MyDate

declare @mydate2 as datetime = '20150624 12:34:56.124'
select @mydate2 as MyDate2

select datefromparts(2015, 06, 24) as ThisDate
select DATETIMEFROMPARTS(2015, 06, 24, 12, 34, 56, 124) as ThatDate
select year(@mydate) as myYear, month(@mydate) as myMonth, day(@mydate) as myDay