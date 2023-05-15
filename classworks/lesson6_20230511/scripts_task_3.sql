-- Вывести имя и фамилию сотрудника и название его департамента
USE hr;

SELECT 
	e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
	LEFT JOIN departments d ON e.department_id = d.department_id
;