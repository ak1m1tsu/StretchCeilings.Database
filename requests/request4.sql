SELECT * FROM Services S
WHERE id NOT IN (
    SELECT service_id FROM OrderServices
    INNER JOIN Orders ON Orders.id = OrderServices.order_id
    WHERE Orders.date_placed BETWEEN "2020-09-01" AND "2020-09-31"
)