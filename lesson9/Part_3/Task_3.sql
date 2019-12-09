-- Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- Вызов функции FIBONACCI(10) должен возвращать число 55.

DROP FUNCTION IF EXISTS shop.fibonacci;

DELIMITER $$
$$
CREATE FUNCTION shop.fibonacci(val INT)
RETURNS BIGINT DETERMINISTIC
BEGIN
	DECLARE cur INT DEFAULT 3; 
	DECLARE fib_cur INT DEFAULT 1; 
	DECLARE fib_prev INT DEFAULT 1;
	DECLARE temp INT DEFAULT 1;
	
	IF val IN (1,2) THEN RETURN 1;
	END IF; 
	WHILE cur <= val DO
		SET temp = fib_prev, fib_prev = fib_cur, fib_cur = fib_cur + temp;
		SET cur = cur + 1;
	END WHILE;
 	RETURN fib_cur;
END$$
DELIMITER ;



SELECT shop.fibonacci(1);

SELECT shop.fibonacci(2);

SELECT shop.fibonacci(3);

SELECT shop.fibonacci(4);

SELECT shop.fibonacci(5);

SELECT shop.fibonacci(6);

SELECT shop.fibonacci(7);

SELECT shop.fibonacci(8);

SELECT shop.fibonacci(9);

SELECT shop.fibonacci(10);