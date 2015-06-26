SELECT Employees.FirstName, Employees.LastName, Addresses.AddressText AS Adress, Towns.Name AS Town
FROM Employees
INNER JOIN Addresses
ON Employees.AddressID = Addresses.AddressID
INNER JOIN Towns
ON Addresses.TownID = Towns.TownID