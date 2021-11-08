SELECT Orders.* FROM Orders
INNER JOIN OrderServices ON Orders.id = OrderServices.order_id
INNER JOIN Services ON Services.id = OrderServices.service_id AND Services.name = @service_name