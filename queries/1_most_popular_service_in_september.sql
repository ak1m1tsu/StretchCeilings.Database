SELECT Services.id, Services.name, SUM(OrderServices.count) count FROM Services
INNER JOIN OrderServices ON Services.id = OrderServices.service_id
WHERE Services.date_deleted IS NULL AND  Services.id IN (
    SELECT OrderServices.service_id FROM OrderServices
    INNER JOIN Orders ON Orders.id = OrderServices.order_id
    WHERE Orders.date_placed BETWEEN "2020-09-01" AND "2020-09-31"
)
GROUP BY Services.id, Services.name
ORDER BY count DESC
LIMIT 1