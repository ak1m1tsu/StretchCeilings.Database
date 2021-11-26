SELECT Orders.* FROM Orders
INNER JOIN OrderEmployees ON OrderEmployees.order_id = Orders.id
WHERE Orders.date_canceled IS NULL AND OrderEmployees.order_id NOT IN (
    SELECT OrderEmployees.order_id FROM OrderEmployees
    INNER JOIN Orders ON Orders.id = OrderEmployees.order_id
    WHERE employee_id = @id AND employee_id IS NOT NULL
)
GROUP BY Orders.id