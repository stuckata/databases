SELECT COUNT(e.EmployeeID) AS [Employees with manager]
FROM Employees e
WHERE e.ManagerID IS NOT NULL