USE vk;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

ALTER TABLE vk.users ADD created_at DATETIME; -- добавил колонки
ALTER TABLE vk.users ADD updated_at DATETIME;

UPDATE users
SET 
	created_at = now(),
	updated_at = now()
;