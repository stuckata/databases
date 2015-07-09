SELECT
  TeamName AS [Team Name],
  LeagueName AS [League],
  (CASE WHEN l.CountryCode IS NULL THEN 'International' ELSE c.CountryName END) AS [League Country]
FROM Teams t
JOIN Leagues_Teams lt on t.Id = lt.TeamId
JOIN Leagues l on l.id = lt.LeagueId
LEFT JOIN Countries c on c.CountryCode = l.CountryCode
ORDER BY TeamName