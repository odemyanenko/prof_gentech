-- group by

SELECT 
	MAX(salary),
    department_id
FROM employees
GROUP BY department_id
;    