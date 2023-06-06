-- 1. Предусмотрите в выборке также имена продавцов.
-- Примечание: покупатели и продавцы должны быть из разных городов.
-- В выборке должно присутствовать два атрибута — cname, sname.

SELECT 
	c.CNAME,
    s.SNAME
FROM orders o
	INNER JOIN customers c ON o.CUST_ID = c.CUST_ID
    INNER JOIN sellers s ON o.SELL_ID = s.SELL_ID
WHERE c.CITY <> s.CITY
ORDER BY c.CNAME, s.SNAME
;

-- 2. Напишите запрос, который вернет выборку full join, используя таблицы CUSTOMERS и ORDERS (по ключу CUST_ID).
-- В выборке должно присутствовать два атрибута — cname, order_id.

SELECT c.CNAME, o.ORDER_ID
FROM orders o
	LEFT JOIN customers c ON o.CUST_ID = c.CUST_ID
UNION 
SELECT c.CNAME, o.ORDER_ID
FROM orders o
	RIGHT JOIN customers c ON o.CUST_ID = c.CUST_ID
ORDER BY CNAME
; 

-- 3. **Создание таблиц**
-- 1) Создать таблицу Students с полями:- id целое число первичный ключ автоинкремент- name строка 128 не null- age целое число
-- 2) Создать таблицу Teachers с полями:- id целое число первичный ключ автоинкремент- name строка 128 не null- age целое число
-- 3) Создать таблицу Competencies с полями:- id целое число первичный ключ автоинкремент- title строка 128 не null
-- 4) Создать таблицу Teachers2Competencies с полями:- id целое число первичный ключ автоинкремент- teacher_id целое число- competencies_id целое число
-- 5) Создать таблицу Courses - id целое число первичный ключ автоинкремент- teacher_id целое число- title строка 128 не null- headman_id целое число
-- 6) Создать таблицу Students2Courses - id целое число первичный ключ автоинкремент- student_id целое число- course_id целое число

CREATE DATABASE uni;

USE uni;

CREATE TABLE Students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    age INT
);

CREATE TABLE Teachers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    age INT
); 

CREATE TABLE Competencies (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL
); 

CREATE TABLE Teachers2Competencies (
	id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    competencies_id INT
); 

CREATE TABLE Courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
	title VARCHAR(128) NOT NULL,
    headman_id INT
); 

CREATE TABLE Students2Courses (
	id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT
); 

USE uni;

INSERT INTO students (name, age) VALUES ("Анатолий", 29);
INSERT INTO students (name, age) VALUES ("Олег", 25);
INSERT INTO students (name, age) VALUES ("Семен", 27);
INSERT INTO students (name, age) VALUES ("Олеся", 28);
INSERT INTO students (name, age) VALUES ("Ольга", 31);
INSERT INTO students (name, age) VALUES ("Иван", 22);

INSERT INTO teachers (name, age) VALUES ("Петр", 39);
INSERT INTO teachers (name, age) VALUES ("Максим", 35);
INSERT INTO teachers (name, age) VALUES ("Антон", 37);
INSERT INTO teachers (name, age) VALUES ("Всеволод", 38);
INSERT INTO teachers (name, age) VALUES ("Егор", 41);
INSERT INTO teachers (name, age) VALUES ("Светлана", 32);

INSERT INTO competencies (title) VALUES ("Математика");
INSERT INTO competencies (title) VALUES ("Информатика");
INSERT INTO competencies (title) VALUES ("Программирование");
INSERT INTO competencies (title) VALUES ("Графика");

INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES (1, 1);
INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES (2, 1);
INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES (2, 3);
INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES (3, 2);
INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES (4, 1);
INSERT INTO teachers2competencies (teacher_id, competencies_id) VALUES (5, 3);

INSERT INTO courses (teacher_id, title, headman_id) VALUES (1, "Алгебра логики", 2);
INSERT INTO courses (teacher_id, title, headman_id) VALUES (2, "Математическая статистика", 3);
INSERT INTO courses (teacher_id, title, headman_id) VALUES (4, "Высшая математика", 5);
INSERT INTO courses (teacher_id, title, headman_id) VALUES (5, "Javascript", 1);
INSERT INTO courses (teacher_id, title, headman_id) VALUES (5, "Базовый Python", 1);

INSERT INTO students2courses (student_id, course_id) VALUES (1, 1);
INSERT INTO students2courses (student_id, course_id) VALUES (2, 1);
INSERT INTO students2courses (student_id, course_id) VALUES (3, 2);
INSERT INTO students2courses (student_id, course_id) VALUES (3, 3);
INSERT INTO students2courses (student_id, course_id) VALUES (4, 5);

-- Вывести имена студентов и курсы, которые они проходят
USE uni;

SELECT 
	s2c.student_id,
    s.name AS student_name,
    c.title AS course_name
FROM students2courses s2c
	INNER JOIN students s ON s2c.student_id = s.id
    INNER JOIN courses c ON s2c.course_id = c.id
ORDER BY 2, 3    
;

-- Вывести имена преподавателей и предметы, которые они преподают
SELECT 
	t2c.teacher_id,
    t.name AS teacher_name,
    c.title AS competency_name
FROM teachers2competencies t2c
	INNER JOIN teachers t ON t2c.teacher_id = t.id
    INNER JOIN competencies c ON t2c.competencies_id = c.id
ORDER BY 2, 3    
;

SELECT 
	t.id AS teacher_id,
    t.name AS teacher_name
FROM teachers t
	LEFT JOIN teachers2competencies t2c ON t.id = t2c.teacher_id
WHERE t2c.id IS NULL    
;
  
-- Найти имена студентов, которые не проходят ни один курс
SELECT 
	s.id AS student_id,
    s.name AS student_name    
FROM students s
    LEFT JOIN students2courses s2c ON s.id = s2c.student_id
WHERE s2c.course_id IS NULL
;



