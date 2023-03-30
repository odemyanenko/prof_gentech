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
--  1. Найти всех сотрудников (имя и фамилию, зп) с зп больше 10 000
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

```
```
