SELECT t.TeamName AS [Team Name], t.CountryCode AS [Country Code]
FROM Teams t
WHERE t.TeamName LIKE '%[0123456789]%'