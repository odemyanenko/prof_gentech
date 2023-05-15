-- 1. Создать таблицу goods_2 с полями:
--     - id (уникальное значение)
--     - title (cтрока максимум 30 символов)
--     - quantity (число больше 0)
--     - price (целое число)
--     - in_stock (символ (Y/N))
-- аполните созданную таблицу goods_2 данными, минимум 10 строк.

USE learn;

CREATE TABLE goods_2 (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30),
    quantity INT CONSTRAINT goods_2_chk__quantity CHECK (quantity >= 0),
    price INT,
    in_stock CHAR(1) CONSTRAINT goods_2_chk__in_stock CHECK (in_stock IN ("Y", "N"))
);

INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Phone", 2, 23, "Y");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("TV", 32, 11, "Y");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("USB-Flash", 12, 3, "Y");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Printer", 4, 230, "Y");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Mouse", 0, 13, "N");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Memory", 0, 100, "N");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Monitor", 22, 350, "Y");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("NoteBook", 7, 1200, "Y");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Lamp", 0, 30, "N");
INSERT INTO goods_2 (title, quantity, price, in_stock) VALUES("Microwave", 3, 200, "Y");

-- 2. Вывести все наименования товаров (включая дубли) из двух таблиц
SELECT title
FROM goods
UNION ALL
SELECT title
FROM goods_2
;
-- 3. Вывести уникальные названия товаров (без дублей) из двух таблиц
SELECT title
FROM goods
UNION 
SELECT title
FROM goods_2
;