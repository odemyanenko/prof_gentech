-- Cтроковые функции 

-- Первая пачка функций
-- lower() - вовзедение строки в нижний регистр
-- upper() - возведение строки в верхний регистр
-- trim()  - удаляет пробела слева и справа
-- ltrim() - удаляет пробелы слева
-- rtrim() - удаляет пробелы справа
-- length() - определеяет количество символов в строке

-- -------------------------------
-- Примеры
-- select 
-- 	   lower('Привет!'),
--     upper('Привет!')
    
-- select
-- 		'     Привет    ' as collumn,
-- 		trim('     Привет         ') as trim_column,
--     	rtrim('     Привет        ') as rtrim_column,
--    	ltrim('     Привет        ') as ltrim_column;


-- select
-- 	   first_name,
--     length(first_name)
-- from employees

-- ---------------------
-- Задача 1
-- Выведите список сотрудников, у которых имя состоит мимнум из 8 букв 

-- select 
-- 	   first_name,
--     last_name
-- from employees
-- where length(first_name) >= 8


-- ----------------------------
-- Вторая пачка функций
-- сoncat(string1, string2   - конкатенация строк
-- instr(string, substring)  - возвращает позицию где начинается подстрока
-- substr(string,pos1,count) - возвращает подстроку по указанным позициям
-- replace(string, substring1, substring2) - заменяет одну подстроку на другую подстроку

-- select
--     instr('Привет друг мой друг','друг')
--     8

-- select
--     substr('Привет мой друг', -4)
-- 	   друг

-- select
--   replace('Привет друг мой друг', 'друг', 'приятель')
--   Привет приятель мой приятель

-- select
-- 	concat('Привет', concat(' ', 'друг'))

-- -----------------
-- Задача 2
-- Выведите имя и фамилию сотрудника в одной колонке. 
-- В качестве имени атрибута сформируйте значение full_name

-- select
-- 	concat(first_name,concat(' ', last_name)) as full_name
-- from employees

-- Задача 3
-- Сформируйте поле, которое указывает последние 4 цифры номера телефона сотрудника
-- Также вывдеите имя этого сотрудника
	
-- select 
-- 	substr(phone_number, -4) as last_phone_numbers, 
--     first_name
-- from employees

    