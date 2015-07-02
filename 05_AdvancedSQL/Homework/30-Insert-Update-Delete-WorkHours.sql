INSERT INTO WorkHours
VALUES(6, CONVERT(DATE, GETDATE()), 'Create new DB', 1, 'Tables should have ...')

INSERT INTO WorkHours
VALUES(12, CONVERT(DATE, GETDATE()), 'New Interface...', 3, 'Should be implemented by...')

INSERT INTO WorkHours
VALUES(24, CONVERT(DATE, GETDATE()), 'New class...', 1, 'Should implement...')

INSERT INTO WorkHours
VALUES(56, CONVERT(DATE, GETDATE()), 'Should delete...', 1, 'Just do it...')

UPDATE WorkHours
SET TaskDate = CONVERT(DATE, '2015-06-29')
WHERE Id='2'

UPDATE WorkHours
SET TaskWorkHours = 4
WHERE EmployeeId='24'

DELETE FROM WorkHours
WHERE Id='4'
