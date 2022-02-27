SELECT Orders.* FROM Orders
INNER JOIN Customers ON Customers.Id = Orders.CustomerId AND Customers.PhoneNumber LIKE "+7(950)%"
WHERE Customers.DeletedDate IS NULL
GROUP BY Orders.Id