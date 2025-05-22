Select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
       ,(A NumberAttendance) 
        over(partition by A.EmployeeNumber, year(A.AttendanceMonth)
        order by A.AttendanceMonth
        rows between preceding and unbounded following) - A.NumberAttendance as RunningTotal
from tblAttendance as A
--where A.AttendanceMonth < '20150101'