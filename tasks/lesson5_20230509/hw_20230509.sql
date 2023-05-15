USE hr;
-- 1. Напишите запрос, который вернет имена сотрудников, а также название департаментов. В выборке должны быть только те департмаенты, у которых не указан id менеджера 
SELECT 
	e.employee_id,
	e.first_name,
    e.last_name
FROM employees e
	LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.manager_id IS NULL    
;    
-- 2. Напишите запрос, который выводит имя сотрудника и город. где располагается его департамент. 
SELECT 
	e.employee_id,
	e.first_name,
    e.last_name,
    l.city as department_city
FROM employees e
	LEFT JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN locations l ON d.location_id = l.location_id
;

-- 3. Напишите запрос, который выведет имя сотрудника а также имя менеджера, который привязан к каждому сотруднику.
SELECT 
	e.employee_id,
	e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    m.first_name AS manager_first_name,
    m.last_name AS manager_last_name
FROM employees e
	LEFT JOIN employees m ON e.manager_id = m.employee_id
;