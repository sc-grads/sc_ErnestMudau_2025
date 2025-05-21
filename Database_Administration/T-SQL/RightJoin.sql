-- RIGHT JOIN

select *
from (
    select E.EmployeeNumber as ENumber, E.EmployeeFirstName, 
           E.EmployeeLastName, T.EmployeeNumber as TNumber, 
           sum(T.Amount) as TotalAmount
    from tblEmployeA as E
    right join tblTransaction as T 
    on E.EmployeeNumber = T.EmployeeNumber
    group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, 
             E.EmployeeLastName
) as newTable
where ENumber is null
order by ENumber, TNumber, EmployeeFirstName, EmployeeLastName