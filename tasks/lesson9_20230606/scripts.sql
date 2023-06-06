-- SELECT 
--  max(salary)
-- FROM hr.employees;

-- use hr;

-- select
--  first_name,
--     last_name
-- from employees
-- where salary = (select max(salary) from employees);

-- ----------------------------

-- select
--   first_name,
--  last_name
-- from employees
-- where salary in (select select from employees where salary > 16000);

USE HR;

-- Вывести список сотрудников, зарплата которых меньше среднего значения по таблице
SELECT
	employee_id, 
    first_name,
    last_name
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees)
;

-- Выведите имя департмаента, в котором работают самое больше количество сотрудников
SELECT 
	e.department_id,     
    d.department_name,
	COUNT(*) as count_employee
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name
ORDER BY 3 DESC
LIMIT 1
;

-- Выведите имя департмаента, в котором работают самое больше количество сотрудников
select
 department_name
from (
 select
  t2.department_name,
  count(t1.employee_id) as count_empl
 from employees t1
 inner join departments t2
 on t1.department_id = t2.department_id
 group by t2.department_name
) t1
where count_empl = (select max(cnt) from (select count(*) as cnt from employees group by department_id) t1)
;

-- Выведите ID департментов, которые ежемесячно отдают сотруднакам зарпалту больше 100000 уе
SELECT 
	e.department_id,
    d.department_name,
    SUM(e.salary) salary
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name
HAVING SUM(e.salary) > 100000
ORDER BY d.department_name
;
