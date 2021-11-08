SELECT Orders.* FROM Orders
INNER JOIN OrderServices ON Orders.id = OrderServices.order_id
GROUP BY Orders.id
HAVING OrderServices.service_id NOT BETWEEN @id_from AND @id_to