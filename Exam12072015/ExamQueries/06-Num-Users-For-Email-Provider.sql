SELECT substring(u.Email, CHARINDEX('@', email) + 1, LEN(email)) AS [Email Provider], 
	COUNT(u.Id) AS [Number Of Users]
FROM Users u
GROUP BY substring(u.Email, CHARINDEX('@', email) + 1, LEN(email))
ORDER BY [Number Of Users] DESC, [Email Provider]