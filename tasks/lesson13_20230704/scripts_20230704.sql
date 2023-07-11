USE group_48_49;

-- Задание 1 
-- Разделите поле двигатель на 3 разные колонки  
-- 1.1 Сформируйте в селект запросе поле, которе будет передавать значение объема двигателя
-- 1.2 Сформируйте в селект запросе поле, которе будет передавать тип двигателя

SELECT * FROM source_data;

SELECT 	
    TRIM(REPLACE(SUBSTRING_INDEX(Двигатель, "/", 1), "л", "")) AS engine_capacity,
    TRIM(SUBSTRING_INDEX(Двигатель, "/", -1)) AS engine_type,
    TRIM(SUBSTRING_INDEX(REPLACE(SUBSTRING_INDEX(Двигатель, "/", 2), "л.с.", ""), "/", -1)) AS engine_power
FROM source_data
;

DROP TABLE engines;

CREATE TABLE engines(
	id INT PRIMARY KEY AUTO_INCREMENT,
    engine_capacity NUMERIC(3,1),
    engine_type VARCHAR(20),
    engine_power INT
);

INSERT INTO engines (engine_capacity, engine_type, engine_power)
SELECT
    TRIM(REPLACE(SUBSTRING_INDEX(Двигатель, "/", 1), "л", "")) AS engine_capacity,
    TRIM(SUBSTRING_INDEX(Двигатель, "/", -1)) AS engine_type,    
    TRIM(REPLACE(SUBSTRING_INDEX(REPLACE(SUBSTRING_INDEX(Двигатель, "/", 2), "л.с.", ""), "/", -1), " ", "")) AS engine_power
FROM source_data
;

SELECT 
	*
FROM engines
;

SELECT ASCII(" ");
SELECT ASCII(" ");

SELECT ASCII("і");
SELECT ASCII("i");

-- создать представление, которое считает кол-во  машин дороже средней цены и кол-во автомобилей дешевле средней цены
SELECT 
	'< avg',
    count(*)
from source_data
where     
	TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")) < (
    SELECT AVG(TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")))
    FROM source_data
    )
UNION ALL
SELECT 
	'> avg',
    count(*)
from source_data
where     
	TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")) > (
    SELECT AVG(TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")))
    FROM source_data
    )    
;

SELECT * FROM (
SELECT 
    count(*) as count_avg_less
from source_data
where     
	TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")) < (
    SELECT AVG(TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")))
    FROM source_data
    )
) t1 
CROSS JOIN (
SELECT 
    count(*) as count_avg_gross
from source_data
where     
	TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")) > (
    SELECT AVG(TRIM(REPLACE(REPLACE(price, "₽", ""), " ", "")))
    FROM source_data
    )    
) t2
;