USE Uni;

-- 1. Найти компетенции, которых нет ни у одного преподавателя.
SELECT c.id, c.title
FROM teachers2competencies t2c
	RIGHT JOIN competencies c ON t2c.competencies_id = c.id
WHERE t2c.competencies_id IS NULL    
ORDER BY c.title
;

-- 2. Вывести название курса и имя старосты.
SELECT 
	c.id,
    c.title,
    c.headman_id,
    s.name AS headman_name
FROM courses c
	INNER JOIN students s ON c.headman_id = s.id
ORDER BY c.title    
;
    
-- 3*. Вывести имя студента и имена старост, которые есть на курсах, которые он проходит.    
SELECT 
	s.id AS student_id,
    s.name AS student_name,
    c.title AS course_name,
    s_h.name AS headman_name    
FROM students s
	LEFT JOIN students2courses s2c ON s.id = s2c.student_id
    LEFT JOIN courses c ON s2c.course_id = c.id
    LEFT JOIN students s_h ON c.headman_id = s_h.id
ORDER BY s.name, c.title
;    
    
