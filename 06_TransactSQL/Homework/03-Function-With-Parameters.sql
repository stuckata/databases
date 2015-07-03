USE TestSP
GO

CREATE FUNCTION ufn_CalculateSumWithInterest(@sum MONEY, @yearlyInterest MONEY, @numberOfMonths INT) RETURNS MONEY
AS
BEGIN
	RETURN (@sum + (@yearlyInterest/100)/12 * @numberOfMonths * @sum)
END
GO

SELECT dbo.ufn_CalculateSumWithInterest(1000, 7, 6) AS [Sum]


