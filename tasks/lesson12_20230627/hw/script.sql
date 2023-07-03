USE aircompany;

-- 1) Найдите общую сумму, потраченную на полеты каждым пассажиром. Выведите имя и стоимость всех полетов.
SELECT	
    p.name AS passenger_name,
    SUM(f.price) as total_price
FROM flying f
	INNER JOIN fly_mapping fm ON f.id = fm.flying_id
    INNER JOIN passengers p ON fm.passenger_id = p.id
GROUP BY fm.passenger_id    
ORDER BY p.name
;

-- 2) Найдите среднее количество времени, потраченное в воздухе каждой возрастной группой. 
-- Выведите возрастную группу и кол-во времени в минутах (округленное до двух знаков после запятой.

SELECT 
	p.age_group,
    ROUND(AVG(f.flight_time), 2) AS avg_flight_time
FROM flying f
	INNER JOIN fly_mapping fm ON f.id = fm.flying_id
    INNER JOIN passengers p ON fm.passenger_id = p.id
GROUP BY p.age_group    
ORDER BY p.age_group
;    

-- 3) Определите пассажиров с максимальным количеством полетов. Выведите имя и количество полетов
SELECT 
	p.name AS passenger_name,
    COUNT(*) AS flight_count
FROM fly_mapping fm
    INNER JOIN passengers p ON fm.passenger_id = p.id
GROUP BY fm.passenger_id   
HAVING flight_count = (
	SELECT MAX(flight_count)
    FROM (
		SELECT COUNT(passenger_id) AS flight_count
		FROM fly_mapping
		GROUP BY passenger_id
        )  AS fc      
) 
ORDER BY p.name
;    

-- 4) Определите пассажиров, у которых количество полетов больше среднего.
SELECT 
	p.name AS passenger_name,
    COUNT(*) AS flight_count
FROM fly_mapping fm
    INNER JOIN passengers p ON fm.passenger_id = p.id
GROUP BY fm.passenger_id   
HAVING flight_count > (
	SELECT AVG(flight_count)
    FROM (
		SELECT COUNT(passenger_id) AS flight_count
		FROM fly_mapping
		GROUP BY passenger_id
        )  AS fc 
) 
ORDER BY p.name
;    

-- 5) Определите самые популярные направления полетов. Направления с максимальным количеством прилетов.**
SELECT 	
	f.point_to,
	COUNT(f.point_to) AS flight_count
FROM flying f
GROUP BY f.point_to
HAVING flight_count = (
	SELECT 
		MAX(flight_count)
	FROM (
		SELECT 
			COUNT(f.point_to) AS flight_count
		FROM flying f
		GROUP BY f.point_to
	) as fc
)    
ORDER BY f.point_to
;
