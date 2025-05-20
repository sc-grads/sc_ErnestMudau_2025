select * from tblEmployeA 
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

select * from tblEmployeA 
where year(DateOfBirth) between 1976 and 1986 -- DO NOT USE.

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployeA
GROUP BY year(DateOfBirth)

SELECT * FROM tblEmployeA
where year(DateOfBirth) = 1967

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployeA
WHERE 1=1
GROUP BY year(DateOfBirth)
ORDER BY YEAR(DateOfBirth) asc