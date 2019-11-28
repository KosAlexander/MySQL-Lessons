-- —оставьте список пользователей users, которые осуществили хот€ бы один заказ orders в интернет магазине.
use shop;

SELECT name FROM users 
where  EXISTS (SELECT * FROM orders o WHERE user_id = users.id);
