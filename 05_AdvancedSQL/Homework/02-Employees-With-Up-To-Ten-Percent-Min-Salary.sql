SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN (SELECT MIN(Salary) FROM Employees) AND (SELECT MIN(Salary) * 1.1 FROM Employees)