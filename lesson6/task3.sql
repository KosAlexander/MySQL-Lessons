-- Определить кто больше поставил лайков (всего) - мужчины или женщины?
USE vk;

SELECT 
	(SELECT count(id)
FROM likes l
WHERE user_id IN (SELECT user_id
FROM profiles p
WHERE gender = 'M')) AS Man,
	(SELECT count(id)
FROM likes l
WHERE user_id IN (SELECT user_id
FROM profiles p
WHERE gender = 'f')) AS Woman,
IF('Man' > 'Woman', 'Мужики размякли', 'Девчонки как всегда') AS 'Вывод'
;


