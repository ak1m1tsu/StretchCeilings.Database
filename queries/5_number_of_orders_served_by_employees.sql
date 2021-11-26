SELECT Employees.id, Employees.full_name, Count(OrderEmployees.order_id) Count FROM Employees
INNER JOIN OrderEmployees ON Employees.id = OrderEmployees.employee_id
WHERE Employees.date_deleted IS NULL AND  OrderEmployees.order_id IN (
    SELECT Orders.id FROM Orders
    WHERE Orders.date_canceled IS NULL
)
GROUP BY Employees.id, Employees.full_name