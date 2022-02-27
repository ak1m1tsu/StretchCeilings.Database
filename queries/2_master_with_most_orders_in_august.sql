SELECT Employees.*, MAX(O.Count) Count
FROM Employees
INNER JOIN (
	SELECT OrderEmployees.EmployeeId, COUNT(OrderEmployees.OrderId) Count
	FROM OrderEmployees
	INNER JOIN Employees ON Employees.Id = OrderEmployees.EmployeeId
	INNER JOIN Orders ON Orders.Id = OrderEmployees.OrderId
	WHERE Employees.RoleId == 3 AND Orders.DatePlaced BETWEEN "2022-08-01 00:00:00" AND "2022-09-01 00:00:00" 
		AND Orders.DeletedDate IS NULL AND Employees.DeletedDate IS NULL
	GROUP BY OrderEmployees.EmployeeId
) O ON O.EmployeeId = Employees.Id