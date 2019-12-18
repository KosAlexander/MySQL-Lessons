USE shop_armor;
-- Создадим триггер, который запрещает ввод нулевых значений в поля  firstname, phone, email.
DELIMITER //

DROP TRIGGER IF EXISTS stop_if_null//
CREATE TRIGGER stop_if_null BEFORE INSERT ON users
FOR EACH ROW
BEGIN
  IF (NEW.firstname IS NULL) OR (NEW.phone IS NULL) OR (NEW.email IS NULL) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Record must contain firstname, phone, email not NULL value';
  END IF;
END//

DELIMITER ;


-- INSERT INTO `users` VALUES (NULL,'Gin','Roob','flindgren1@example.com',NULL);


-- создадим процедуру, которая будет предлагать каждый раз 3 новых товара пользователю.
DROP PROCEDURE IF EXISTS shop_armor.new_product_for_user;

DELIMITER //
//
CREATE PROCEDURE shop_armor.new_product_for_user()
BEGIN
	SELECT * FROM products p  
	WHERE created >= now() - INTERVAL 6 MONTH 
	ORDER BY rand() LIMIT 3 ;
END//
DELIMITER ;

CALL new_product_for_user();
