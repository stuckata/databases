SELECT d.Name AS [Department], AVG(e.Salary) AS [Average Salary]
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name