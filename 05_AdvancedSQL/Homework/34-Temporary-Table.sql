DECLARE @temporaryEmployeesProjects TABLE
(
        EmployeeID INT NOT NULL,
        ProjectID INT NOT NULL
)
INSERT INTO @temporaryEmployeesProjects
        SELECT EmployeeID, ProjectID FROM EmployeesProjects
DROP TABLE EmployeesProjects
CREATE TABLE EmployeesProjects
(
        EmployeeID INT NOT NULL,
        ProjectID INT NOT NULL
)
INSERT INTO EmployeesProjects
        SELECT * FROM @temporaryEmployeesProjects
GO

SELECT * FROM EmployeesProjects