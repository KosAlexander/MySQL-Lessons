-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер",
-- с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS shop.hello;

DELIMITER $$
$$
CREATE FUNCTION shop.hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	SET @mess = '';
	SET  @cur_hour = hour (curtime());
	IF  @cur_hour < 6 then SET @mess = 'Доброй ночи';
	ELSEIF @cur_hour < 12 then  SET @mess = 'Добрый день';
	ELSEIF @cur_hour < 18 then SET @mess = 'Добрый день';
	ELSE set @mess = 'Добрый вечер';
	END IF;
	RETURN @mess; 
END$$
DELIMITER ;

SELECT hello();
