SELECT t.TeamName AS [Team Name], l.LeagueName AS [League], ISNULL(c.CountryName, 'International') AS [League Country]
FROM Leagues_Teams lt
LEFT JOIN Teams t
ON lt.TeamId = t.Id
LEFT JOIN Leagues l
ON lt.LeagueId = l.Id
LEFT JOIN Countries c
ON l.CountryCode = c.CountryCode
ORDER BY t.TeamName