SELECT e.FirstName + ' ' + e.LastName AS [Name], d.Name AS [Department], e.HireDate AS [Hire Date]
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE (d.Name = 'Sales' OR d.Name = 'Finance') AND (e.HireDate BETWEEN '1995-01-01' AND '2005-01-01')
