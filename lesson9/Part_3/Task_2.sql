-- � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
-- ��������� ����������� ����� ����� ��� ���� �� ���. 
-- ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������.
-- ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������.
-- ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.
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

