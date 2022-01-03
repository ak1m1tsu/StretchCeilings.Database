SELECT Services.id, Services.name, Count(OrderServices.order_id) Count FROM Services
INNER JOIN OrderServices ON Services.id = OrderServices.service_id
WHERE Services.date_deleted IS NULL
GROUP BY Services.id, Services.name
