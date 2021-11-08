SELECT Masters.*, COUNT(Orders.master_id) AS "orders_count" FROM Masters
INNER JOIN Orders ON Masters.id = Orders.master_id
WHERE Orders.date_placed BETWEEN "2020-08-01" AND "2020-08-31"
GROUP BY Masters.full_name
ORDER BY orders_count DESC
LIMIT 1;