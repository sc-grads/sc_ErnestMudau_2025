select E.EmployeeNumber 
from tblEmployee as E 
inner join tblTransaction as T 
on E.EmployeeNumber = T.EmployeeNumber 
where T.EmployeeNumber is not null 
order by E.EmployeeNumber;

select max(EmployeeNumber) from tblTransaction;

with Numbers as (
    select top 1 'X' as RowNumber 
    from tblTransaction as T 
    -- where ... (missing condition)
)
select U.RowNumber, T.Numbers as ID 
from ... as U 
inner join ... as T 
on U.RowNumber = T.EmployeeNumber 
where ... 
order by U.RowNumber;