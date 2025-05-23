select 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance 
    , sum(A.NumberAttendance) over (partition by A.EmployeeNumber, A.AttendanceMonth order by A.AttendanceMonth) as RunningTotal
    , (convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over (partition by A.EmployeeNumber) * 100.0000) as Percentage
from #tEmployee as E 
join #tAttendance as A 
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth between '20140101' and '20161231'
order by A.EmployeeNumber, A.AttendanceMonth