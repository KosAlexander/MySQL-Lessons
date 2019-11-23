USE shop;
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT COUNT(*) AS quantity, DAYNAME(birthday_at) as day_week 
FROM users
GROUP BY day_week
;
