-- ѕусть имеетс€ таблица accounts содержаща€ три столбца id, name, password, содержащие первичный ключ, им€ пользовател€ и его пароль. 
-- —оздайте представление username таблицы accounts, предоставл€ющий доступ к столбца id и name. 
-- —оздайте пользовател€ user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представлени€ username.

CREATE VIEW username (id, name) 
AS SELECT id, name FROM accounts;
SELECT * FROM username;
CREATE USER user_read IDENTIFIED WITH sha256_password BY 'password';
GRANT SELECT ON username TO 'user_read'@'%'; 
