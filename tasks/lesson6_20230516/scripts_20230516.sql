SELECT *
FROM employees
	CROSS JOIN departments
;

SELECT *
FROM minutes
	CROSS JOIN seconds
ORDER BY minute, second    
;

USE hr;

-- 1. Выведите уникальные имена департментов, сотрулдники которых получает зарпалту от 13000 до 17000
SELECT DISTINCT
	d.department_id,
    d.department_name
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
WHERE salary BETWEEN 13000 AND 17000
ORDER BY department_name
;

-- 2. Вывести номер заказа, а также имена покупаталей и продавцов.
USE group_48_49;

SELECT 
	o.ONUM,
    sp.SNAME,
    c.CNAME
FROM orders o
	INNER JOIN salespeople sp ON o.SNUM = sp.SNUM
    INNER JOIN customer c ON o.CNUM = c.CNUM
ORDER BY ONUM    
;

-- 3. Вывести номер заказа, а также имена покупаталей и продавцов. (Покупатели и продавцы должжны быть в разнвх городах)
SELECT 
	o.ONUM,
    sp.SNAME,
    c.CNAME,
    sp.CITY AS SCITY,
    c.CITY AS CCITY
FROM orders o
	INNER JOIN salespeople sp ON o.SNUM = sp.SNUM
    INNER JOIN customer c ON o.CNUM = c.CNUM
WHERE sp.CITY <> c.CITY    
ORDER BY ONUM    
;

-- Задание 4 (через join)
-- Вывести уникальный список все городов покупателей и продавцов.

SELECT DISTINCT s.CITY
FROM salespeople s
UNION
SELECT DISTINCT c.CITY
FROM customer c
;

