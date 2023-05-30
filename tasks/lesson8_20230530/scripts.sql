USE hr;

-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Задача 1
-- Посчитайте количество каждого region_id в таблице countries
SELECT 
	c.region_id, 
    r.region_name,
	COUNT(*) as country_count
FROM hr.countries c
	INNER JOIN regions r ON c.region_id = r.region_id
GROUP BY c.region_id, r.region_name    
ORDER BY r.region_name
;    

SELECT 
    r.region_id, 
    r.region_name, 
    c.country_count
FROM regions r
	INNER JOIN
		(SELECT 
			c.region_id, 
            COUNT(*) AS country_count
		FROM hr.countries c
		GROUP BY c.region_id) c ON r.region_id = c.region_id
ORDER BY r.region_name
; 

-- Задача 2
-- Посчитайте количество сотрудников для каждого департамента. 
-- В выборке софрмурйте количество и ИМЯ департамента .

SELECT 
	e.department_id,
    COALESCE(d.department_name, "<Unknown>") AS department_name,
    COUNT(*) AS employee_count
FROM employees e
	LEFT JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id, d.department_name
ORDER BY d.department_name
;    

-- Задача 3
-- Посчитайте количество сотрудников для каждого департамента. 
-- В выборке софрмурйте количество и ИМЯ департамента.
SELECT 	
    COUNT(*) as count_empty_manager
FROM departments d
WHERE d.manager_id IS NULL
;

-- Задача 4
-- Посчиатйте количество подчиненных для каждого менеджера 
-- Выведите имя менеджера, а также количество его подчиненных
SELECT 	
	e.manager_id,
    CONCAT(m.last_name, " ", m.first_name) as manager_info,
    COUNT(*) AS employee_count
FROM employees e
	INNER JOIN employees m ON e.manager_id = m.employee_id
GROUP BY e.manager_id, m.last_name, m.first_name
ORDER BY m.last_name, m.first_name
;

