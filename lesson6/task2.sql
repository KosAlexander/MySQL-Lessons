USE vk;

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет



SELECT
	count(id)
FROM likes l
WHERE media_id IN (SELECT 
	user_id
FROM profiles p
WHERE 10 > timestampdiff(year, birthday, now())
)
;
