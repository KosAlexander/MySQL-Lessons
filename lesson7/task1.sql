-- ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.
use shop;

SELECT name FROM users 
where  EXISTS (SELECT * FROM orders o WHERE user_id = users.id);
