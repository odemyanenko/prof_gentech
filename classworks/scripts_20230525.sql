USE hr;

-- Вывести имя и фамилию сотрудника и название его департамента
SELECT 
	e.employee_id,
    e.last_name,
    e.first_name,    
    d.department_id,
    d.department_name
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY e.last_name    
;    

-- Вывести имя и фамилию и название департамента только тех сотрудников, которые работают в IT, Treasury или IT Support
SELECT 	
    e.last_name,
    e.first_name,        
    d.department_name
FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name IN ('IT', 'Treasury', 'IT Support')    
ORDER BY e.last_name    
;    

-- Вывести имя и фамилию сотрудника и имя и фамилию его менеджера
SELECT 	
	e.employee_id,
    e.last_name AS emp_last_name,
    e.first_name AS emp_first_name,            
    e.manager_id,
    m.last_name AS manager_last_name,
    m.first_name AS manager_first_name
FROM employees e
	INNER JOIN employees m ON e.manager_id = m.employee_id
ORDER BY e.last_name    
; 

USE shop;
-- Выведите имена всех продавцов. 
-- Предусмотрите также в выборке имена их боссов, сформировав атрибут boss_name. 
-- В выборке должно присутствовать два атрибута — sname, boss_name.

SELECT 
	s.sell_id,
	s.sname,
    b.sname AS boss_name 
FROM sellers s
	LEFT JOIN sellers b ON s.boss_id = b.sell_id    
;

-- Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
-- В выборке должно присутствовать два атрибута — cname, amt.
SELECT 
	o.order_id,
    o.amt,
	c.cust_id,
    c.cname
FROM orders o
	INNER JOIN customers c ON o.cust_id = c.cust_id	
WHERE o.amt > 1000    
ORDER BY o.amt
;

-- Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto
SELECT 
	e.employee_id,
    e.last_name,
    e.first_name,
    l.city
FROM employees e
	LEFT JOIN departments d ON e.department_id = d.department_id
	LEFT JOIN locations l ON d.location_id = l.location_id
WHERE l.city IN  ('Seattle', 'Toronto')
ORDER BY e.last_name
; 

USE shop;

-- Напишите запрос, который вернет выборку full join, используя таблицы CUSTOMERS и ORDERS (по ключу CUST_ID). 
-- В выборке должно присутствовать два атрибута — cname, order_id.

SELECT 
	c.cname,
    o.order_id
FROM customers c
	LEFT JOIN orders o ON c.cust_id = o.cust_id
UNION     
SELECT 
	c.cname,
    o.order_id
FROM customers c
	RIGHT JOIN orders o ON c.cust_id = o.cust_id
ORDER BY cname
-- ORDER BY 1
;
