Homework 1
----------------

### Task1:
-- Найти всех сотрудников, работающих в департаменте с id 90
```
SELECT 
	*
FROM Employees
WHERE 
	department_id = 90
;
```
### Task2:
-- Найти всех сотрудников, зарабатывающих больше 5000
```
SELECT 
	*
FROM Employees
WHERE 
	salary > 5000
;
```
### Task3:
-- Найти всех сотрудников, чья фамилия начинается на букву L
```
SELECT 
	*
FROM Employees
WHERE 
	last_name like 'L%'
;
```
### Task4:
-- Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ и зарабатывающих меньше 8000
```
SELECT 
	*
FROM Employees
WHERE 
	job_id = 'FI_ACCOUNT' and
    salary < 8000
;
```
### Task5:
-- Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110
```
SELECT 
	*
FROM Employees
WHERE 
	department_id not in (80, 110)
;
```
### Task6:
-- Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
```
SELECT 
	*
FROM Employees
WHERE 
	salary BETWEEN 5000 AND 7000
;
```
