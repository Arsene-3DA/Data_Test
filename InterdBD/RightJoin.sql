SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Employees
RIGHT JOIN Orders
ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;