SELECT Department AS NumberOfDepartments
FROM (
    SELECT Department, COUNT(*) AS NumberPerDepartment
    FROM tblEmployeA
    GROUP BY Department
) AS newTable;

--Derived table

SELECT DISTINCT Department AS DepartmentHead
INTO tblDepartment
FROM tblEmployeA;