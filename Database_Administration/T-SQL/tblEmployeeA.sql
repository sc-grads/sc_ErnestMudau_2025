

CREATE TABLE tblEmployeA (
    EmployeeNumber INT NOT NULL,
    EmployeeFirstName VARCHAR(50) NOT NULL,
    EmployeeMiddleName VARCHAR(50) NULL,
    EmployeeLastName VARCHAR(50) NOT NULL,
    EmployeeGovernmentID CHAR(10) NULL,
    DateOfBirth DATE NOT NULL,
	Department varchar(30) 
);

select *
from tblEmployeA

INSERT INTO tblEmployeA
VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '1992-09-14', 'Customer Relations');

INSERT INTO tblEmployeA
VALUES(131	,'Jossef','	H',	'Wright',	'TX593671R',	'1971-12-24',	'Litigation')
