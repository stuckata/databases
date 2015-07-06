USE TestSP

CREATE TABLE Logs
(
Id INT NOT NULL IDENTITY PRIMARY KEY,
AccountId INT NOT NULL FOREIGN KEY REFERENCES Accounts(Id),
OldSum MONEY NOT NULL,
NewSum MONEY NOT NULL,
)
GO

CREATE TRIGGER tr_AccountBalanceUpdate
ON Accounts
FOR UPDATE
AS
	INSERT INTO Logs(AccountId, OldSum, NewSum)
	SELECT i.Id, d.Balance, i.Balance
	FROM DELETED d, INSERTED i
GO

EXEC usp_DepositMoney 3, 1000.00