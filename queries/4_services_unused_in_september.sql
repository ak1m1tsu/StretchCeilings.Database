SELECT Services.id, Services.name FROM Services
WHERE Services.date_deleted IS NULL AND Services.id NOT IN (
    SELECT OrderServices.service_id FROM OrderServices
    INNER JOIN Orders ON Orders.id = OrderServices.order_id
    WHERE Orders.date_canceled IS NULL AND Orders.date_placed BETWEEN "2020-09-01" AND "2020-09-31"
)