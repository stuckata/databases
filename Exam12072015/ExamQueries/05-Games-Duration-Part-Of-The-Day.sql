SELECT g.Name AS [Game], 
	CASE 
		WHEN CONVERT(VARCHAR(5), g.Start, 108) BETWEEN '0:00' AND '11:59' THEN 'Morning'
		WHEN CONVERT(VARCHAR(5), g.Start, 108) BETWEEN '12:00' AND '17:59' THEN 'Afternoon'
		WHEN CONVERT(VARCHAR(5), g.Start, 108) BETWEEN '18:00' AND '23:59' THEN 'Evening'
	END AS [Part of the Day], 
	CASE 
		WHEN g.Duration <= 3 THEN 'Extra Short'
		WHEN g.Duration > 3 AND g.Duration <= 6 THEN 'Short'
		WHEN g.Duration > 6 THEN 'Long'
		WHEN g.Duration IS NULL THEN 'Extra Long'
	END AS [Duration]
FROM Games g
ORDER BY [Game], [Duration], [Part of the Day]