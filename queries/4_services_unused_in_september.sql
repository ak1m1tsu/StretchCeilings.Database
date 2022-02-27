SELECT AdditionalServices.* FROM AdditionalServices
WHERE NOT AdditionalServices.Id IN (
	SELECT ServiceAdditionalServices.AdditionalServiceId
	FROM ServiceAdditionalServices
	INNER JOIN OrderServices ON OrderServices.ServiceId = ServiceAdditionalServices.ServiceId
	INNER JOIN Services ON ServiceAdditionalServices.ServiceId = Services.Id
	INNER JOIN Orders ON Orders.Id = OrderServices.OrderId
	WHERE Orders.DatePlaced BETWEEN "2022-09-01 00:00:00" AND "2022-10-01 00:00:00"
		AND Orders.DeletedDate IS NULL AND Services.DeletedDate IS NULL
	GROUP BY ServiceAdditionalServices.AdditionalServiceId
)