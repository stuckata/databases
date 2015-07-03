USE TestSP
GO

CREATE PROC usp_CalculatePersonInterest(@accountId INT, @earlyInterest MONEY)
AS
	UPDATE Accounts
	SET Balance = dbo.ufn_CalculateSumWithInterest(Balance, @earlyInterest, 1)
	WHERE Id = @accountId
GO

EXEC usp_CalculatePersonInterest 3, 7

SELECT * FROM Accounts