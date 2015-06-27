SELECT e.FirstName, e.LastName, a.AddressText, t.Name
FROM Employees e, Addresses a, Towns t
WHERE e.AddressID = a.AddressID AND a.TownID = t.TownID