-- Задача 1
-- Напишите запрос, который выведет: 
-- а) Числовое значение текущего года (текущего момента времени)
-- б) Числовое значение месяца (текущего момента времени)
SELECT 
	YEAR(NOW()) AS current_year, 
    MONTH(NOW()) AS current_month
;

USE HR;

-- Задание 2 
-- Выведите спсиок сотрудников (имя и фамилию), а так же стркоове значение месяца их поступление на работу
SELECT
	first_name,
    last_name,
    MONTHNAME(hire_date) AS hire_month
FROM employees
;

-- Задание 3 
-- Выведите имена тех сотрудников, которые начали работать с 2000 года
SELECT
	first_name,
    last_name,
    hire_date
FROM employees
WHERE YEAR(hire_date) >= 2000
;

-- ---------------------
-- Задание 4 
-- Посчитатйе количетсво сотрудников для каждого месяца (вне зависимости от года и дня). 
-- Вывести Срокове значение месяца и количество сотрудников
SELECT 
	 MONTHNAME(hire_date) AS hire_month,
     COUNT(*) AS emp_hire_count
FROM employees
GROUP BY MONTHNAME(hire_date)
ORDER BY COUNT(*) DESC
;

-- ---------------------
-- Задание 5 
-- Посчитайте количество всех сотрудников в каждом департменте. 
-- Примечание: Только тех сотрудников, которые начали рабочий день в понедельник (вне зависимости от года и дня мнесяца)
-- Выведите: Имя департмента и количество сотрудников.
SELECT 	
    d.department_name,
    COUNT(*) as emp_count    
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
WHERE DAYOFWEEK(hire_date) = 2
GROUP BY d.department_name
;