-- »з таблицы users необходимо извлечь пользователей, родившихс€ в августе и мае. 
-- ћес€цы заданы в виде списка английских названий ('may', 'august')
USE shop;


SELECT name FROM users WHERE  DATE_FORMAT(birthday_at, '%M') IN ('May', 'August');