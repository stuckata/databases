SELECT c.CountryName, c.CountryCode, 
	CASE c.CurrencyCode
		WHEN 'EUR' THEN 'Inside'
		ELSE 'Outside'
	END AS [Eurozone]
FROM Countries c
ORDER BY c.CountryName