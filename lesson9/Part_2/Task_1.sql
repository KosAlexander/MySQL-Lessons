-- �������� ���� ������������� ������� ����� ������ � ���� ������ shop. 
-- ������� ������������ shop_read ������ ���� �������� ������ ������� �� ������ ������, 
-- ������� ������������ shop � ����� �������� � �������� ���� ������ shop.
CREATE USER shop_read IDENTIFIED WITH sha256_password BY 'password';
CREATE USER shop IDENTIFIED WITH sha256_password BY 'password';

GRANT SELECT ON shop.* TO shop_read;
GRANT ALL ON shop.* TO shop;
