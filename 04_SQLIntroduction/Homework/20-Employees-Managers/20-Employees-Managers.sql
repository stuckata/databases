SELECT e.FirstName + ' ' + e.LastName AS [Employee name], m.FirstName + ' ' + m.LastName AS [Manager name]
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID