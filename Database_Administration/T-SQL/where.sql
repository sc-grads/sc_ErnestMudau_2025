USE [70-461];
GO

SELECT *
FROM tblTransaction AS T
INNER JOIN tblEmployeA AS E
    ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'y%'
ORDER BY T.EmployeeNumber DESC;

SELECT *
FROM tblTransaction AS T
WHERE EmployeeNumber IN (
    SELECT EmployeeNumber 
    FROM tblEmployeA 
    WHERE EmployeeLastName LIKE 'y%'
)
ORDER BY T.EmployeeNumber DESC;