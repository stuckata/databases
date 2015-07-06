USE master
GO

CREATE DATABASE TestPerformance
GO

USE TestPerformance
GO

CREATE TABLE TestData
	(
		Id INT NOT NULL IDENTITY PRIMARY KEY,
		TestDate DATE NOT NULL,
		TestText NVARCHAR(50) NOT NULL
	)
GO

CREATE FUNCTION ufn_GenerateRandomString()
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @lenght INT
	DECLARE @charPool NVARCHAR(100)
	DECLARE @poolLength INT
	DECLARE @loopCount INT
	DECLARE @randomString NVARCHAR

	-- min_length = 8, max_length = 12
	SET @lenght = RAND() * 5 + 8
	-- SET @Length = RAND() * (max_length - min_length + 1) + min_length

	-- define allowable character explicitly - easy to read this way an easy to 
	-- omit easily confused chars like l (ell) and 1 (one) or 0 (zero) and O (oh)
	SET @charPool = 
		'abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ23456789.,-_!$@#%^&*'
	SET @poolLength = Len(@charPool)

	SET @loopCount = 0
	SET @randomString = ''

	WHILE (@loopCount < @lenght) BEGIN
		SELECT @randomString = @randomString + 
			SUBSTRING(@charPool, CONVERT(INT, RAND() * @poolLength), 1)
		SELECT @loopCount = @loopCount + 1
	END

	RETURN @randomString
END
GO
