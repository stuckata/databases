SELECT *
FROM Leagues l
JOIN(SELECT tm.LeagueId, COUNT(tm.HomeTeamId) AS MatchesNum
		FROM TeamMatches tm
		GROUP BY tm.LeagueId
		HAVING tm.LeagueId IS NOT NULL
	) AS LeagueMatches
ON l.Id = LeagueMatches.LeagueId
JOIN(
		SELECT lt.LeagueId, COUNT(lt.TeamId) AS TeamNum
		FROM Leagues_Teams lt
		GROUP BY lt.LeagueId) AS LeagueTeamNum
ON LeagueMatches.LeagueId = LeagueTeamNum.LeagueId
WHERE l.CountryCode IS NOT NULL