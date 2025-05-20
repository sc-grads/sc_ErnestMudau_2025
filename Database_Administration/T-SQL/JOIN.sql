select tblEmployeA.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployeA
join tblTransaction
on tblEmployeA.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployeA.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber

select *
from tblEmployeA
where EmployeeNumber = 1046