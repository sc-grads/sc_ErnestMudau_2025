SELECT *
FROM tblTransaction AS T
WHERE EmployeeNumber IN (
    SELECT EmployeeNumber 
    FROM tblEmployeA 
    WHERE EmployeeLastName not LIKE 'y%'
)
ORDER BY T.EmployeeNumber DESC;

SELECT *
FROM tblTransaction AS T
WHERE EmployeeNumber not IN (
    SELECT EmployeeNumber 
    FROM tblEmployeA 
    WHERE EmployeeLastName LIKE 'y%'
)
ORDER BY T.EmployeeNumber DESC;