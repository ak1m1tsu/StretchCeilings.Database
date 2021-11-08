SELECT Masters.full_name, COUNT(Orders.master_id) AS order_count FROM Masters
INNER JOIN Orders ON Masters.id = Orders.master_id
WHERE Orders.date_placed BETWEEN "2020-09-01" AND "2020-09-31"
GROUP BY Masters.full_name, order_count