SELECT i.Name, i.Price, i.MinLevel, s.Strength, s.Defence, s.Speed, s.Luck, s.Mind
FROM Items i
INNER JOIN [Statistics] s
ON s.Id = i.StatisticId
WHERE s.Speed > (SELECT AVG(Speed) FROM [Statistics]) AND 
		s.Luck > (SELECT AVG(Luck) FROM [Statistics]) AND
		s.Mind > (SELECT AVG(Mind) FROM [Statistics])
ORDER BY i.Name