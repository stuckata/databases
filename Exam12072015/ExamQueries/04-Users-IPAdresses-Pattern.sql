SELECT u.Username, u.IpAddress AS [IP Address]
FROM Users u
WHERE u.IpAddress LIKE '___.1%.%.___'
ORDER BY u.Username