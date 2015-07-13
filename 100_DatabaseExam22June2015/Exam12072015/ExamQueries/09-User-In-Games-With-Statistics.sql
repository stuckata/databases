SELECT u.Username, g.Name AS [Game], c.Name AS [Character], SUM(s.Strength), s.Defence, s.Speed, s.Mind, s.Luck
FROM Users u
INNER JOIN UsersGames ug
ON ug.UserId = u.Id
INNER JOIN Games g
ON g.Id = ug.GameId
INNER JOIN Characters c
ON c.Id = ug.CharacterId
INNER JOIN [Statistics] s
ON s.Id = c.StatisticId