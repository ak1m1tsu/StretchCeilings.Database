SELECT Orders.id, Customers.full_name, Customers.phone_number FROM Orders
INNER JOIN Customers ON Customers.id = Orders.customer_id AND Customers.phone_number LIKE "7999%"
WHERE Customers.date_deleted IS NULL
GROUP BY Orders.id, Customers.full_name, Customers.phone_number