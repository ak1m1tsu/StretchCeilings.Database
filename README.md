# SQLite Datebase and queries
<hr>

Данный репозиторий содержит реляционную базу данных, схему реляционной базы данных, запросы на выборку данных.
<br>
Цель данной работы - получение навыков построения реляционных баз данных и знакомство с SQL синтаксисом

Схема базы данных создана при помощи **[Microolap Batabase Designer for Postgre SQL](https://www.microolap.com/products/database/postgresql-designer/download/)**
<br>
Сама база данных создана при помощи **[SQLiteStudio](https://sqlitestudio.pl/)**


### Схема базы данных
<hr>

![](./assets/db_schema.png)


### Запросы к базе данных
<hr>

#### 1. Самая популярная дополнительная услуга в сентябре.

```sql
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
```

#### 2. Мастер, у которого больше всего заказов в августе.

```sql
SELECT Employees.*, MAX(O.Count) Count
FROM Employees
INNER JOIN (
	SELECT OrderEmployees.EmployeeId, COUNT(OrderEmployees.OrderId) Count
	FROM OrderEmployees
	INNER JOIN Employees ON Employees.Id = OrderEmployees.EmployeeId
	INNER JOIN Orders ON Orders.Id = OrderEmployees.OrderId
	WHERE Employees.RoleId == 3 AND Orders.DatePlaced BETWEEN "2022-08-01 00:00:00" AND "2022-09-01 00:00:00" 
		AND Orders.DeletedDate IS NULL AND Employees.DeletedDate IS NULL
	GROUP BY OrderEmployees.EmployeeId
) O ON O.EmployeeId = Employees.Id
```

#### 3. Кол-во услуг за все время.

```sql

```

#### 4. Неиспользуемые в сентябре услуги.

```sql

```

#### 5. Количество обслуженных заказов мастерами.

```sql

```

#### 6. Заказы, которые не выполнял указанный мастер.

```sql

```

> Комментарий: **`@id`** - переменная, значение которой является **идентификатор** мастера.

#### 7. Заказ, где есть услуга с указанным наименованием.

```sql

```

> Комментарий: **`@service_name`** - переменная, значение которой является **наименовением** услуги.

#### 8. Заказы, где номера телефонов клиентов начинаются на 7999.

```sql

```

#### 9. Заказы, где нет услуг с указанным диапозоном id.

```sql

```

> Комментарий: **`@id_from`** и **`@id_to`** - переменные, значения которых являются **началом** и **концом** диапозона соотвественно.