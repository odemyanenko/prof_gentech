-- JOIN

SELECT 
	c.first_name,
    c.last_name,
    o.item
FROM customers c
	INNER JOIN orders o ON c.customer_id = o.customer_id
    
-- Вывести имя + фамилию покупателя, название товара и статус доставки только у тех покупателей, у кого есть заказ
SELECT 
	c.first_name,
    c.last_name,
    o.item,
    s.status
FROM Shippings s
	INNER JOIN Customers c ON s.customer = c.customer_id
    INNER JOIN Orders o ON c.customer_id = o.customer_id
;    

-- 1. Выведите список имен покупателей, которые совершили покупку. Предусмотрите в выборке номер заказа.
-- В выборке должно присутствовать два атрибута — cname, order_id.

SELECT 
	c.CNAME,
    o.ORDER_ID
FROM orders o
	INNER JOIN customers c ON o.CUST_ID = c.CUST_ID
;

-- 2. Интернет-магазину необходимо заполнить отчет по продажам товаров. 
-- Выведите список имен покупателей, которые совершили покупку, а также ее итоговую сумму.
-- Примечание: выборка не должна содержать строки с NULL значением.
-- В выборке должно присутствовать два атрибута — cname, amt.

SELECT 	
	c.CNAME,
    SUM(o.AMT)
FROM customers c
	INNER JOIN orders o ON c.CUST_ID = o.CUST_ID
GROUP BY c.CNAME    
;   

-- 3. Выведите список всех заказов, сумму, а также имена продавцов.
-- В выборке должны присутствовать три атрибута — order_id, sname, amt.

SELECT 
	o.ORDER_ID,
    s.SNAME,
    o.AMT
FROM orders o
	LEFT JOIN sellers s ON o.SELL_ID = s.SELL_ID
;    

-- 4. Выведите список имен покупателей, продавцов и итоговую сумму заказа.
-- В выборке должны присутствовать три атрибута — cname, sname, amt.

SELECT 
	o.ORDER_ID,
	o.AMT,
	c.CNAME,
    s.SNAME
FROM orders o
	LEFT JOIN customers c ON o.CUST_ID = c.CUST_ID
    LEFT JOIN sellers s ON o.SELL_ID = s.SELL_ID
;