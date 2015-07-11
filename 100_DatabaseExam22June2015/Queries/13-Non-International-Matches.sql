SELECT ht.TeamName AS [Home Team], at.TeamName AS [Away Team], fm.MatchDate AS [Match Date]
FROM FriendlyMatches fm
INNER JOIN Teams ht
ON ht.Id = fm.HomeTeamID
INNER JOIN Teams at
ON at.Id = fm.AwayTeamId
UNION
SELECT ht.TeamName AS [Home Team], at.TeamName AS [Away Team], tm.MatchDate AS [Match Date]
FROM TeamMatches tm
INNER JOIN Teams ht
ON ht.Id = tm.HomeTeamId
INNER JOIN Teams at
ON at.Id = tm.AwayTeamId
ORDER BY [Match Date] DESC