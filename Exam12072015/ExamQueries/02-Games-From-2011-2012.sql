SELECT TOP 50 g.Name AS [Game], CAST(g.Start AS DATE) AS Start
FROM Games g
WHERE g.Start BETWEEN '2010-12-31' AND '2013-01-01'
ORDER BY Start, [Game]