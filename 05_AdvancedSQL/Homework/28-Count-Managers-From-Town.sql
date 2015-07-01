SELECT mt.Name AS [Town], COUNT(mt.Name) AS [Number of managers]
FROM (
		SELECT m.FirstName, m.LastName, t.Name
		FROM Towns t
		INNER JOIN Addresses a
		ON t.TownID = a.TownID
		INNER JOIN (
				SELECT m.FirstName, m.LastName, m.AddressID
				FROM Employees e
				INNER JOIN Employees m
				ON e.ManagerID = m.EmployeeID
				GROUP BY m.FirstName, m.LastName, m.AddressID
				) m
		ON m.AddressID = a.AddressID
		GROUP BY m.FirstName, m.LastName, t.Name
	) mt
GROUP BY mt.Name
