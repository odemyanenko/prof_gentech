DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
 name VARCHAR (128),
 cliend_id INTEGER NOT NULL
);

INSERT INTO clients (name, cliend_id) VALUES ('ALexandr', 1),
														  ('Yulia',  2),
														  ('Pavel',  3);
                                                          
SELECT * FROM clients;


DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
	id INTEGER,
	currency_id integer,
    money_amount integer
);

INSERT INTO transactions (id, currency_id, money_amount) VALUES (1, 1, 1000),
																  (2, 3, 400),
																  (1, 3, 450),
																  (3, 1, 0),
																  (1, 3, 200);

SELECT * FROM transactions;



SELECT
	t1.name,
    t2.id,
    t2.money_amount
FROM clients t1
INNER JOIN transactions t2
ON t1.cliend_id = t2.id
