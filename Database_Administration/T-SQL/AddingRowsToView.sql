-- Start a new transaction
BEGIN TRANSACTION;

-- Insert data into the ViewByDepartment view
INSERT INTO ViewByDepartment (EmployeeNumber, DateOfTransaction, TotalAmount)
VALUES (132, '2015-07-07', 999.99);

-- Retrieve data from the ViewByDepartment view, ordered by Department and EmployeeNumber
SELECT * 
FROM ViewByDepartment 
ORDER BY Department, EmployeeNumber;

-- Roll back the transaction (undo changes)
ROLLBACK TRANSACTION;

-- Start a new transaction
BEGIN TRANSACTION;

-- Retrieve data from the ViewByDepartment view, ordered by EmployeeNumber and DateOfTransaction
SELECT * 
FROM ViewByDepartment 
ORDER BY EmployeeNumber, DateOfTransaction;

-- Update the EmployeeNumber in the ViewByDepartment view
UPDATE ViewByDepartment
SET EmployeeNumber = 142
WHERE EmployeeNumber = 132;