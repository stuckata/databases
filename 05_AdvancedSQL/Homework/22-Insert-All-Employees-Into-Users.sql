INSERT INTO Users (Username, UserPassword, FullName, LastLoginTime)
SELECT SUBSTRING(e.FirstName, 1, 1) + LOWER(e.LastName), 
	SUBSTRING(e.FirstName, 1, 1) + LOWER(e.LastName), 
	e.FirstName + ' ' + e.LastName, 
	NULL
FROM Employees e