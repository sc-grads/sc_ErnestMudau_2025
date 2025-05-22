select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over() * 100.0000 as PercentageAttendance
from tblEmployeA as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

--select sum(NumberAttendance) from tblAttendance