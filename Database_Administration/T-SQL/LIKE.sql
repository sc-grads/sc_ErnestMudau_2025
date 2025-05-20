select * from tblEmployeA
where [EmployeeLastName] like '[r-t]%'

select * from tblEmployeA
where [EmployeeLastName] like '[^rst]%'

-- % = 0-infinity characters
-- _ = 1 character
-- [A-G] = In the range A-G.
-- [AGQ] = A, G or Q.
-- [^AGQ] = NOT A, G or Q.

select * from tblEmployeA
where [EmployeeLastName] like '[%]%'