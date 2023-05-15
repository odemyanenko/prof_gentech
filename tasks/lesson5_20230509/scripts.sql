-- 1. Напишите запрос, который вернет значения стран в таблице countries, а также значение региона.
SELECT c.country_name, r.region_name
FROM countries c
	INNER JOIN regions r ON c.region_id = r.region_id
;

-- 2. Выведите имя и фамилию сотрудника, а также имя департамента, в котором он работает
SELECT 
	e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
	LEFT JOIN departments d ON e.department_id = d.department_id
;    

-- 3. Выведите название департмента, а так же имя менеджера, прикрлепленного к этому департаменту.
SELECT 
	d.department_id,
    d.department_name,
    d.manager_id,
    e.last_name AS manager_name
FROM departments d
	LEFT JOIN employees e ON d.manager_id = e.employee_id
;

-- 4. Выведите имена всех департманетов а также значения стран, где они находяться
SELECT 
	d.department_id,
    d.department_name,
    c.country_name
FROM departments d
	LEFT JOIN locations l ON d.location_id = l.location_id
	LEFT JOIN countries c ON l.country_id = c.country_id
;
