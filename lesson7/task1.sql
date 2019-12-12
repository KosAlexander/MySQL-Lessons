-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
use shop;

INSERT INTO orders (user_id) 
SELECT id FROM users 
WHERE name = 'Геннадий';

INSERT INTO orders_products(order_id,product_id, total) 
SELECT last_insert_id(), id, 2 FROM products 
WHERE name = 'Intel Core i3-8100';

INSERT INTO orders (user_id) 
SELECT id FROM users 
WHERE name = 'Сергей';

INSERT INTO orders_products(order_id,product_id, total) 
SELECT last_insert_id(), id, 1 FROM products 
WHERE name IN ('ASUS ROG MAXIMUS X HERO', 'AMD FX-8320E');


SELECT name FROM users 
WHERE EXISTS (SELECT * FROM orders o WHERE user_id = users.id);
