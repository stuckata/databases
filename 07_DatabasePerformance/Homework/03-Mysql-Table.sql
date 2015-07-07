CREATE TABLE tests_data (
    Id INT NOT NULL AUTO_INCREMENT,
    TestDate DATE NOT NULL,
    TestText NVARCHAR(20) NOT NULL,
    PRIMARY KEY (Id)
);


BEGIN
	DECLARE rows_num INT DEFAULT 10000000
	SET rows_num = 10000000

	WHILE rowsNum > 0 DO
			BEGIN
				DECLARE test_date DATE = DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 5475), '2000-01-01')
				DECLARE test_text NVARCHAR(20) = SUBSTRING(CONVERT(NVARCHAR(50), NEWID()),0,9)
				
				INSERT INTO tests_data
				VALUES(test_date, test_text)
				SET rows_num = rows_num - 1
			END
	END WHILE
END
