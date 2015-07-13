SELECT u.Username, substring(u.Email, CHARINDEX('@', email) + 1, LEN(email)) AS [Email Provider]
FROM Users u
ORDER BY substring(u.Email, CHARINDEX('@', email) + 1, LEN(email)), u.Username