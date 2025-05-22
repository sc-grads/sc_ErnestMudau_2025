BEGIN TRAN

ALTER TABLE tblTransaction
ADD Comments varchar(50) NULL
GO -- DDL

SELECT * FROM tblTransaction

MERGE INTO tblTransaction as T --DML
USING (select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
from tblTransactionNew
GROUP by EmployeeNumber, DateOfTransaction) as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'
WHEN NOT MATCHED BY TARGET THEN
INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comments)
VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row');
--OUTPUT inserted., deleted.;
Select * 
from tblTransaction
ROLLBACK TRAN