USE group_48_49
;
-- 1. Создать таблицу students с полями: id первичный ключ авто-инкремент
-- name (не null)
-- lastname (не null)
-- avg_mark (от 0 до 5)
-- gender char(1) (“M” или “F”)

CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64) NOT NULL,
	lastname VARCHAR(64) NOT NULL,
	avg_mark NUMERIC(2, 1) CONSTRAINT `student_chk__avg_mark` CHECK (avg_mark BETWEEN 0 AND 5),
	gender CHAR(1) CONSTRAINT `student_chk__gender` CHECK (gender IN ('M', 'F'))
)
;

-- 2. Добавить 5 записей студентов
-- Олег Петров 4.3 M
-- Семен Степанов 3.1 M
-- Ольга Семенова 4.7 F
-- Игорь Романов 3.1 M
-- Ирина Иванова 2.2 F

INSERT INTO students 
	(name, lastname, avg_mark, gender)
VALUES
	('Олег', 'Петров', 4.3, 'M'),
    ('Семен', 'Степанов', 3.1, 'M'),
	('Ольга', 'Семенова', 4.7, 'F'),
	('Игорь', 'Романов', 3.1, 'M'),    
    ('Ирина', 'Иванова', 2.2, 'F')
;    

SELECT *
FROM students
;
-- 3. Выборки
-- 3.1) найти учеников, у которых оценка больше 4
SELECT *
FROM students
WHERE
	avg_mark > 4
;
-- 3.2) найти учеников, у которых не входит в диапазон от 3 до 4
SELECT *
FROM students
WHERE
	avg_mark BETWEEN 3 AND 4
;
-- 3.3) найти учеников, у которых имя начинается на И
SELECT *
FROM students
WHERE
	name LIKE 'И%'
;
-- 3.4) найти учеников, у которых оценка 2.2 или 3.1 или 4.7
SELECT *
FROM students
WHERE 
	avg_mark IN (2.2, 3.1, 4.7)    
;
