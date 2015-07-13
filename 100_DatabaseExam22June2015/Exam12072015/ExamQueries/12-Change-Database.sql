SELECT u.Username AS [Username], g.Name AS [Name], ug.Cash AS [Cash], i.Name AS [Item Name]
FROM Users u
INNER JOIN UsersGames ug
ON ug.UserId = u.Id
INNER JOIN Games g
ON g.Id = ug.GameId
INNER JOIN Characters c
ON c.Id = ug.CharacterId
INNER JOIN [Statistics] s
ON s.Id = c.StatisticId
INNER JOIN Items i
ON i.StatisticId = s.Id
WHERE g.Name = 'Edinburgh'

SELECT * FROM Users WHERE Username = 'Alex'

SELECT * FROM UsersGames WHERE UserId = '5'

SELECT * FROM UserGameItems WHERE UserGameId = ''

SELECT * FROM Items WHERE Name = 'Golden Gorget of Leoric'

SELECT SUM() FROM Items