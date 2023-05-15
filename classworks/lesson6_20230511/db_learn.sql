CREATE DATABASE learn;

USE learn;

CREATE TABLE users(
	name VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    age INTEGER CHECK(age BETWEEN 0 AND 120)
)
;

SELECT *
FROM users
;

INSERT INTO users
	(name, lastname, age) 
VALUES
	("Sergey", "Sydorov", 30)
    ;

-- 2. insert data into table
DROP TABLE IF EXISTS users
;

CREATE TABLE users(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    age INTEGER CHECK(age BETWEEN 0 AND 120),
    phone VARCHAR(128) UNIQUE
)
;

INSERT INTO users 
	(id, name, lastname, age, phone)
VALUES 
	(1, "Olga", "Demyanenko", 18, "+234322525")    
;    

INSERT INTO users 
	(id, name, lastname, age, phone)
VALUES 
	(2, "Sergey", "Ivanov", 34, "+234322529")    
;    

SELECT *
FROM users
;
    
-- 3. modify

INSERT INTO users (name, lastname, age, phone) VALUES ("Ivan", "Petrov", 24, "+334322529");    

SET sql_safe_updates = 0;

DELETE FROM users
WHERE name = "Sergey"
;

SELECT *
FROM users
;

--  4.
DROP TABLE IF EXISTS users
;

CREATE TABLE users(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    age INTEGER CHECK(age BETWEEN 0 AND 120),
    phone VARCHAR(128) UNIQUE,
    driver__license BOOLEAN DEFAULT FALSE
)
;

INSERT INTO users (name, lastname, age, phone, driver__license) VALUES ("Olga", "Demyanenko", 18, "+234322525", TRUE);    
INSERT INTO users (name, lastname, age, phone) VALUES ("Sergey", "Ivanov", 34, "+234322529");    
INSERT INTO users (name, lastname, age, phone) VALUES ("Ivan", "Petrov", 24, "+334322529");    

SELECT *
FROM users
;
