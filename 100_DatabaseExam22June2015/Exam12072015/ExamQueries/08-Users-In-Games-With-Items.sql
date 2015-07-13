SELECT u.Username, g.Name AS [Game], COUNT(i.Id) AS [Items Count], SUM(i.Price) AS [Items Price]
FROM Users u
INNER JOIN UsersGames ug
ON ug.UserId = u.Id
INNER JOIN Games g
ON g.Id = ug.GameId
INNER JOIN UserGameItems ugi
ON ug.Id = ugi.UserGameId
INNER JOIN Items i
ON i.Id = ugi.ItemId
GROUP BY u.Username, g.Name
HAVING COUNT(i.Id) >= 10
ORDER BY COUNT(i.Id) DESC, SUM(i.Price) DESC, u.Username