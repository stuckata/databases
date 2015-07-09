SELECT t.TeamName AS [Team Name], l.LeagueName AS [League], 
	CASE 
		WHEN l.CountryCode IS NULL THEN 'International'
		ELSE c.CountryName
	END AS [League Country]
FROM Teams t
INNER JOIN Leagues_Teams lt
ON t.Id = lt.TeamId
INNER JOIN Leagues l
ON lt.LeagueId = l.Id
LEFT JOIN Countries c
ON l.CountryCode = c.CountryCode
ORDER BY t.TeamName, l.LeagueName