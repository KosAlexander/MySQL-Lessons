-- �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����. 
-- � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", 
-- � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
-- � 18:00 �� 00:00 � "������ �����",
-- � 00:00 �� 6:00 � "������ ����".

DROP FUNCTION IF EXISTS shop.hello;

DELIMITER $$
$$
CREATE FUNCTION shop.hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	SET @mess = '';
	SET  @cur_hour = hour (curtime());
	IF  @cur_hour < 6 then SET @mess = '������ ����';
	ELSEIF @cur_hour < 12 then  SET @mess = '������ ����';
	ELSEIF @cur_hour < 18 then SET @mess = '������ ����';
	ELSE set @mess = '������ �����';
	END IF;
	RETURN @mess; 
END$$
DELIMITER ;

SELECT hello();
