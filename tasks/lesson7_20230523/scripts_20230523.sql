USE HR;

-- Найдите максимальное и минимальное значение зарплаты всех сотрдуников таблицы employees
SELECT 
	MAX(salary) as salary_max,
    MIN(salary) as salary_min
FROM employees
;

-- Посчитайте итоговую сумму всех зарплат
-- Рассчитайте среднее значение зарплаты
SELECT 
	SUM(salary) as salary_sum,
    AVG(salary) as salart_avg
FROM employees
;

-- Расчитайте количество сотрудников на каждую профессию
SELECT 
	j.job_title,
	COUNT(*) as count_by_job
FROM employees e
	INNER JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY job_title
;  

-- Посчитайте количество сотрудников привязанных к каждому менеджеру
SELECT
	e.manager_id,
    m.last_name AS manager_info,
	COUNT(*) AS employee_count
FROM employees e
	LEFT JOIN employees m ON e.manager_id = m.employee_id
GROUP BY e.manager_id, m.last_name
ORDER BY m.last_name
;

-- Рассчитате среднее значение зарплаты для каждой професси
SELECT 
	j.job_title,
	AVG(salary) as avg_salary_by_job
FROM employees e
	INNER JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY job_title
;  

-- Рассчитате среднее значение зарплаты для каждого департмента
SELECT 
	d.department_name,
	MIN(salary) as min_salary,
    MAX(salary) as max_salary
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY department_name
;   

