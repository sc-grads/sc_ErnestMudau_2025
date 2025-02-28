SELECT name, salary 
FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees);

