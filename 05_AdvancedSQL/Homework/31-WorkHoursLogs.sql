CREATE TRIGGER WorkHoursLogs
ON WorkHours
FOR INSERT, UPDATE, DELETE
AS
DECLARE @EmpID INT, @user VARCHAR(20), @activity VARCHAR(20);

IF EXISTS(SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
BEGIN
    SET @activity = 'UPDATE';
    SET @user = SYSTEM_USER;
    SELECT @EmpID = EmployeeID FROM inserted i;
    INSERT INTO Emp_Audit(EmpID,Activity, DoneBy) VALUES (@EmpID,@activity,@user);
END

IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
BEGIN
    SET @activity = 'INSERT';
    SET @user = SYSTEM_USER;
    SELECT @EmpID = EmployeeID from inserted i;
    INSERT into Emp_Audit(EmpID,Activity, DoneBy) values(@EmpID,@activity,@user);
END

IF EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
BEGIN 
    SET @activity = 'DELETE';
    SET @user = SYSTEM_USER;
    SELECT @EmpID = EmployeeID from deleted i;
    INSERT into Emp_Audit(EmpID,Activity, DoneBy) values(@EmpID,@activity,@user);
END
