
SELECT * 
FROM tblEmployeA 
WHERE NOT EmployeeNumber > 200;

SELECT * 
FROM tblEmployeA 
WHERE EmployeeNumber <= 200;

SELECT * 
FROM tblEmployeA 
WHERE EmployeeNumber >= 200 AND EmployeeNumber <= 209;

SELECT * 
FROM tblEmployeA 
WHERE NOT (EmployeeNumber >= 200 AND EmployeeNumber <= 209);

SELECT * 
FROM tblEmployeA 
WHERE EmployeeNumber = 209;

select * from tblEmployeA 
where EmployeeNumber between 200 and 209 

select * from tblEmployeA 
where EmployeeNumber not between 200 and 209