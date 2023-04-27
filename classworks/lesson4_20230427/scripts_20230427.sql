USE group_48_49;

-- add column
ALTER TABLE goods
	ADD country VARCHAR(64)
    ;

ALTER TABLE goods
	ADD COLUMN country VARCHAR(64)
    ;
    
ALTER TABLE goods
	ADD COLUMN country VARCHAR(64),
    ADD COLUMN isDeleted BIT
    ;    
    
-- drop column    
ALTER TABLE goods
	DROP COLUMN country
    ;    

--  modify column  
ALTER TABLE goods
	MODIFY COLUMN country  varchar(100)
;        

ALTER TABLE goods
	CHANGE title product_title VARCHAR(64)
    ;
    
ALTER TABLE goods
	RENAME COLUMN product_title TO title
;     

-- add/delete check
ALTER TABLE goods
DROP CHECK goods_chk_quantity
;

ALTER TABLE goods
ADD CONSTRAINT `goods_chk_quantity` CHECK ((`quantity` >= 0))
;

ALTER TABLE goods
ADD CONSTRAINT goods_chk_quantity CHECK ((`quantity` >= 0))
;

ALTER TABLE goods
ADD CHECK ((`quantity` >= 0))
;

-- update/delete data in table
SET sql_safe_updates = 0;
UPDATE goods
SET 
	quantity = 12
    , price = price / 2
WHERE id = 10    
;

SET sql_safe_updates = 0;
DELETE 
FROM goods
WHERE id = 9;

TRUNCATE goods;

-- case
SELECT 
	first_name
    , age
    , CASE 
      	WHEN age >= 25 THEN 'adult'
        ELSE 'young man'
      END AS status
FROM customers
;