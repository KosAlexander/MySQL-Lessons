-- Пусть имеется любая таблица с календарным полем created_at. 
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

DROP VIEW IF EXISTS view_last_created_at;

CREATE OR REPLACE VIEW shop.view_last_created_at
AS SELECT * FROM products p ORDER BY created_at LIMIT 5;

SELECT * FROM view_last_created_at;