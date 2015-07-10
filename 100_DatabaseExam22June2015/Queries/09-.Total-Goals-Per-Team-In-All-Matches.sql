SELECT t.TeamName, ISNULL(SUM(tmh.HomeGoals), 0) + ISNULL(SUM(tma.AwayGoals), 0) AS [Total Goals]
FROM Teams t
LEFT JOIN TeamMatches tmh
ON t.Id = tmh.HomeTeamId
LEFT JOIN TeamMatches tma
ON t.Id = tma.AwayTeamId
GROUP BY t.TeamName
ORDER BY [Total Goals] DESC, t.TeamName