USE vk;

 -- Пусть задан некоторый пользователь. 
 -- Из всех друзей этого пользователя найдите человека,
 -- который больше всех общался с нашим пользователем.
SELECT 
	(SELECT firstname FROM users u WHERE id = from_user_id) AS firstname,
	(SELECT lastname FROM users u WHERE id = from_user_id) AS lastname,
	count(*) AS 'send messages',
	id
FROM messages m
WHERE to_user_id = '1'
GROUP BY from_user_id
ORDER BY 'send messages'
;

