-- ����� ������� ������� accounts ���������� ��� ������� id, name, password, ���������� ��������� ����, ��� ������������ � ��� ������. 
-- �������� ������������� username ������� accounts, ��������������� ������ � ������� id � name. 
-- �������� ������������ user_read, ������� �� �� ���� ������� � ������� accounts, ������, ��� �� ��������� ������ �� ������������� username.

CREATE VIEW username (id, name) 
AS SELECT id, name FROM accounts;
SELECT * FROM username;
CREATE USER user_read IDENTIFIED WITH sha256_password BY 'password';
GRANT SELECT ON username TO 'user_read'@'%'; 
