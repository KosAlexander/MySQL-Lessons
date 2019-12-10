-- ����� ������� ����� ������� � ����������� ����� created_at. 
-- �������� ������, ������� ������� ���������� ������ �� �������, �������� ������ 5 ����� ������ �������.

DROP VIEW IF EXISTS view_last_created_at;

CREATE OR REPLACE VIEW shop.view_last_created_at
AS SELECT * FROM products p ORDER BY created_at LIMIT 5;

SELECT * FROM view_last_created_at;