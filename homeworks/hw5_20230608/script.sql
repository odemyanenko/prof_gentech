-- SET SQL_SAFE_UPDATES = 0;

USE SHOP;

-- 1. Определить, сколько покупок было совершено в каждый месяц. 
-- Отсортировать строки в порядке возрастания количества покупок. 
-- Вывести два поля - номер месяца и количество покупок

SELECT
	YEAR(ODATE) AS o_year,
    MONTH(ODATE) AS o_month,
    COUNT(*) AS o_count    
FROM orders
GROUP BY ODATE
ORDER BY o_year, o_count 
;

-- 2. Определить, в какой месяц было совершено больше всего покупок.
-- Вывести два поля - номер месяца и количество покупок

-- 2.1 Но вопрос, месяцы в разных годах...
SELECT MONTH(ODATE) AS month_number, COUNT(*) AS o_count
FROM orders
GROUP BY month_number
HAVING o_count = (
  SELECT MAX(o_count)
  FROM (
    SELECT COUNT(*) AS o_count
    FROM orders
    GROUP BY MONTH(ODATE)
  ) AS t
);

-- 2.2 Но вопрос, месяцы в разных годах... Проблема решается...
WITH cte AS (
  SELECT
    YEAR(ODATE) AS year_number,
    MONTH(ODATE) AS month_number,
    COUNT(*) AS o_count,    
    ROW_NUMBER() OVER (PARTITION BY YEAR(ODATE) ORDER BY COUNT(*) DESC) AS row_num
FROM
    orders
GROUP BY
    year_number, month_number
)

SELECT 
	year_number,
    month_number,
    o_count
FROM cte
WHERE row_num = 1
;

USE HR;

-- 3. Найти среднюю зарплату по компании
SELECT
	AVG(salary) as salary_avg
FROM employees
;

-- 4. Найти общее количество департаментов
SELECT
	COUNT(*) AS department_count
FROM departments
;

-- 5. Найти количество департаментов, в которых никто не работает
SELECT
	COUNT(*) as dep_count
FROM departments d
	LEFT JOIN (
		SELECT DISTINCT department_id
        FROM employees
    ) d_emp ON d.department_id = d_emp.department_id
WHERE d_emp.department_id IS NULL
;	

-- 6. Найти среднюю зарплату в департаменте с id 90
SELECT
	AVG(salary) AS salary_avg
FROM employees
WHERE department_id = 90
;

-- 7. Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 и 80
SELECT
	MAX(salary) AS salary_max
FROM employees
WHERE department_id BETWEEN 70 AND 80
;
