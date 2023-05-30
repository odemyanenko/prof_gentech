USE hr;

-- COUNT(Column) no NULL rows in Column 
--  MAX (Column)
--  MIN (Column)
--  AVG (Column)
--  SUM (Column)

SELECT
	COUNT(employee_id)
FROM employees    
;

SELECT
	COUNT(commission_pct)
FROM employees    
;

SELECT
	COUNT(*)
FROM employees    
;

-- group by
SELECT 
	MAX(salary),
    department_id
FROM employees
GROUP BY department_id
;  

