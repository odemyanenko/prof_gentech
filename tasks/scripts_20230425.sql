USE group_48_49;

-- 1.Создайте таблицу products со следующими полями: name, quantity.
-- Поле name должно быть текстовым, а quantity — целочисленным.

CREATE TABLE products (    
	name VARCHAR(100),
    nameDE VARCHAR(100),
	quantity INTEGER
)
;

-- 2. Для созданной таблицы products задайте три записи:

-- 1) Велосипед, количество — 10.
-- 2) Самокат, количество — 15.
-- 3) Скейтборд, количество — 30.

INSERT INTO products (name, nameDE, quantity) VALUES ('Велосипед', 'Fahrrad', 10);   
INSERT INTO products (name, nameDE, quantity) VALUES ('Самокат', 'Motorroller', 15);   
INSERT INTO products (name, nameDE, quantity) VALUES ('Скейтборд', 'Skateboard', 30);    

-- 3. Создайте таблицу employees со следующими полями: id, name, age, role.
-- Для id и age задайте целочисленный тип, для name и role — текстовый.
-- Примечание.
-- 1) Атрибут id должен иметь ограничение первичного ключа и автоматически формировать порядковый номер строки.
-- 2) Атрибут age не должен иметь NULL-строки.
-- 3) Атрибут role, если не будет учтен при записи, должен формировать значение 'user'.

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100), 
    age INT NOT NULL, 
    role VARCHAR(50) DEFAULT 'user'
)
;

-- 4. Создайте таблицу users со следующими полями: firstname, lastname, age, gender.
-- Для firstname, lastname и gender задайте текстовый тип данных, для age — целочисленное значение.
-- Примечание.
-- 1) Атрибуты firstname и lastname должны иметь ограничение первичного ключа (primary key(поле_1, поле_2)).
-- 2) Атрибут age не должен иметь NULL-строки.
-- 3) Атрибут gender должен проверять данные на следующее условие: должно быть либо значение 'm', либо 'f'.

CREATE TABLE users (
	firstname VARCHAR(100), 
    lastname VARCHAR(100), 
    age INT NOT NULL, 
    gender CHAR(1) CONSTRAINT `users_chk_gender` CHECK (gender IN ('m', 'f')),
    PRIMARY KEY (firstname, lastname)
)
;