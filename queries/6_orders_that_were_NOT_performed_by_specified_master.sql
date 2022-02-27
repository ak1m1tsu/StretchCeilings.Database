SELECT Orders.* FROM Orders
WHERE Orders.Id NOT IN (
	SELECT Orders.Id FROM Orders
	INNER JOIN OrderEmployees ON OrderEmployees.OrderId = Orders.Id
	WHERE OrderEmployees.EmployeeId = @id
)
GROUP BY Orders.Id