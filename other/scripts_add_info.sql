-- https://russianblogs.com/article/53861069433/

SHOW FULL FIELDS FROM group_48_49.employees;

-- mysql некоторые важные системные таблицы
SELECT * FROM INFORMATION_SCHEMA.CHARACTER_SETS;

-- mysql некоторые важные системные таблицы
SELECT table_name, table_type, engine
FROM information_schema.tables;  

-- COLUMNS предоставляет информацию о полях таблицы.
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = 'students';  

-- СТАТИСТИКА предоставляет информацию индекса таблицы.
SELECT * FROM INFORMATION_SCHEMA.STATISTICS
  WHERE table_name = 'students'
  AND table_schema = 'group_48_49'
  ;  
