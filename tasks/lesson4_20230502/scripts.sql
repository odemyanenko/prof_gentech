SELECT *
FROM client_address
;

-- 1. Клиент некого банка сообщил, что сменил место жительства. В базе необходимо отметить изменения.
-- В таблице client_address измените регион клиента 37646 на 'Москва'

SELECT *
FROM client_address
WHERE CLIENT_ID = 37646
;

SET sql_safe_updates = 0;

UPDATE client_address
SET REGION = 'Москва'
WHERE CLIENT_ID = 37646
;

-- 2. Клиент некого банка сообщил, что решил отказться от их услуг. 
-- Необходимо удалить данные клиента, чей client_id равен 141108 с таблицы client_address

SELECT * 
FROM client_address
WHERE CLIENT_ID = 141108
;

DELETE
FROM client_address
WHERE CLIENT_ID = 141108
;

-- 3 задача
-- Удалите записи, у которых не заполнено село (town) или тип села (town_type) в таблице client_address

SELECT *
FROM client_address
WHERE TOWN IS NULL OR TOWN_TYPE IS NULL
;

DELETE
FROM client_address
WHERE TOWN IS NULL OR TOWN_TYPE IS NULL
;

-- 4 задача
-- Измените поле CITY таким образом, чтобы, в случае, если поле не будет учтено при записи, автоматически 
-- формировалось значение "Неизвестно"
-- Запиши любую строку на ваше усмотрение, не учитывая поле CITY

SELECT *
FROM client_address
WHERE CITY IS NULL
;

ALTER TABLE client_address
	MODIFY COLUMN CITY varchar(100) DEFAULT "Неизвестно"
;

-- ALTER TABLE client_address
-- ALTER COLUMN CITY SET DEFAULT 'Неизвестно'
-- ;

-- ALTER TABLE client_address
-- CHANGE CITY CITY varchar(100) DEFAULT "Неизвестно"
-- ;

INSERT INTO client_address
(CLIENT_ID, ADDR_TYPE, REGION, REGION_TYPE, DISTRICT, DISTRICT_TYPE)
VALUES 
(111111, 1, 'test', 'Область', 'Омский', 'Район')
;

SELECT *
FROM client_address
WHERE CLIENT_ID = 111111
;    

UPDATE client_address
SET 
	CITY = 'Неизвестно'
WHERE CITY IS NULL
;

-- 5 задача 
-- Удалите последние 3 поля таблице client_adress и добавьте новое поле home_number, 
-- которое будет передавать целочисленный тип и будет сразу заполнен значением 0 для всех существующих строк
-- where city is null;

ALTER TABLE client_address
	DROP CITY_TYPE,
    DROP TOWN,
    DROP TOWN_TYPE
;    

-- ALTER TABLE client_address
-- 	DROP COLUMN TOWN
-- ;    

-- ALTER TABLE client_address
-- 	DROP COLUMN TOWN_TYPE
-- ;    

ALTER TABLE client_address
	ADD COLUMN HOME_NUMBER INT DEFAULT 0
;

