SELECT DISTINCT m.FirstName, m.LastName, COUNT(*) AS [Employees count]
FROM Employees e
INNER JOIN Employees m
ON m.EmployeeID = e.ManagerID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(*) = '5'