DROP TABLE IF EXISTS subqueries;
CREATE DATABASE subqueries;
USE subqueries;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
 id INT PRIMARY KEY AUTO_INCREMENT,
 customer_id INTEGER,
    order_price INT CHECK (order_price > 0)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users(
 costomer_id INTEGER,
    costomer_name VARCHAR(128)
);


INSERT INTO orders (customer_id, order_price) VALUES (101, 2000);
INSERT INTO orders (customer_id, order_price) VALUES (102, 100);
INSERT INTO orders (customer_id, order_price) VALUES (102, 3400);
INSERT INTO orders (customer_id, order_price) VALUES (104, 650);
INSERT INTO orders (customer_id, order_price) VALUES (105, 890);


INSERT INTO users (costomer_id, costomer_name) VALUES (101, "Vanya");
INSERT INTO users (costomer_id, costomer_name) VALUES (102, "Petya");
INSERT INTO users (costomer_id, costomer_name) VALUES (104, "Sergey");
INSERT INTO users (costomer_id, costomer_name) VALUES (105, "Olga");


SELECT 
 costomer_name
FROM users
WHERE costomer_id IN (
    SELECT 
  customer_id
 FROM orders
    WHERE order_price >=1500  
);