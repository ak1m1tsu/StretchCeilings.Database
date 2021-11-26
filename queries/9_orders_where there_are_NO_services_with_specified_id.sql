SELECT Orders.id, Orders.date_placed, Orders.total FROM Orders
INNER JOIN OrderServices ON Orders.id = OrderServices.order_id
WHERE Orders.date_canceled IS NULL
GROUP BY Orders.id, Orders.date_placed, Orders.total
HAVING OrderServices.service_id NOT BETWEEN @id_from AND @id_to