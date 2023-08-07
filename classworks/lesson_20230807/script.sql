DROP DATABASE shop;

CREATE DATABASE shop;

USE shop;

-- import data from files

-- 1. вывести продукты, у которых цена от 100 до 150 единиц
SELECT *
FROM products
WHERE price BETWEEN 100 AND 150
;

-- найти кол-во наименований товаров, которые поставляют поставщики c id 1, 4, 2
SELECT COUNT(*)
FROM products
WHERE supplier_id IN (1, 4, 2)
;

-- найти поличество поставляемых продуктов каждым поставщиком
-- вывести id поставщика и кол-во наименований товаров
SELECT supplier_id, COUNT(*) AS product_count
FROM products
GROUP BY supplier_id
;

-- найти количество поставляемых продуктов каждым поставщиком
-- вывести наименование поставщика и кол-во наименований товаров
SELECT 
	p.supplier_id, 
    s.name AS suuplier_name,
    COUNT(*) AS product_count
FROM products p
	LEFT JOIN suppliers s ON p.supplier_id = s.id
GROUP BY p.supplier_id
;

SELECT 
	s.name,
    COALESCE(p_c.cnt, 0)
FROM suppliers s
	LEFT JOIN (
    SELECT
		supplier_id,
        COUNT(*) AS cnt
	FROM products
    GROUP BY supplier_id
    ) p_c ON s.id = p_c.supplier_id
    
-- вывести имя и фамилию клиента и название программы лояльности, которая у него работает
-- если у клиента нет программы лояльности в поле program_name вывести "нет программы лояльности"

SELECT 
	c.first_name,
    c.last_name,
    c.loyalty_program_id,
    COALESCE(lp.program_name, "нет программы лояльности") AS program_name
FROM customers c
	LEFT JOIN loyalty_programs lp ON c.loyalty_program_id = lp.id
;  

-- напишите запрос, который выводит кол-во неоплаченых заказов у каждого покупателя
-- вывести поля first_name, last_name, cnt

SELECT	    
    c.first_name,
    c.last_name,
    COUNT(*) cnt
FROM orders o
	LEFT JOIN customers c ON o.customer_id = c.id
WHERE o.paid_flg = 'N'
GROUP BY o.customer_id
ORDER BY c.first_name, c.last_name
;
    
-- напишите запрос, который выводит кол-во неоплаченых заказов у каждого покупателя
-- вывести поля first_name, last_name, cnt

SELECT DISTINCT
    c.first_name,
    c.last_name,
	COALESCE(p.name, "No orders") AS product_name
FROM customers c
	LEFT JOIN orders o ON c.id = o.customer_id
    LEFT JOIN order_details od ON o.id = od.order_id
	LEFT JOIN products p ON od.product_id = p.id
WHERE (o.id IS NOT NULL AND od.id IS NOT NULL)    
	OR o.id IS NULL
;

    -- написать запрос, который выводит имя и фамилию покупателя и общую сумму его заказов

SELECT 
	c.id,
	c.first_name,
    c.last_name,
    COALESCE(c_t.total, 0) AS total
FROM customers c
	LEFT JOIN (
    SELECT 
		o.customer_id,    
		SUM(od.product_count * p.price) AS total
	FROM  orders o
		INNER JOIN order_details od ON o.id = od.order_id
		INNER JOIN products p ON od.product_id = p.id  
	GROUP BY o.customer_id        
    ) c_t ON c.id = c_t.customer_id
;    

    SELECT 
		o.customer_id,    
		od.product_count,
        p.price,
        od.product_count * p.price        
	FROM  orders o
		LEFT JOIN order_details od ON o.id = od.order_id
		LEFT JOIN products p ON od.product_id = p.id 
WHERE customer_id =  3  ;    

-- пересчетать сумму заказов с учетом скидки по программе лояльности 
SELECT 
	c.id,
	c.first_name,
    c.last_name,
    COALESCE(c_t.total, 0) AS total,
    lp.discount,
    ROUND(COALESCE(c_t.total, 0) * (100 - COALESCE(lp.discount, 0))/ 100, 2) AS total    
FROM customers c
	LEFT JOIN (
    SELECT 
		o.customer_id,    
		SUM(od.product_count * p.price) AS total
	FROM  orders o
		INNER JOIN order_details od ON o.id = od.order_id
		INNER JOIN products p ON od.product_id = p.id  
	GROUP BY o.customer_id        
    ) c_t ON c.id = c_t.customer_id
    LEFT JOIN loyalty_programs lp ON c.loyalty_program_id = lp.id
; 

-- вывести название поставщика и его номер телефона если поставляемые им 
-- товары на складе закончились

SELECT	DISTINCT
	p.supplier_id,
    s.name,
    s.phone
FROM products p
	INNER JOIN suppliers s ON p.supplier_id = s.id
WHERE p.in_stoke = 'N';

-- найти покупателей, у которых нет заказов

SELECT c.*
FROM customers c
WHERE 
	NOT EXISTS (SELECT * FROM orders WHERE customer_id = c.id)
;

SELECT c.*
FROM customers c
	LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL    
;



