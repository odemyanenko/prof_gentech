DROP TABLE IF EXISTS table_1;
CREATE TABLE table_1 (
	id  INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128)
);

INSERT INTO table_1 (name) VALUES ("Гайк"), ("Сева"), ("Сева"), ("Катя");

DROP TABLE IF EXISTS table_2;
CREATE TABLE table_2 (
	id  INTEGER,
    age INTEGER
);

INSERT INTO table_2 (id, age) VALUES (3,22), (4,44), (5,11), (6,77);

SELECT *
FROM table_1
;

SELECT *
FROM table_2
;