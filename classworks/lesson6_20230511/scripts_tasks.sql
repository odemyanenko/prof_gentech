-- 1. Создать таблицу goods с полями:
--     - id (уникальное значение)
--     - title (cтрока максимум 30 символов)
--     - quantity (число больше 0)
--     - in_stock (символ (Y/N))
-- 2. Заполните созданную таблицу goods данными, минимум 10 строк.

USE learn;

CREATE TABLE goods (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30),
    quantity INT CONSTRAINT goods_chk__quantity CHECK (quantity >= 0),
    in_stock CHAR(1) CONSTRAINT goods_chk__in_stock CHECK (in_stock IN ("Y", "N"))
);

INSERT INTO goods (title, quantity, in_stock) VALUES("Phone", 23, "Y");
INSERT INTO goods (title, quantity, in_stock) VALUES("TV", 3, "Y");
INSERT INTO goods (title, quantity, in_stock) VALUES("USB-Flash", 0, "N");
INSERT INTO goods (title, quantity, in_stock) VALUES("Printer", 0, "N");
INSERT INTO goods (title, quantity, in_stock) VALUES("Mouse", 0, "N");
INSERT INTO goods (title, quantity, in_stock) VALUES("Memory", 0, "N");
INSERT INTO goods (title, quantity, in_stock) VALUES("Monitor", 2, "Y");
INSERT INTO goods (title, quantity, in_stock) VALUES("NoteBook", 7, "Y");
INSERT INTO goods (title, quantity, in_stock) VALUES("Lamp", 5, "Y");
INSERT INTO goods (title, quantity, in_stock) VALUES("Microwave", 4, "Y");

SELECT *
FROM goods
;    