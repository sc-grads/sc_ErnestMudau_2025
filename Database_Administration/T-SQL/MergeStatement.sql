BEGIN TRAN
MERGE INTO tblTransaction as T
USING tblTransactionNew as S
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
UPDATE SET T.Amount = S.Amount
WHEN NOT MATCHED BY TARGET THEN
INSERT ([Amount],[DateOfTransaction],[EmployeeNumber])
VALUES (S.Amount, S.DateOfTransaction,S.EmployeeNumber);
ROLLBACK TRAN