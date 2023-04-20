USE hr
;
-- 1. Вывести все города с country_id IT, US и UK
SELECT 
    *
FROM
    locations
WHERE
    country_id IN ('IT' , 'US', 'UK')
;

-- 2. Вывести только тех работников (имя, фамилию, зп, email), у которых и в имени и в фамилии есть буква a
SELECT 
    first_name,
    last_name,
    salary,
    email
FROM
    employees
WHERE
	first_name like "%a%" AND last_name like "%a%"
;

-- 3. Вывести только тех работников (имя, фамилию, зп, номер телефона), у которых имя содержит букву O и номер телефона начинается с 515. 
-- Примечание. Работник должен зарабатывать более 6000
SELECT 
    first_name,
    last_name,
    salary,
    phone_NUMERIC
FROM
    employees
WHERE
	first_name like "%o%" AND phone_NUMERIC like '515%' AND salary > 6000
;

-- 4. Ввыести работников (имя, фамилию), у которых нет менеджера
SELECT 
    first_name,
    last_name
FROM
    employees
WHERE
	manager_id IS NULL
;

-- 5. Вывести всех работников (имя, фамилия, зп), отсортированными по возрастанию зарплаты
SELECT 
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY salary ASC
;

-- 6. Вывести всех работников (имя, фамилия, зп), отсортированными по убыванию зарплаты
SELECT 
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY salary DESC
;

-- 7. Вывести всех работников (имя, фамилия), отсортированными по фамилии в алфавитном порядке
SELECT 
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY last_name
;

-- 8. Вывести всех работников (имя, фамилия, зп), отсортированными по возрастанию зарплаты. 
-- Если зарплата одинаковая отсортировать по фамилии в алфавитном порядке
SELECT 
    first_name, last_name, salary
FROM
    employees
ORDER BY salary DESC , last_name , first_name
;

-- 9. Вывести сотрудников (имя, фамилия, айди департамента), работающих в департаментах с id 60, 90 и 110, 
-- отсортированными в алфавитном порядке по фамилии
SELECT 
    first_name, 
    last_name, 
    department_id
FROM
    employees
WHERE department_id IN (60, 90, 110)
ORDER BY last_name
;

-- 10. Вывести сотрудников с job_id ST_CLERK, отсортированными по зарплате - от самой большой зарплаты до самой маленькой
SELECT 
    first_name, 
    last_name, 
    job_id,
    salary
FROM
    employees
WHERE job_id = 'ST_CLERK'
ORDER BY salary DESC
;

-- 11. Вывести сотрудников (имя, фамилия), чьи имена начинаются на букву D и отсортировать их в алфавитном порядке по фамилии
SELECT 
    first_name, 
    last_name
FROM
    employees
WHERE first_name like 'D%'
ORDER BY last_name
;

-- 12.  Найти все имеющиеся job_id
SELECT DISTINCT
    job_id
FROM
    employees
;
