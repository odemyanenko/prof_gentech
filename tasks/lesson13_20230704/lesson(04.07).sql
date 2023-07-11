select * from source_data;

-- Задание 1 
-- Разделите поле двигатель на 3 разные колонки  
-- 1.1 Сформируйте в селект запросе поле, которе будет передавать значение объема двигателя 
-- 1.2 Сформируйте в селект запросе поле, которе будет передавать тип двигателя

-- -------------------------------------
-- Заполнение данных при помощи select запроса

-- drop table engins;

-- create table engins (
-- 	id int primary key,
--     engine_capacity numeric(3,1),
--     engine_type varchar(20),
--     engine_power numeric
-- );

-- select * from engins;

-- insert into engins (id, engine_capacity, engine_type, engine_power)
-- select
-- 	FIELD1,
-- 	substr(Двигатель, 1, 3) as engine_capacity,
--     substr(Двигатель, -6) as engine_type,
--     substr(substr(Двигатель, 9), 1, instr(substr(Двигатель, 9), 'л.с.') -2 ) as engine_power
-- from source_data;

-- ----------------------------------------------
-- Задача 2
-- создать запрос, которое считает кол-во  машин дороже средней цены 
-- и кол-во автомобилей дешевле средней цены


-- Решение 1
-- select
-- 	'price_avg_above',
-- 	count(*)
-- from source_data
-- where replace(replace(price, '₽', ''), ' ', '') > (select avg(replace(replace(price, '₽', ''), ' ', '')) from source_data)
-- union all 
-- select
-- 	'price_avg_less',
-- 	count(*)
-- from source_data
-- where replace(replace(price, '₽', ''), ' ', '') < (select avg(replace(replace(price, '₽', ''), ' ', '')) from source_data)

-- --------------------------------
-- Решение 2 
-- select * 
-- from  (
-- 	select
-- 		count(*) as above_price
-- 	from source_data 
-- 	where replace(replace(price, '₽', ''), ' ', '') > (select avg(replace(replace(price, '₽', ''), ' ', '')) from source_data)
-- ) t1
-- cross join (
-- 	select
-- 		count(*) as less_price
-- 	from source_data
-- 	where replace(replace(price, '₽', ''), ' ', '') < (select avg(replace(replace(price, '₽', ''), ' ', '')) from source_data)
-- ) t2;


-- select
-- 	count(*) as less_price
-- from source_data
-- where replace(replace(price, '₽', ''), ' ', '') < (select avg(replace(replace(price, '₽', ''), ' ', '')) from source_data)

-- -------------------------------------
-- ДЗ 
-- создать запрос, которое считает кол-во автомобилей на каждый год
-- создать запрос, которое считает разницу между средней ценой растаможенных и не растаможенных машин.