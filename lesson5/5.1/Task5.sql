-- �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- ������������ ������ � �������, �������� � ������ IN.
USE shop;

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD (id, 5, 1, 2);