Sand
----------------
[SandBox](https://www.programiz.com/sql/online-compiler/)

### Examples:
```
SELECT first_name, 
       last_name,
       age,
       country
FROM Customers
WHERE 
	--age > 25
	--first_name = 'John'
    --country = 'USA'
    --age not between 25 and 30
    --country in ("USA", "UK")
    last_name like "Do%"
;
```

### Task1:
--  1. Найти всех сотрудников (имя и фамилию) c job_id = IT_PROG
```
SELECT
    first_name,
    last_name
FROM Employees
WHERE
    job_id = "IT_PROG"
;
```
### Task2:
--  Найти всех сотрудников (имя и фамилию, зп) с зп больше 10 000
```
SELECT
    first_name,
    last_name,
    salary
FROM Employees
WHERE
    salary > 10000
;
```
### Task3:
--  Найти всех сотрудников (имя и фамилию, зп) с зп 10 000 до 20 000 (включая концы)
```
SELECT
    first_name,
    last_name,
    salary
FROM Employees
WHERE
    salary between 10000 and 20000
;
```
### Task4:
-- Найти всех сотрудников (имя и фамилию, зп) с зп 10 000 до 20 000 (не включая концы)
```
SELECT
    first_name,
    last_name,
    salary
FROM Employees
WHERE
    salary > 10000 and salary < 20000
;
```
### Task5:
-- Найти всех сотрудников (имя и фамилию, айди департамента) не из 60, 30 и 100 департаментов
```
SELECT
    first_name,
    last_name,
    department_id
FROM Employees
WHERE
    department_id not in (30, 60, 100)
;
```
### Task6:
--  Найти всех сотрудников (имя и фамилию), у которых есть две буквы ll подряд в середине имени
```
SELECT
    first_name,
    last_name
FROM Employees
WHERE
    first_name like '%_ll_%'
;
```
### Task7:
--  Найти всех сотрудников (имя и фамилию), у которых фамилия кончается на a
```
SELECT
    first_name,
    last_name
FROM Employees
WHERE
    last_name like '%a'
;
```

### Homework:
Задачи:
1. Найти всех сотрудников, работающих в департаменте с id 90
2. Найти всех сотрудников, зарабатывающих больше 5000
3. Найти всех сотрудников, чья фамилия начинается на букву L
4. Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ и зарабатывающих меньше 8000
5. Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110
6. Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
Материалы:
1) Базовые понятия и синтаксис: https://drive.google.com/file/d/1E3AlHEiIwoceUUJwoXLf0-rUcelWQhZY/view
2)Логические операторы:
https://drive.google.com/file/d/15oYTsuHLTRFLpMAszICBbrASkhWDmszn/view
https://drive.google.com/file/d/1VMgwOLCECyUPgrY8y0G7LEoJkbzgSBv7/view
3) Домашка:
Установить MySQL server и MySQL Workbench по инструкции из видео: https://drive.google.com/file/d/1SXcx3GhQwwPctgVBS9KuYW_czrksua9Z/view
