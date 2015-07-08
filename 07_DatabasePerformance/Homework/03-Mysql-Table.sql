CREATE TABLE tests_data (
    Id INT NOT NULL AUTO_INCREMENT,
    TestDate DATE NOT NULL,
    TestText NVARCHAR(20) NOT NULL,
    PRIMARY KEY (Id)
);

DELIMITER $$;

CREATE PROCEDURE populate_table()
BEGIN
	DECLARE rows_num INT;
	SET rows_num = 1000000;

	WHILE rows_num > 0 DO
			BEGIN
				DECLARE test_date DATE;
                DECLARE test_text NVARCHAR(20);
                SET test_date = CURRENT_TIMESTAMP - INTERVAL FLOOR(RAND() * 5475) DAY;
                SET test_text = SUBSTRING(MD5(RAND()), -8);
				
				INSERT INTO tests_data (TestDate, TestText)
				VALUES (test_date, test_text);
                
				SET rows_num = rows_num - 1;
			END;
	END WHILE;
END;

DELIMITER ;

CALL populate_table();

ALTER TABLE tests_data MODIFY Id INT NOT NULL;
ALTER TABLE tests_data DROP PRIMARY KEY;

ALTER TABLE tests_data
PARTITION BY RANGE (TO_DAYS(TestDate))
(
  PARTITION p01 VALUES LESS THAN (TO_DAYS('2005-01-01')),
  PARTITION p02 VALUES LESS THAN (TO_DAYS('2010-01-01')),
  PARTITION p03 VALUES LESS THAN (TO_DAYS('2015-01-01')),
  PARTITION p04 VALUES LESS THAN (MAXVALUE));
