-- mongodb://localhost:27017

use hr;

select salary, (
	CASE
		WHEN salary <= 10000 THEN 0.05
        WHEN salary <= 15000 THEN 0.1
        ELSE 0.15
    END
) as tax from employees;
use hr;

select sum(salary * tax) from (
	select salary, (
		CASE
			WHEN salary <= 10000 THEN 0.05
			WHEN salary <= 15000 THEN 0.1
			ELSE 0.15
		END
	) as tax from employees
) as t1;

use hr;

CREATE VIEW taxes as select salary, (
	CASE
		WHEN salary <= 10000 THEN 0.05
		WHEN salary <= 15000 THEN 0.1
		ELSE 0.15
	END
) as tax from employees;

select sum(salary * tax) from taxes;

DROP VIEW taxes;