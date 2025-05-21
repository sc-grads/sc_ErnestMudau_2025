ALTER TABLE tblEmployeA
ADD CONSTRAINT unqGovermentID UNIQUE (EmployeeGoverNmentID);

SELECT EmployeeGovernmentID , COUNT (EmployeeGovernmentID) AS MyCount from tblEmployeA
GROUP BY EmployeeGovernmentID
HAVING COUNT (EmployeeGovernmentID) > 1

begin tran
delete from tblEmployeA
where EmployeeNumber < 3
delete top(2) from tblEmployeA
where EmployeeNumber in (131, 132)
select * from tblEmployeA where EmployeeGovernmentID IN ('HN513777D', 'TX593671R')
rollback tran

ALTER TABLE tblTransaction
ADD CONSTRAINT unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber);

delete from tblTransaction 
where EmployeeNumber = 131;

insert into tblTransaction 
VALUES (1, '2015-01-01', 131);

insert into tblTransaction 
VALUES (1, '2015-01-01', 131);

alter table tblTransaction 
drop constraint unqTransaction

create table tblTransaction2
(
    Amount smallmoney not null,
    DateOfTransaction smalldatetime not null,
    EmployeeNumber int not null,
    CONSTRAINT unqTransaction2 UNIQUE (Amount, DateOfTransaction, EmployeeNumber)
)

drop table tblTransaction2