SELECT Orders.id, Orders.total FROM Orders
WHERE Orders.date_canceled IS NULL
ORDER BY total DESC
LIMIT 10