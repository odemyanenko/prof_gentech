-- -----------------------
-- -- Задача 1
-- -- Посчитайте количество каждого region_id в таблице countries
-- use hr;

-- SELECT 
-- 	t2.region_name,
--     count(t2.region_id) as count
-- FROM hr.countries t1
-- INNER JOIN hr.regions t2
-- ON t1.region_id = t2.region_id
-- group by t2.region_name;

-- -----------------------
-- Задача 2
-- Посчитайте количество сотрудников для каждого департамента. 
-- В выборке софрмурйте количество и ИМЯ департамента.

-- select
-- 	count(*) as empl_count,
--     t2.department_name
-- from employees t1
-- inner join departments t2
-- on t1.department_id = t2.department_id
-- group by t2.department_name

-- -----------------------
-- Задача 3
-- Посчитайте количество департмаентов, у которых отсутсвует привязанный менеджер
-- Выведите количество.

-- select
-- 	count(*) as count_deps
-- from departments
-- where manager_id is null;

-- -----------------------
-- Задача 4
-- Посчиатйте количество подчиненных для каждого менеджера 
-- Выведите имя менеджера, а также количество его подчиненных 

-- select
--     t1.first_name,
--     t1.last_name,
--     count(*) as empl_count
-- from employees t1
-- inner join employees t2
-- on t2.manager_id = t1.employee_id
-- group by t2.manager_id, t1.first_name, t1.last_name;