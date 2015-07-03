USE TestSP
GO

CREATE PROC dbo.usp_SelectBalance(@balance MONEY = 2000.00)
AS
  SELECT p.FirstName + ' ' + p.LastName AS [Full Name], a.Balance AS [Balance]
  FROM Persons p
  INNER JOIN Accounts a
  ON p.Id = a.PersonId
  WHERE a.Balance > @balance
GO

EXEC usp_SelectBalance

EXEC usp_SelectBalance 3000.00