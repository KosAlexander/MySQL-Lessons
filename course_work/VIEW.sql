-- представления (минимум 2);
-- создадим представление которое выводит нам количество и название оставшегося товара на складах.
DROP VIEW IF EXISTS count_of_products;
CREATE OR REPLACE VIEW count_of_products AS 
SELECT p.name,
	s.value
FROM products p 
JOIN storehouses_products s ON p.id = s.product_id
;

SELECT * FROM count_of_products;

-- Создадим представление, чтобы выводить все продукты по категориям. 

DROP VIEW IF EXISTS all_cat_products;
CREATE OR REPLACE VIEW all_cat_products (product, subdirectory, `catalog`, rubric) AS 
SELECT 
	p.name,
	s.name,
	c.name ,
	r.name_catalog
FROM products p
LEFT JOIN subdirectories s ON p.subdir_id = s.id
LEFT JOIN catalogs c ON p.cat_id = c.id
LEFT JOIN rubrics r ON c.rubric_id = r.id
;

SELECT * FROM all_cat_products;