-- Тема: агрегация 

-- use hr;

-- count(column) - количество не NULL строк в таблице в указанном атрибуте 
-- max(column)   - максимальное числовое значение в указанном атрибуте
-- min(column)   - минимальное числовое значение в указанном атрибуте
-- avg(column)	 - расчитывает среднее арифметические числовое значение в указанном атрибуте
-- sum(column)   - расчитывает сумму всех числовых строк в указанном атрибуте

-- Колличество всех записей в таблице
-- select
-- 	count(*)
-- from employees;


-- Найдите максимальное и минимальное значение зарплаты всех сотрдуников таблицы employees
-- select
-- 	max(salary),
--     min(salary)
-- from employees;

-- ---------------------------------------
-- Задача 1 
-- Посчитайте итоговую сумму всех зарплат

-- select 
-- 	sum(salary)
-- from employees

-- Задача 2 
-- Рассчитайте среднее значение зарплаты 

-- select 
-- 	round(avg(salary))
-- from employees;

-- -----------------------------------------------
-- нельзя использовать обычные поля рядом с агрегируемыми полями 
-- будет ошибка 
 
-- select 
-- 	max(salary),
--     first_name
-- from employees

-- ---------------------------------

-- То что нужно рассчитать - нужно сгруппировать 

-- Группировка
-- Новый раздел - group by 

-- select
-- 	sum(salary),
--  department_id
-- from employees
-- group by department_id


-- -----------------------------
-- Задача 3 
-- Расчитайте количество сотрудников на каждую профессию

-- select 
-- 	count(*),
--  job_id
-- from employees
-- group by job_id

-- Посчитать количество однофамильцев 

-- select 
-- 	count(*),
--  last_name
-- from employees
-- group by last_name 


-- -----------------------
-- Задача 4
-- Посчитайте количество сотрудников привязанных к каждому менеджеру 

-- select
-- 	count(*),
-- 	manager_id
-- from employees
-- group by manager_id

-- ---------------------------
-- Задача 5

-- a)Рассчитайте среднее значение зарплаты для каждой професси

-- select
-- 	round(avg(salary)),
--     job_id
-- from employees
-- group by job_id

-- б) Расчитайте минимальное значение зарплаты во всех департментах

-- select
-- 	min(salary),
--     max(salary),
--     department_id
-- from employees
-- group by department_id