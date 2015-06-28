SELECT e.FirstName, e.LastName, e.Salary, d.Name
FROM Employees e
INNER JOIN Departments d
	ON e.DepartmentID = d.DepartmentID
INNER JOIN (SELECT MIN(Salary) AS MinSalary, DepartmentID FROM Employees GROUP BY DepartmentID) m
	ON d.DepartmentID = m.DepartmentID AND e.Salary = m.MinSalary
