-- SELECT 
-- 	max(salary)
-- FROM hr.employees;

-- use hr;

-- select
-- 	first_name,
--     last_name
-- from employees
-- where salary = (select max(salary) from employees);

-- ----------------------------

-- select
--  	first_name,
-- 	last_name
-- from employees
-- where salary in (select select from employees where salary > 16000);

-- -----------------
-- Задача 1
-- Вывести список сотрудников, зарплата которых меньше среднего значения по таблице 

-- select avg(salary) from employees;

-- select
-- 	first_name,
--     last_name
-- from employees
-- where salary < (select avg(salary) from employees);

-- --------------
-- Задача 2
-- Выведите имя департмаента, в котором работают самое больше количество сотрудников
 
-- Решение 1
-- select
-- 	department_name
-- from (
-- 	select
-- 		t2.department_name,
-- 		count(t1.employee_id) as count_empl
-- 	from employees t1
-- 	inner join departments t2
-- 	on t1.department_id = t2.department_id
-- 	group by t2.department_name
-- ) t1
-- where count_empl = (select max(cnt) from (select count(*) as cnt from employees group by department_id) t1);


-- -----------------------
-- Раздел HAVING (аналог раздела WHERE)

-- select
-- 	t2.department_name
-- from employees t1
-- inner join departments t2
-- on t1.department_id = t2.department_id
-- group by t2.department_name
-- having count(t1.employee_id) = (select max(cnt) from (select count(*) as cnt from employees group by department_id) t1);

-- -----------------
-- Задача 3

-- Выведите ID департментов, которые ежемесячно отдают сотруднакам зарпалту больше 100000 уе

-- select
--     t2.department_name
-- from employees t1
-- inner join departments t2
-- on t1.department_id = t2.department_id
-- group by t2.department_name
-- having sum(t1.salary) > 100000;





