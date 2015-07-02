CREATE TABLE WorkHoursLogs
	(
		Id int NOT NULL PRIMARY KEY IDENTITY,
		WorkHoursId int NOT NULL, 	
		OldRecord nvarchar(max),
		NewRecord nvarchar(max),
		CommandType nvarchar(20)
	)
GO

CREATE TRIGGER WorkHoursUpdate_trigger ON WorkHours FOR UPDATE
AS
	INSERT INTO WorkHoursLogs(WorkHoursId, OldRecord, NewRecord, CommandType)
	SELECT i.Id, d.Task, i.Task, 'UPDATE'
	FROM deleted d, inserted i
GO

CREATE TRIGGER WorkHoursDelete_trigger ON WorkHours FOR DELETE
AS
	INSERT INTO WorkHoursLogs(WorkHoursId, OldRecord, NewRecord, CommandType)
	SELECT d.Id, d.Task, NULL, 'DELETE'
	FROM deleted d
GO

CREATE TRIGGER WorkHoursInsert_trigger ON WorkHours FOR INSERT
AS
	INSERT INTO WorkHoursLogs(WorkHoursId, OldRecord, NewRecord, CommandType)
	SELECT i.Id, NULL, i.Task, 'INSERT'
	FROM inserted i
GO
