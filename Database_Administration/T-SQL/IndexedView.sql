USE [78-461]
GO

-- Drop the view if it exists
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS 
           WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')
    DROP VIEW dbo.ViewByDepartment
GO

-- Create the view with aggregated data
CREATE VIEW [dbo].[ViewByDepartment] WITH SCHEMABINDING AS
SELECT 
    D.Department, 
    E.EmployeeNumber, 
    SUM(T.Amount) AS TotalAmount
FROM 
    dbo.tblDepartment AS D
INNER JOIN 
    dbo.tblEmployeA AS E ON D.Department = E.Department
INNER JOIN 
    dbo.tblTransaction AS T ON E.EmployeeNumber = T.EmployeeNumber
WHERE 
    T.EmployeeNumber BETWEEN 128 AND 139
GROUP BY 
    D.Department, 
    E.EmployeeNumber
GO

-- Create a unique clustered index on the view
CREATE UNIQUE CLUSTERED INDEX idx_ViewByDepartment ON dbo.ViewByDepartment (EmployeeNumber, Department)
GO