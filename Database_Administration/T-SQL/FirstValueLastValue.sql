select E.EmployeeNumber, A.AttendanceMonth, 
first_value(NumberAttendance) 
over(partition by E.EmployeeNumber order by A.AttendanceMonth) as FirstMonth, 
last_value(NumberAttendance) 
over(partition by E.EmployeeNumber order by A.AttendanceMonth 
rows between unbounded preceding and 2 following) as LastMonth 
from tblEmployee as E join tblAttendance as A 
on E.EmployeeNumber = A.EmployeeNumber