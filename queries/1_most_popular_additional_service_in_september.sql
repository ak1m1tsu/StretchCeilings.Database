SELECT AdditionalServices.*, MAX(T.Count) Count
FROM AdditionalServices
INNER JOIN (
	SELECT ServiceAdditionalServices.AdditionalServiceId , SUM(ServiceAdditionalServices.Count) Count
	FROM ServiceAdditionalServices
	INNER JOIN OrderServices ON OrderServices.ServiceId = ServiceAdditionalServices.ServiceId
	INNER JOIN Services ON ServiceAdditionalServices.ServiceId = Services.Id
	INNER JOIN Orders ON Orders.Id = OrderServices.OrderId
	WHERE Orders.DatePlaced BETWEEN "2022-09-01 00:00:00" AND "2022-10-01 00:00:00"
		AND Orders.DeletedDate IS NULL AND Services.DeletedDate IS NULL
	GROUP BY ServiceAdditionalServices.AdditionalServiceId
) T ON T.AdditionalServiceId = AdditionalServices.Id