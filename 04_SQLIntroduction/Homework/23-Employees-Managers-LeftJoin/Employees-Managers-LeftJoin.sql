SELECT e.FirstName + ' ' + e.LastName AS [Employee Name], m.FirstName + ' ' + m.LastName AS [Manager Name]
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID