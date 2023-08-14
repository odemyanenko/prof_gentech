-- CREATE DATABASE COMPANY;
-- EXEC scripts for create table //task

-- Выведите наименование задач и название департамена, который должен эту задачу выполнить. 
-- В выборке должны быть поля
-- - title (наименование задачи),
-- - name (наименование департамента)
-- Записи должны быть отсортированы по наименованию задачи в алфавитном порядке.

SELECT	
	t.title,
    d.name
FROM tasks t
	LEFT JOIN departments d ON t.department_id = d.id
ORDER BY t.title    
;

-- instr - найти позицию подстроки в строке 
-- substring - отрезать подстроку от строки 
-- CAST - функция, для изменения типа данных
-- DECIMAL - числовой тип с дробной частью

SELECT	
	t.title,
    d.name,
    substring(t.title, instr(t.title, '#') + 1) AS num
FROM tasks t
	LEFT JOIN departments d ON t.department_id = d.id
ORDER BY CONVERT(num, DECIMAL)
;

-- Сформировать выборку, которая выводит наименования невыполненых задач, назначеных на отдел продаж ("Sales")
-- В выборке должны быть поля
-- title (наименование задачи)
-- Записи должны быть отсортированы по наименованию задачи в алфавитном порядке.

SELECT	
	t.title, t.*
FROM tasks t	
	INNER JOIN departments d ON t.department_id = d.id
WHERE d.name = "Sales" AND t.status <> 'Completed'
ORDER BY CONVERT(substring(t.title, instr(t.title, '#') + 1), DECIMAL)
-- ORDER BY t.title
;

-- Сформировать выборку, которая выводит название задачи и имя, фамилию руководителя департамента, на который данная задача назначена.

-- В выборке должны быть поля
-- - title (наименование задачи),
-- - first_name (Имя сотрудника)
-- - last_name (Фамилия сотрудника)

-- Записи должны быть отсортированы по наименованию задачи в алфавитном порядке.

SELECT	
	t.title, 
    e.first_name,
    e.last_name
FROM tasks t	
	LEFT JOIN departments d ON t.department_id = d.id
    LEFT JOIN employees e ON d.manager_id = e.id
ORDER BY CONVERT(substring(t.title, instr(t.title, '#') + 1), DECIMAL)
-- ORDER BY t.title
;

-- Вывести всех сотрудников из отделов, которые находятся в Нью-Йорк.

-- В выборке должны быть поля
-- employee_id (Идентификатор сотрудника)
-- first_name (Имя сотрудника)
-- last_name (Фамилия сотрудника)
-- department_name (название департамента с алиасом department_name)

-- Записи должны быть отсортированы по названию департамента в алфавитном порядке.

SELECT	
	e.id AS employee_id,
    e.first_name,
    e.last_name,
    d.name AS department_name
FROM departments d
    INNER JOIN locations l ON d.location_id = l.id
    INNER JOIN employees e ON d.id = e.department_id
WHERE l.city = "New York"    
ORDER BY d.name
;

-- Получить имена менеджеров тех департаментов, у которых бюджет от 200000 до 400000.

-- В выборке должны быть поля
-- employee_id (Идентификатор сотрудника)
-- first_name (Имя сотрудника)
-- last_name (Фамилия сотрудника)

-- Записи должны быть отсортированы по идентификатору сотрудника.

SELECT	DISTINCT
	e.id AS employee_id,
    e.first_name,
    e.last_name
FROM departments d    
    INNER JOIN employees e ON d.manager_id = e.id
WHERE d.budget BETWEEN 200000 AND 400000
ORDER BY e.id
;

-- Найдите названия департаментов, у которых есть задачи в статусе "Pending".
-- В выборке должны быть поля:
-- - department_name (наименование департамента)
-- Записи должны быть отсортированы по названию департамента.

SELECT DISTINCT
	d.name AS department_name
FROM tasks t
	INNER JOIN departments d ON t.department_id = d.id
WHERE t.status = "Pending"
ORDER BY d.name
;

-- Найдите разницу максимальной и минимальной зарплаты сотрудников, которые работают неполный день ("Part-time").
-- В выборке должны быть поля
-- delta (разница между максимальной и минимальной зарплатой)

SELECT
	MAX(e.salary) - MIN(e.salary) AS delta
FROM employees e
WHERE e.employment_status = "Part-time"
;

-- Найти сотрудников, у которых максимальная заработная плата.

-- В выборке должны быть поля
-- first_name (имя сотрудника)
-- last_name (фамилия сотрудника)

SELECT 
    e.first_name, 
    e.last_name
FROM employees e
WHERE
    e.salary = (
		SELECT 
            MAX(e.salary) AS salary
        FROM employees e
		)
;

-- Получить список задач с максимальным и минимальным доходом.
-- В выборке должны быть поля
-- title (наименование задачи)

SELECT 
	t.title
FROM tasks t
WHERE t.income = (
	SELECT
		MAX(t.income) AS max_income		
	FROM tasks t
	) OR
    t.income = (
	SELECT	
		MIN(t.income) AS min_income
	FROM tasks t
	)
;    

SELECT 
	t.title
FROM tasks t
WHERE t.income IN (
	SELECT
		MAX(t.income)
	FROM tasks t
    UNION ALL
    SELECT
		MIN(t.income)
	FROM tasks t    
	)
;    

-- Получить название всех завершенных задач (со статусом "Completed") с наибольшим доходом среди завершенных задач.
-- В выборке должны быть поля
-- title (наименование задачи)и)

SELECT
	t.title
FROM tasks t	
WHERE t.status = "Completed" 
	AND t.income = (
		SELECT MAX(t.income) as max_income
        FROM tasks t
        WHERE t.status = "Completed" 
	)
;



