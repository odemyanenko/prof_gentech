-- String Functions
SELECT UPPER("dfgdfgdfg")
;

USE HR
;

-- Задача 1
-- Выведите список сотрудников, у которых имя состоит мимнум из 8 букв
SELECT 
	*
FROM employees
WHERE LENGTH(first_name) >= 8
;

-- Задача 2
-- Выведите имя и фамилию сотрудника в одной колонке. 
-- В качестве имени атрибута сформируйте значение full_name
SELECT 
	CONCAT(first_name, CONCAT(' ', last_name)) AS full_name
FROM employees
;

-- Задача 3
-- Сформируйте поле, которое указывает последние 4 цифры номера телефона сотрудника
-- Также вывдеите имя этого сотрудника
SELECT
	SUBSTRING(phone_number, -4) phone_number_last4,
    first_name
FROM employees
;
