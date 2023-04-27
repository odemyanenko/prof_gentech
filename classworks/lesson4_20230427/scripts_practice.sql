-- 1. Необходимо создать таблицу students с полями

-- name строка 64 (не null)
-- lastname строка 64 (не null)
-- avg_mark (от 0 до 5)
-- gender varchar(128) (или “M” или “F”)

-- 2. Добавить 5 записей студентов

-- Олег Петров 4.3 M
-- Семен Степанов 3.1 M 
-- Ольга Семенова 4.7 F 
-- Игорь Романов 3.1 M 
-- Ирина Иванова 2.2 F

DROP TABLE students;

CREATE TABLE students(
	name VARCHAR(64) NOT NULL
	, lastname VARCHAR(64) NOT NULL
	, avg_mark NUMERIC(2,1) CONSTRAINT students_chk_avg_mark CHECK (avg_mark BETWEEN 0 AND 5)
	, gender VARCHAR(128) CONSTRAINT students_chk_gender CHECK (gender IN ('M', 'F'))
)
;

INSERT INTO students (name, lastname, avg_mark, gender) VALUES ('Олег', 'Петров', 4.3, 'M');
INSERT INTO students (name, lastname, avg_mark, gender) VALUES ('Семен', 'Степанов', 3.1, 'M');
INSERT INTO students (name, lastname, avg_mark, gender) VALUES ('Ольга', 'Семенова', 4.7, 'F');
INSERT INTO students (name, lastname, avg_mark, gender) VALUES ('Игорь', 'Романов', 3.1, 'M');
INSERT INTO students (name, lastname, avg_mark, gender) VALUES ('Ирина', 'Иванова', 2.2, 'F');

SELECT * FROM students;

-- 3. Добавить поле id integer primary key auto_increment
ALTER TABLE students
	ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

SELECT *
FROM students;    

-- 4. Поменять тип данных у gender на char(1)
ALTER TABLE students
	MODIFY COLUMN gender CHAR(1)
    ;	
    
ALTER TABLE students
	MODIFY gender CHAR(1)
    ;	    
    
-- 5. Переименовать поле name на firstname
ALTER TABLE students
	RENAME COLUMN name TO first_name
    ;	    
    
-- 6. Найти набор уникальных оценок
SELECT DISTINCT avg_mark
FROM students
ORDER BY avg_mark
;    

-- 7. Поменять у Олега Петрова фамилию на Сидоров
UPDATE students
SET lastname = "Сидоров"
WHERE id = 1
;

-- 8. Увеличить всем учащимся оценку в 10 раз
SET sql_safe_updates = 0;

ALTER TABLE students
	DROP CHECK students_chk_avg_mark
;

ALTER TABLE students
	MODIFY COLUMN avg_mark NUMERIC(3,1)
 ;

UPDATE students 
SET 
    avg_mark = avg_mark * 10
;

-- 9. Для всех учеников, у которых оценка не больше 31 увеличить на 10
SELECT * FROM students;

ALTER TABLE students
	MODIFY COLUMN avg_mark NUMERIC(4,1)
 ;

UPDATE students 
SET 
    avg_mark = avg_mark + 10
WHERE avg_mark <= 31    
;

-- 10. Разделите самолеты на ближне-, средне- и дальнемагистральные. 
-- Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
-- Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. 
-- Дальнемагистральными — с дальностью полета > 6000 км. 
-- В выборке должно быть два столбца, где в первом указана модель самолета. 
-- Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul (ближне-, средне- и дальнемагистральные соответственно). 
-- Если максимальная дальность полета <= 1000 км или данных о дальности полета нет, в category выведите 'UNDEFINED'.
-- В выборке должны присутствовать два атрибута — model_name, category.

SELECT * FROM airliners;

SELECT 
    model_name,
    `range`,
    CASE
        WHEN `range` > 1000 AND `range` <= 2500 THEN 'short-haul'
        WHEN `range` > 2500 AND `range` <= 6000 THEN 'medium-haul'
        WHEN `range` > 6000 THEN 'long-haul'
        ELSE 'UNDEFINED'
    END AS category
FROM
    airliners
;