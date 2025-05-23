Select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance,
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
GROUPING(E.Department) AS EmployeeNumberGroupedID
From tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
GROUP BY ROLLUP (E.Department, E.EmployeeNumber, A.AttendanceMonth)
order by CASE WHEN Department IS NULL THEN 0 ELSE 1 END, Department,
CASE WHEN E.EmployeeNumber IS NULL THEN 0 ELSE 1 END, E.EmployeeNumber,
CASE WHEN AttendanceMonth IS NULL THEN 1 ELSE 0 END, AttendanceMonth