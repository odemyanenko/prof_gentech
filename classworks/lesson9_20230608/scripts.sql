USE group_48_49;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    faculty_name VARCHAR(64) NOT NULL,
    avg_grade DECIMAL(4,1)
)
;

INSERT INTO students (name, faculty_name, avg_grade) VALUES 
	("Ivanenko","Math", 11.2),
	("Ivanenko","History", 10.5),
    ("Petrenko","Math", 9.3),
    ("Petrenko","History", 11.2),    
    ("Sidorenko","Math", 11.2),
    ("Sidorenko","History", 5.6)    
;

-- Задание 1
-- Найти имена техт студентов которых средний балл быше среднего в своем факультете
-- students id, name, faculty, avg_grade

SELECT
	s.id,
    s.name,
    s.faculty_name,
    s.avg_grade,
    f_a.avg_grade    
FROM students s
	INNER JOIN (
		SELECT 
			faculty_name, AVG(avg_grade) AS avg_grade
		FROM students
        GROUP BY faculty_name
        ) AS f_a ON s.faculty_name = f_a.faculty_name
WHERE s.avg_grade > f_a.avg_grade
ORDER BY s.name
;

-- 2.
USE learn;

SELECT 
    *
FROM
    (SELECT 
        id, name, lastname, age, phone
    FROM users_ny 
	UNION ALL 
    SELECT 
		id, name, lastname, age, NULL
    FROM users_ws
    ) AS t
WHERE age <= 22
;

-- Задача 2
-- Сделать запорс, который выберает все продукты, 
-- у которых цена выше средней цены всех продуктов.
-- products -> id, name, price, qnt

create table products(
   id int primary key auto_increment,
   name VARCHAR(128),
   price FLOAT,
   qnt INT);
            
INSERT INTO PRODUCTS (name, price, qnt) VALUES
    ('ТЕЛЕФон', 1000.0, 10),
    ('НоуТБУК', 2000.0, 5),
    ('ТЕлевизоР', 1500.0, 8),
    ('Наушники', 100.0, 20),
    ('КлаВиатура', 50.0, 15);
    
SELECT 
	Id, 
    name
FROM prOdUCTS
WHERE price > (
	SELECT 
		AVG(pRICE)
	FROM prodUcts) 
ORDER BY name    
; 

USE shop;

SELECT
	*
FROM orders
WHERE ODATE BETWEEN "2022/03/10" AND "2022/04/10"
;

-- Найти средную стоимость заказа за март
SELECT
	AVG(AMT)
FROM orders
-- WHERE  EXTRACT(MONTH FROM ODATE) = 3
WHERE  MONTH(ODATE) = 3
;

-- Определить какие покупки бтли сделаны во вторник
SELECT
	*
FROM orders
-- WHERE  DAYOFWEEK(ODATE) = 3
WHERE  WEEKDAY(ODATE) = 1
;

USE hr;

-- Задание 1 найти самую высокю зп в таблице сотрудников из БД hr;
SELECT
	e.employee_id,
    e.first_name,
    e.last_name,
    e.salary
FROM employees e
WHERE e.salary = 
	(
    SELECT MAX(salary) as salary_max
FROM employees e
    )
;    
