-- work with date and time
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_str-to-date

SELECT CURDATE();
SELECT NOW();
SELECT SYSDATE();

SELECT EXTRACT(MONTH FROM NOW());

SELECT DATE_ADD(NOW(), INTERVAL 5 DAY);
SELECT DATE_ADD(NOW(), INTERVAL -5 DAY);

SELECT DATEDIFF("2023/01/01", NOW());