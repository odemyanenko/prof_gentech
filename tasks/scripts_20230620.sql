USE group_48_49;

-- Задача 1
-- Вывести имена продавцов, у которых больше 1 продажи
SELECT 
	sp.SNUM,
    sp.SNAME,
    sc.o_count
FROM salespeople sp
	INNER JOIN (
		SELECT 
			SNUM, 
            COUNT(*) AS o_count
		FROM orders
        GROUP BY SNUM
        HAVING COUNT(*) > 1
    ) sc ON sp.SNUM = sc.SNUM
;
	
SELECT 
	sp.SNUM,
    sp.SNAME
FROM salespeople sp
WHERE sp.SNUM IN (	
		SELECT 
			SNUM
		FROM orders
        GROUP BY SNUM
        HAVING COUNT(*) > 1
    )
;
    
SELECT 
	SNUM, 
    (SELECT SNAME FROM salespeople WHERE SNUM = o.SNUM) AS SNAME
FROM orders o
GROUP BY SNUM
HAVING COUNT(*) > 1    
;

-- Посчитайте итоговую сумму продаж за март-месяц
SELECT
	SUM(o.AMT) AS Amount3
FROM orders o	
WHERE MONTH(o.ODATE) = 3
;

-- Найдите количество покупателей, которые соверишили более 1 покупки у одного продавца
SELECT 
    COUNT(*)
FROM customer c
WHERE 
	c.CNUM IN (
		SELECT 
            CNUM
        FROM orders
        GROUP BY CNUM, SNUM
        HAVING COUNT(*) > 1)
;
