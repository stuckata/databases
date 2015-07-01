SELECT d.Name AS [Department], e.JobTitle AS [Job Title], MIN(e.FirstName) AS [First Name], MIN(e.Salary) AS [Min Salary]
FROM Employees e
INNER JOIN Departments d
ON d.DepartmentID = e.DepartmentID
GROUP BY d.Name, e.JobTitle