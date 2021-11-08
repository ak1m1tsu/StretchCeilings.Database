SELECT Orders.* FROM Orders
INNER JOIN Customers ON Customers.id = Orders.customer_id AND Customers.phone LIKE "7999%"