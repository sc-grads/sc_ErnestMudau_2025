SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

