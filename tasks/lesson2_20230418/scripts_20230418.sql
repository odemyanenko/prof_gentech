USE hr
;
-- 1)
SELECT 
    *
FROM
    employees
WHERE
	salary > 10000 AND salary < 20000
;
-- 2)
SELECT 
    *
FROM
    employees
WHERE
    salary BETWEEN 10000 AND 20000
;

-- 3)
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Steven', 'Lex', 'Neena')
;

-- 4) Выведите сотрудников, фамилия которых заканчивается на 'b'
SELECT 
    *
FROM
    employees
WHERE
   last_name LIKE '%b' 
;

--  5) Выведите сотрудников, у которых вторая буква имени 'h'
SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE '_h%' 
;

--  6) Выведите сотрудников, у которых первая и предпоследняя буква в имени 'a'
SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE 'a%a_' 
;

--  7) Выведите сотрудников, у которых по середине (строго) имеются буквы ll
SELECT 
    *
FROM
    employees
WHERE
   first_name LIKE '%_ll_%' 
;

--  8) Выведите сотрудников, у которых третья буквы в имени 'a'. Но в имени эта же буква не должна быть в конце.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE '__a%' AND
    first_name NOT LIKE '%a'
;
	
--  9) Выведите сотрудников, у которых в имени нет буквы 'a' и 'c' 
 SELECT 
    *
FROM
    employees
WHERE    
    first_name NOT LIKE '%a%' AND
    first_name NOT LIKE '%c%' 
;