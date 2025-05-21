begin transaction
select count(*) from tblTransaction

delete tblTransaction
from tblTransaction
where EmployeeNumber IN 
(select TNumber
from 
(select E.EmployeeNumber as ENumber, E.EmployeeFirstName, E.EmployeeLastName, T.EmployeeNumber as TNumber, sum(T.Amount) as TotalAmount
from tblEmployeA as E 
right join tblTransaction as T 
on E.EmployeeNumber = T.EmployeeNumber
group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
where ENumber is null) as newTable)

select count(*) from tblTransaction
rollback tran
select count(*) from tblTransaction