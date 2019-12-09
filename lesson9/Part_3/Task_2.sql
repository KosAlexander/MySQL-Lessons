-- ¬ таблице products есть два текстовых пол€: name с названием товара и description с его описанием. 
-- ƒопустимо присутствие обоих полей или одно из них. 
-- —итуаци€, когда оба пол€ принимают неопределенное значение NULL неприемлема.
-- »спользу€ триггеры, добейтесь того, чтобы одно из этих полей или оба пол€ были заполнены.
-- ѕри попытке присвоить пол€м NULL-значение необходимо отменить операцию.
DELIMITER //

DROP TRIGGER IF EXISTS stop_if_null//
CREATE TRIGGER stop_if_null BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  IF (NEW.name IS NULL) OR (NEW.description IS NULL) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Record must contain Name or Description not NULL value';
  END IF;
END//

DELIMITER ;

