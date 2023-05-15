USE learn;

CREATE TABLE users_ws (
	id INTEGER,
    name VARCHAR(128),
    lastname VARCHAR(128),
    age INT CONSTRAINT users_ws_chk__age CHECK (age BETWEEN 0 AND 120)
);

CREATE TABLE users_ny (
	id INTEGER,
    name VARCHAR(128),
    lastname VARCHAR(128),
    age INT CONSTRAINT users_ny_chk__age CHECK (age BETWEEN 0 AND 120),
    phone VARCHAR(128)
);

INSERT INTO users_ws (id, name, lastname, age) VALUES (1, "Ivan", "Ivanov", 22);
INSERT INTO users_ws (id, name, lastname, age) VALUES (2, "Anna", "Andreeva", 23);
INSERT INTO users_ws (id, name, lastname, age) VALUES (3, "Semen", "Semenov", 23);
INSERT INTO users_ws (id, name, lastname, age) VALUES (4, "Petr", "Petrov", 42);
INSERT INTO users_ws (id, name, lastname, age) VALUES (5, "Vasya", "vasiliev", 32);

SELECT *
FROM users_ws
;

INSERT INTO users_ny (id, name, lastname, age, phone) VALUES (1, "Oleg", "Olegov", 22, "+49234234234");
INSERT INTO users_ny (id, name, lastname, age, phone) VALUES (2, "Olga", "Inavchenko", 31, "+4923423423");
INSERT INTO users_ny (id, name, lastname, age, phone) VALUES (3, "Irina", "Petrova", 43, "+39234234234");

SELECT *
FROM users_ny
;

SELECT 
	id, 
    name, 
    lastname, 
    age, 
    null AS phone, 
    "WASHINGTON" AS city
FROM users_ws
UNION 
SELECT 
	id, 
    name, 
    lastname, 
    age, 
    phone, 
    "NEY YORK" AS city
FROM users_ny
;

    