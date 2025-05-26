With tblWithRanking as 
(
    select 
        D.Department, 
        EmployeeNumber, 
        EmployeeFirstName, 
        EmployeeLastName,
        rank() over (partition by D.Department order by E.EmployeeNumber) as TheRank
    from 
        tblDepartment as D
    join 
        tblEmployeA as E on D.Department = E.Department
    join 
        tblTransaction2014 as T on E.EmployeeNumber = T.EmployeeNumber
    where 
        DateOfTransaction < '2015-01-01'
)
select * 
from 
    tblWithRanking
left join 
    Transaction2014 on tblWithRanking.EmployeeNumber = Transaction2014.EmployeeNumber
where 
    TheRank <= 5
order by 
    Department, 
    tblWithRanking.EmployeeNumber