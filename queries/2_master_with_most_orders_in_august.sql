SELECT Employees.id, Employees.full_name, Count(OrderEmployees.order_id) Count FROM Employees
INNER JOIN OrderEmployees ON Employees.id = OrderEmployees.employee_id
WHERE Employees.date_deleted IS NULL AND  OrderEmployees.order_id IN (
    SELECT Orders.id FROM Orders
    WHERE Orders.date_canceled IS NULL AND Orders.date_placed BETWEEN "2020-08-01" AND "2020-09-01"
)
GROUP BY Employees.id, Employees.full_name
ORDER BY Count DESC
LIMIT 1