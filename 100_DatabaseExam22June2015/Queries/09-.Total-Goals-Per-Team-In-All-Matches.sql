SELECT t.TeamName, ISNULL(SUM(TeamGoals.Goals), 0) AS [Total Goals]
FROM Teams t
LEFT JOIN(
			SELECT tmh.HomeTeamId AS TeamId, tmh.HomeGoals AS Goals
			FROM TeamMatches tmh
			UNION ALL
			SELECT tma.AwayTeamId, tma.AwayGoals
			FROM TeamMatches tma) AS TeamGoals
ON TeamGoals.TeamId = t.Id
GROUP BY t.TeamName
ORDER BY [Total Goals] DESC, t.TeamName