USE shop;
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT DATE_FORMAT(DATE(CONCAT_WS('-',YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))),'%W') AS day_week,
COUNT(*) AS quantity
FROM users 
GROUP BY day_week
ORDER BY quantity DESC
;
