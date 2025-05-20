Select CURRENT_TIMESTAMP as RightNow
select getdate() as RightNow
select SYSDATETIME() as RightNow
select datepart(year, '2015-01-02') as myYear
select datepart(hour, '2015-01-02 08:04:01.123') as myHour
select datepart(weekday, '2015-01-02') as myHour
select datediff(SECOND, '2015-01-02 08:04:01.123', '2015-01-02 08:04:01.167') as MonthsElapsed