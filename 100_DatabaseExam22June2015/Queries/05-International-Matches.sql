SELECT hc.CountryName AS [Home Team], ac.CountryName AS [Away Team], i.MatchDate AS [Match Date]
FROM InternationalMatches i
INNER JOIN Countries hc
ON i.HomeCountryCode = hc.CountryCode
INNER JOIN Countries ac
ON i.AwayCountryCode = ac.CountryCode
ORDER BY i.MatchDate DESC
