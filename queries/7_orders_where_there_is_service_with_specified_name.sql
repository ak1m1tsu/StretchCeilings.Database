SELECT Orders.id, Orders.date_placed, Orders.total FROM Orders
INNER JOIN OrderServices ON Orders.id = OrderServices.order_id
INNER JOIN Services ON Services.id = OrderServices.service_id AND Services.name = @service_name
WHERE Orders.date_canceled IS NULL
GROUP BY Orders.id, Orders.date_placed, Orders.total