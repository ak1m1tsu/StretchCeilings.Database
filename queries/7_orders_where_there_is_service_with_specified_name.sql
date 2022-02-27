SELECT Orders.* FROM Orders
INNER JOIN OrderServices ON OrderServices.OrderId = Orders.Id
INNER JOIN Services ON Services.Id = OrderServices.ServiceId
INNER JOIN ServiceAdditionalServices ON ServiceAdditionalServices.ServiceId = Services.Id
INNER JOIN AdditionalServices ON AdditionalServices.Id = ServiceAdditionalServices.AdditionalServiceId 
    AND AdditionalServices.Name = @name
GROUP BY Orders.Id