CREATE TRIGGER WorkHours_trigger
ON WorkHours
FOR INSERT, UPDATE, DELETE
AS
DECLARE @EmployeeId INT, @TaskDate DATE, @Task NVARCHAR(200), @TaskWorkHours INT, @Comments NVARCHAR(200), @Command NVARCHAR(20);

IF EXISTS(SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
BEGIN
    SET @Command = 'UPDATE';
    SELECT @EmployeeId = EmployeeID FROM inserted i;
	SELECT @TaskDate = TaskDate FROM inserted i;
	SELECT @Task = Task FROM inserted i;
	SELECT @TaskWorkHours = TaskWorkHours FROM inserted i;
	SELECT @Comments = Comments FROM inserted i;
	SELECT @Command = Command FROM inserted i;
    INSERT INTO WorkHoursLogs(EmployeeID ,TaskDate, Task, TaskWorkHours, Comments, Command) VALUES (@EmployeeId, @TaskDate, @Task, @TaskWorkHours, @Comments, @Command);
END

IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
BEGIN
    SET @Command = 'INSERT';
    SELECT @EmpID = EmployeeID FROM inserted i;
    INSERT INTO WorkHoursLogs(EmpID,Activity, DoneBy) VALUES(@EmpID,@activity,@user);
END

IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
BEGIN 
    SET @Command = 'DELETE';
    SELECT @EmpID = EmployeeID FROM deleted i;
    INSERT INTO WorkHoursLogs(EmpID,Activity, DoneBy) VALUES(@EmpID,@activity,@user);
END
