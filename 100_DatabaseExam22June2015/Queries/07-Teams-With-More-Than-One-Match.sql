SELECT t.TeamName AS [Team], tc.CountM AS [Matches Count]
FROM Teams t
JOIN 
	(SELECT TId.HomeTeamId, COUNT(TId.HomeTeamId) AS CountM
	FROM (
		SELECT th.HomeTeamId
		FROM TeamMatches th
		UNION ALL
		SELECT ta.AwayTeamId
		FROM TeamMatches ta) AS TId
	GROUP BY TId.HomeTeamId
	HAVING COUNT(TId.HomeTeamId) > 1) AS tc
ON t.Id = tc.HomeTeamId
ORDER BY t.TeamName