SELECT t.Name AS [Town], d.Name AS [Department], COUNT(*) AS [Employees count]
FROM Employees e
INNER JOIN Addresses a
ON e.AddressID = a.AddressID
INNER JOIN Towns t
ON a.TownID = t.TownID
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY t.Name, d.Name