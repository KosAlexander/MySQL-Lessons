-- скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);
-- Выведем 5 покупателей которые больше всего сделали заказов.
SELECT u.*,
	baskets.user_id,
	orders.total
FROM users u
JOIN baskets ON u.id = baskets.user_id
JOIN orders ON baskets.id = orders.basket_id
ORDER BY orders.total DESC
LIMIT 5
;

-- Какой продукт более популярен 
SELECT l.*,
p.name,
count(*) AS total
FROM products p
JOIN likes l ON p.id = l.product_id
GROUP BY p.id
LIMIT 1;

-- Выведем только совершенные покупки 

SELECT 
	CONCAT(u.firstname,' ', u.lastname) AS name,
 	products.name	
FROM users u
JOIN baskets ON u.id = baskets.user_id
JOIN orders ON baskets.id = orders.basket_id
JOIN products ON orders.product_id = products.id
WHERE orders.status = 'complated';
