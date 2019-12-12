-- Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
-- название таблицы, идентификатор первичного ключа и содержимое поля name.
USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs( 
	id SERIAL,
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	name_table VARCHAR(255),
	id_of_content INT,
	content_name VARCHAR(255)
) ENGINE=Archive;

DROP TRIGGER IF EXISTS to_log_from_users;
DELIMITER //

CREATE TRIGGER to_log_from_users
AFTER INSERT ON users 
FOR EACH ROW
BEGIN
	IF (NEW.name=NEW.name) THEN
	INSERT INTO logs (name_table, id_of_content, content_name) 
	VALUES 
	('users', NEW.id, NEW.name);
    END IF;
END//

DELIMITER ;

DROP TRIGGER IF EXISTS to_log_from_catalogs;
DELIMITER //

CREATE TRIGGER to_log_from_catalogs
AFTER INSERT ON catalogs 
FOR EACH ROW
BEGIN
	IF (NEW.name=NEW.name) THEN
	INSERT INTO logs (name_table, id_of_content, content_name) 
	VALUES 
	('catalogs', NEW.id, NEW.name);
    END IF;
END//

DELIMITER ;

DROP TRIGGER IF EXISTS to_log_from_products;
DELIMITER //

CREATE TRIGGER to_log_from_products
AFTER INSERT ON products 
FOR EACH ROW
BEGIN
	IF (NEW.name=NEW.name) THEN
	INSERT INTO logs (name_table, id_of_content, content_name) 
	VALUES 
	('products', NEW.id, NEW.name);
    END IF;
END//

DELIMITER ;

DELETE FROM catalogs;
INSERT INTO products (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8110', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7290.00, 1);
INSERT INTO users (name, birthday_at) VALUES
  ('Alex', '1980-10-05');
INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');


