USE vk;

-- 2 Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке


SELECT DISTINCT firstname FROM users
ORDER BY firstname ASC;

-- 3 Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
-- При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0)
SELECT user_id, birthday,
	IF(
	TIMESTAMPDIFF(YEAR,birthday, NOW())>=18,'1', '0'
	) AS is_active
FROM profiles;

-- 4 Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)

DELETE 
	FROM messages m 
	WHERE created_at >= NOW()
;





