CREATE DATABASE group_48_49
;

USE group_48_49
;

-- ОГРАНИЧЕНИЯ / Constraints (констрейнты)
-- NOT NULL - ячейка не может быть null (без значения)
-- UNIQUE - значение в поле должно быть уникальным
-- ОГРАНИЧЕНИЯ / Constraints (констрейнты)
-- NOT NULL - ячейка не может быть null (без значения)
-- UNIQUE - значение в поле должно быть уникальным
-- PRIMARY KEY - NOT NULL + UNIQUE
-- CHECK - значение поля должно соответствовать условию

-- AUTO_INCREMENT - поле заполняется автоматически уникальным значением
-- DEFAULT - в случае, если значение поля не указывается, заполняется значением по умолчанию


-- The max length of a varchar is subject to the max row size in MySQL, which is 64KB (not counting BLOBs):
-- VARCHAR(65535)
-- However, note that the limit is lower if you use a multi-byte character set:
-- VARCHAR(21844) CHARACTER SET utf8

-- Since money needs an exact representation don't use data types that are only approximate like float. You can use a fixed-point numeric data type for that like
-- decimal(15,2)
-- 15 is the precision (total length of value including decimal places)
-- 2 is the number of digits after decimal p

CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTO_INCREMENT, -- NOT NULL UNIQUE,
    firstname VARCHAR(64), -- CONSTRAINT `students_chk_firstname` CHECK ((`firstname` like 'o%')),
    lastname VARCHAR(64) DEFAULT 'Ivanov',
    avg_mark NUMERIC(2, 1)  CONSTRAINT `students_chk_avg_mark` CHECK ((`avg_mark` between 0 and 5))
)
;

SELECT *
FROM students
;

DROP TABLE students
;

INSERT INTO students (id, firstname, lastname, avg_mark)
VALUES(1, 'Olga', 'Ivanov', 4.3)
;

INSERT INTO students (id, firstname, lastname, avg_mark)
VALUES 
(2, 'Anton', 'Ivanov', 4.3),
(3, 'Anna', 'Sydorov', 3.3),
(4, 'Roman', 'Ivanov', 4.8)
;

-- with auto increment
INSERT INTO students (firstname, lastname, avg_mark)
VALUES('Olga', 'Ivanov', 4.3)
;

INSERT INTO students (firstname, lastname, avg_mark)
VALUES 
('Anton', 'Ivanov', 4.3),
('Anna', null, 3.3),
('Roman', 'Ivanov', 4.8)
;

INSERT INTO students (firstname, avg_mark)
VALUES('Kateryna', 4.3)
;
