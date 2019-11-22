USE shop;
-- Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.


ALTER TABLE users CHANGE COLUMN created_at created DATETIME NOT NULL;
ALTER TABLE users CHANGE COLUMN updated_at updated DATETIME NULL;



DESCRIBE users;

