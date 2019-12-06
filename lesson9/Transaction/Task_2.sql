-- Создайте представление, 
-- которое выводит название name товарной позиции из таблицы products
--  и соответствующее название каталога name из таблицы catalogs.
USE shop;

CREATE VIEW cat (name,cat_name) 
AS SELECT p.name, c.name
  FROM products p
	JOIN catalogs c ON p.catalog_id = c.id
;

SELECT * FROM cat;
