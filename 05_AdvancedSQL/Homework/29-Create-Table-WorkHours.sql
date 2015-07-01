CREATE TABLE WorkHours 
	(
		Id INT NOT NULL IDENTITY PRIMARY KEY,
		EmployeeId INT NOT NULL FOREIGN KEY REFERENCES Employees(EmployeeId),
		TaskDate DATE,
		Task NVARCHAR(200),
		TaskWorkHours INT,
		Comments NVARCHAR(200)
	)