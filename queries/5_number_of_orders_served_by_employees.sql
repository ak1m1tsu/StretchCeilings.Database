SELECT Employees.*, Count(OrderEmployees.OrderId) Count FROM Employees
INNER JOIN OrderEmployees ON OrderEmployees.EmployeeId = Employees.Id
INNER JOIN (
	SELECT Orders.Id FROM Orders
	WHERE Orders.DeletedDate IS NULL
) O ON O.Id = OrderEmployees.OrderId
WHERE Employees.DeletedDate IS NULL
GROUP BY Employees.Id