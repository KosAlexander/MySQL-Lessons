USE vk;

-- ���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���



SELECT
	count(id)
FROM likes l
WHERE media_id IN (SELECT 
	user_id
FROM profiles p
WHERE 10 > timestampdiff(year, birthday, now())
)
;
