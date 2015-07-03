USE TestSP
GO

CREATE PROC usp_WithdrawMoney(@accountId INT, @money MONEY)
AS
	UPDATE Accounts
	SET Balance = Balance - @money
	WHERE Id = @accountId
GO

CREATE PROC usp_DepositMoney(@accountId INT, @money MONEY)
AS
	UPDATE Accounts
	SET Balance = Balance + @money
	WHERE Id = @accountId
GO

EXEC usp_DepositMoney 3, 1000.00
EXEC usp_WithdrawMoney 3, 2000.00