-- 1. Выведите коды всех рейсов, в рамках которых воздушные судна вылетели из Москвы и в данный момент находятся в воздухе (статус таких рейсов —  departed). 
-- Коды аэропортов Москвы: SVO, VKO, DME.
-- В выборке должен присутствовать один атрибут — trip_code.

SELECT trip_code
FROM trips
WHERE
    departure IN ('SVO' , 'VKO', 'DME')
        AND status = 'Departed'
;

-- 2. Определите имена и фамилии пассажиров, чьи идентификаторы заканчиваются на RCB или FCV, а номера телефонов не начинаются на +705.
-- В выборке должен присутствовать один атрибут — name.

SELECT name
FROM clients
WHERE 
	(id LIKE "%RCB" OR id LIKE "%FCV")
    AND phone NOT LIKE "+705%"
;

-- 3. После каждого рейса проходит плановая уборка салона. Результаты уборки вносятся в отчет-лист. 
-- Авиакомпания получила отчет, в котором указано, что во всех самолетах все места чистые, а спинки кресел исправные.
-- Выведите бортовой номер самолета, cформировав для каждой строки поле index с значением 'clean'.
-- В выборке должны присутствовать два атрибута — side_number и index.

SELECT 
	side_number
    , 'clean' AS 'index'
FROM airliners
;

-- 4. Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
-- Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
-- Более новые самолеты отнесите к классу 'New'. 
-- Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
-- В выборке должны присутствовать два атрибута — side_number, age.

SELECT side_number,
	CASE 
		WHEN production_year < 2000 THEN 'Old' 
        WHEN production_year BETWEEN 2000 AND 2010 THEN 'Mid' 
        ELSE 'New' 
	END AS age
FROM airliners
WHERE 'range' <= 10000
;

-- 5. Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. 
-- Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, trip_id, new_price.

SELECT 
    id,
    trip_id,
    CASE
        WHEN
            trip_id IN ('LL4S1G8PQW' , '0SE4S0HRRU', 'JQF04Q8I9G')
                AND service_class = 'Economy'
        THEN
            price - (price * 0.15)
        WHEN
            trip_id IN ('LL4S1G8PQW' , '0SE4S0HRRU', 'JQF04Q8I9G')
                AND service_class = 'Business'
        THEN
            price - (price * 0.1)
        WHEN
            trip_id IN ('LL4S1G8PQW' , '0SE4S0HRRU', 'JQF04Q8I9G')
                AND service_class = 'PremiumEconomy'
        THEN
            price - (price * 0.2)
        ELSE price
    END AS new_price
FROM
    tickets
;

-- 6. В таблице tickets для одних билетов указана цена, а для других значение отсутствует (NULL). 
-- Выведите идентификатор билета и статус цены. Если цена указана, статус 'DEFINED', если значение отсутствует — 'UNDEFINED'.
-- В выборке должны присутствовать два атрибута — id, price_status.

SELECT 
	id, 
    CASE 
		WHEN price IS NULL THEN 'UNDEFINED'
        ELSE 'DEFINED'
    END AS price_status
FROM tickets
;

-- 7. Некоторые самолеты авиакомпании требуют проверки бортовых документов. 
-- Выведите бортовые номера и статус проверки для всех самолетов. 
-- Если самолет выпущен ранее 2000 года, то выведите статус 'review_old'. 
-- Если самолет выпущен позже 2010 года, то выведите статус 'no_review'. 
-- Для самолетов, которые выпущены в промежутке с 2000 до 2010 года включительно статус завист от максимальной дальности полета. 
-- Если дальность полета более 6000 км, то выведите статус 'review_mid_long_haul'. 
-- Если дальность полета более 2500 км, но не более 6000 км, то выведите статус 'review_mid_medium_haul'. 
-- Иначе выведите статус 'review_mid_short_haul'.
-- В выборке должны присутствовать два атрибута — side_number, review_status.

SELECT 
	side_number,
	CASE 
		WHEN production_year < 2000 THEN 'review_old'        
        WHEN production_year BETWEEN 2000 AND 2010 AND 'range' > 6000 THEN 'review_mid_long_haul'
        WHEN production_year BETWEEN 2000 AND 2010 AND 'range' > 2500 AND 'range' <= 6000 THEN 'review_mid_medium_haul'
        WHEN production_year BETWEEN 2000 AND 2010 THEN 'review_mid_short_haul'        
        ELSE 'no_review'        
    END AS review_status
FROM airliners
;
