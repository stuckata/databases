CREATE DATABASE test_performance;

USE test_performance;

CREATE TABLE test_data
	(
		Id INT NOT NULL AUTO_INCREMENT,
		TestDate DATE NOT NULL,
		TestText NVARCHAR(20) NOT NULL,
        PRIMARY KEY(Id)
    );
    
USE test_data;
 
BEGIN
	DECLARE rows INT = 10000000
    
	WHILE rows > 0 DO
	BEGIN
		DECLARE test_date DATE = DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 5475), '2000-01-01')
		DECLARE test_text NVARCHAR(20) = SUBSTRING(CONVERT(NVARCHAR(50), NEWID()),0,9)
		INSERT INTO TestData
		VALUES(test_date, test_text)
		SET rows = rows - 1
	END WHILE;
END;