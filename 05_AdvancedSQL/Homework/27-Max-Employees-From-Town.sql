SELECT TOP 1 te.Name, MAX([Count]) AS [Number of employees]
FROM (
		SELECT t.Name, COUNT(t.TownID) AS [Count]
		FROM Towns t
		INNER JOIN Addresses a
		ON t.TownID = a.TownID
		INNER JOIN Employees e
		ON a.AddressID = e.AddressID
		GROUP BY t.Name
	) te
GROUP BY te.Name
ORDER BY [Number of employees] DESC