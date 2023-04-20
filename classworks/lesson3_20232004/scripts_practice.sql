-- 1.Создать таблицу goods (товары) с полями:
-- - id (уникальное значение)
-- - title (cтрока максимум 30 символов)
-- - quantity (число больше 0)
-- - price
-- - in_stock (символ (Y/N))
-- char(1)
-- 2. Заполните созданную таблицу данными, минимум 10 строк.

DROP TABLE goods
;

CREATE TABLE goods (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(30),
	quantity INTEGER CONSTRAINT `goods_chk_quantity` CHECK (`quantity` >= 0),
    price DECIMAL (15, 2),
    in_stock CHAR(1) CONSTRAINT `goods_chk_in_stock` CHECK (`in_stock` IN ('Y', 'N'))
)
;

INSERT INTO goods (title, quantity, price, in_stock)
	VALUES
	('Computer', 12, 13.23, 'Y'),
    ('Phone', 2, 0, 'N'),
    ('Pen', 12, 10, 'Y'),
    ('Printer', 0, 345.34, 'N'),
    ('Keyboard', 1, 10.00, 'Y'),
    ('FlashCard', 120, 134, 'Y'),
    ('Cable Type-C', 0, 130.23, 'N'),
    ('Mouse', 12, 13.23, 'Y'),
    ('Cover', 42, 7.43, 'Y'),
    ('Video Card', 3, 234.56, 'Y')
;    

-- Выборки
-- 4. Вывести все товары, которые есть на складе
SELECT *
FROM goods
;

-- 5. Вывести все товары, длина названия которых больше 5 символов
SELECT 
    *
FROM
    goods
WHERE
    LENGTH(title) > 5
;

SELECT 
    *
FROM
    goods
WHERE
    title LIKE '______%'
;

-- 6. Вывести товары, количество которых больше 5 и название товара содержит букву O
SELECT 
    *
FROM
    goods
WHERE
   quantity > 5 AND title LIKE '%o%'
;

-- 6. Вывести товары, количество которых больше 4 и название товара содержит букву O
SELECT *
FROM goods
WHERE
    title LIKE '%o%' AND 
    title LIKE '%a%'
;

USE hr;

-- 9. Вывести всех сотрудников (имя, фамилия, зп) из департаментов 90 и 60, зарабатывающих более 7000

SELECT 
	first_name,
    last_name,
    salary
FROM employees
WHERE 
	department_id IN (60, 90) AND
    salary > 7000 
;    

-- 10. Вывести всех сотрудников (имя, фамилия, зп) c job_id IT_PROG или FI_ACCOUNT, зарабатывающих более 5000 и чья фамилия содержит букву o
SELECT 
	first_name,
    last_name,
    job_id,
    salary
FROM employees
WHERE 
	job_id IN ('IT_PROG', 'FI_ACCOUNT') AND
    salary > 5000  AND
    last_name LIKE '%o%'
;    


