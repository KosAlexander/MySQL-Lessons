-- Создаём БД интернет магазинa оружия.

DROP DATABASE IF EXISTS shop_armor; 
CREATE DATABASE shop_armor;

USE shop_armor;

-- 1 создаем сущность покупатели: 

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, 	-- bigint unsigned not null auto_increment unique			
    firstname VARCHAR(50) NOT NULL COMMENT 'Имя покупателя',		
    lastname VARCHAR(50) COMMENT 'Фамилия покупателя', 		
    email VARCHAR(120) UNIQUE NOT NULL COMMENT 'Email покупателя',
    phone BIGINT UNIQUE NOT NULL COMMENT 'Номер телефона покупателя', 	
        
    INDEX users_phone_idx(phone), 		
    INDEX users_firstname_lastname_idx(firstname, lastname), 
    INDEX users_email_idx(email) 		
)COMMENT = 'Покупатели';

INSERT INTO `users` VALUES ('41','Gianni','Roob','flindgren@example.com','1'),
('42','Ezekiel','Braun','penelope22@example.org','308'),
('43','Abagail','Predovic','filiberto.gerlach@example.com','0'),
('44','Annetta','Steuber','fabshire@example.com','70'),
('45','Marianne','O\'Conner','hobart21@example.org','367830'),
('46','Giuseppe','Kunde','von.cyril@example.net','784352'),
('49','Anjali','Beatty','umurphy@example.org','802'),
('50','Destin','Flatley','kendra.pacocha@example.com','785101'),
('51','Ray','Johnston','tromp.cassandra@example.com','178'),
('54','Maryjane','Gerlach','lucie.mohr@example.org','565'),
('56','Alejandra','Maggio','xdicki@example.com','58'),
('58','Pasquale','Weimann','vicenta39@example.com','512'),
('60','Kavon','Jast','lurline02@example.com','6148346427'),
('63','Emmet','Effertz','hills.della@example.net','535'),
('64','Orland','Keeling','afahey@example.net','323842794'),
('67','Carlie','Heidenreich','gschaden@example.com','508'),
('69','Niko','Koepp','lowe.brandi@example.net','88'),
('71','Cristina','Luettgen','morissette.yasmin@example.org','655365'),
('72','Brandt','Jones','della.ortiz@example.com','98'),
('73','Aurelia','Harvey','wvon@example.net','210'),
('74','Ashley','Murazik','williamson.alexandra@example.net','2907460256'),
('76','Shea','Wilkinson','rasheed.cole@example.com','91'),
('77','Rhianna','Simonis','aboyer@example.com','60'),
('79','Dessie','Stamm','estel.klocko@example.org','245'),
('80','Seamus','Cummerata','korbin.blanda@example.org','463'); 



-- 2 создаем сущность профили покупателей:

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	sex ENUM ('Man', 'Woman') COMMENT 'Пол покупателя', 				
	birthday DATE COMMENT 'Дата рождения',						
	hometown VARCHAR(100) COMMENT 'Город покупателя',				
    address VARCHAR(255) COMMENT 'Адрес покупателя',				
    status ENUM ('registred', 'active', 'deleted') COMMENT 'Статус покупателя',
    /* Описание статусов
     * 'registred' - зарегистрированный пользователь
     * 'active' - активный пользователь, совершивший одну или несколько покупок
     * 'deleted' - пользователь, по каким-то причинам помеченный как удаленный (доступ к системе заблокирован)
     */
    created DATETIME DEFAULT NOW() COMMENT 'Дата создание профиля покупателя',	
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата обновления профиля покупателя',
	
    FOREIGN KEY (user_id) REFERENCES users(id)
    	ON UPDATE CASCADE 				
    	ON DELETE RESTRICT				
)COMMENT = 'Дополнительная информация о покупателях';

INSERT INTO `profiles` VALUES ('41','Man','2017-04-23',NULL,'778 Rodrigo Islands\nHillarytown, CO 80417','active','1977-06-28 12:42:56','2016-11-07 03:26:20'),
('42','Man','1970-10-16',NULL,'792 O\'Kon Highway Suite 479\nNorth Aubree, KS 58545-2775','active','2015-04-29 22:45:43','2007-10-26 20:33:34'),
('43','Woman','1991-01-21',NULL,'773 Dimitri Island\nWest Gailmouth, ND 68312','registred','1970-05-21 03:37:30','1979-06-21 12:03:02'),
('44','Man','1991-12-25',NULL,'3024 Schumm Inlet Apt. 062\nAglaestad, CT 64254','deleted','1979-11-15 17:18:55','1993-04-16 22:38:42'),
('45','Woman','1972-07-01',NULL,'12349 Vicky Coves Suite 527\nRennerborough, NM 24158','registred','1982-02-05 02:22:33','1995-09-15 15:27:17'),
('46','Woman','1980-03-29',NULL,'410 Rowe Pine\nMullerton, VA 92079-7232','registred','2005-06-15 02:08:34','2005-02-03 02:31:55'),
('49','Man','2009-08-27',NULL,'153 Kris Throughway Apt. 167\nLake Frederiquefurt, NV 25327','active','1995-09-09 12:33:04','1984-03-22 22:30:07'),
('50','Man','2003-05-20',NULL,'76621 Rory Dale\nNew Bethelton, ND 29511','deleted','2012-03-08 18:52:33','1988-10-04 10:51:29'),
('51','Woman','1973-05-29',NULL,'0331 Keven Stream Suite 222\nWest Carrollmouth, OH 20396-0732','active','2007-06-27 07:04:15','1973-04-16 22:12:54'),
('54','Man','2009-06-22',NULL,'3974 Ferne Mountains\nEbertstad, ME 81262-9296','active','2016-12-10 21:54:47','1999-06-12 08:55:51'),
('56','Man','1987-02-19',NULL,'29659 Gideon Rapid\nTorpton, ME 50581','deleted','1995-05-06 14:09:35','2005-06-11 18:18:19'),
('58','Woman','2010-08-06',NULL,'5204 Kayley Station\nIkehaven, CT 92002','deleted','2019-01-22 04:39:48','1997-08-20 09:31:54'),
('60','Woman','1994-08-19',NULL,'8620 Green Plain\nWest Ciceroville, HI 58380-6107','deleted','2015-01-07 03:40:24','1976-09-14 09:28:26'),
('63','Man','2007-10-16',NULL,'43430 Malvina Parks Suite 086\nEast Lorainestad, WI 81106','active','1976-04-29 20:11:31','2003-11-09 07:24:59'),
('64','Woman','1994-06-30',NULL,'6241 Rippin Ramp\nEast Floydchester, VA 84053','registred','1999-02-22 07:02:39','1983-06-19 02:28:12'),
('67','Woman','2012-03-15',NULL,'2658 Camila Ramp\nPort Brayanland, NJ 42729-5936','deleted','1975-01-04 01:09:49','1972-05-25 00:39:01'),
('69','Woman','1997-03-21',NULL,'2176 Schmidt Burgs Apt. 347\nHayleemouth, AR 79895-8040','active','2006-04-30 16:59:05','2002-11-13 21:57:51'),
('71','Woman','1975-08-16',NULL,'4585 Mante Mountains\nLake Salvatore, VA 57489-2262','registred','1994-12-07 17:15:14','2006-06-26 16:07:35'),
('72','Woman','2002-12-28',NULL,'654 Wolf Bypass\nPort Loy, DE 31162-1920','registred','1983-07-11 11:36:07','1982-11-30 16:37:11'),
('73','Man','1992-07-03',NULL,'6744 Mona Summit\nSouth Anikaburgh, RI 35669','deleted','2002-07-27 04:11:49','2019-07-20 11:49:17'),
('74','Woman','2015-06-16',NULL,'862 Mona Union Suite 507\nDickensberg, VA 20952-4466','active','2014-10-24 07:03:00','2008-01-17 05:42:46'),
('76','Man','2017-11-04',NULL,'526 Anahi Wall\nKundeburgh, NJ 03894-8092','registred','1980-05-26 14:40:54','1988-04-05 22:40:23'),
('77','Man','2002-09-30',NULL,'0331 Stokes Mountains\nSchuppeton, TX 72327-8262','registred','2011-01-30 09:18:59','2010-11-21 23:40:50'),
('79','Woman','2002-12-25',NULL,'01648 Kris Alley Suite 279\nSouth Domenick, VA 79858','deleted','1996-12-18 14:47:00','1981-05-01 04:35:51'),
('80','Woman','1984-03-13',NULL,'58393 Koss Ways\nNew Theoberg, CT 74885-0864','deleted','1981-11-29 05:11:28','1970-10-26 20:06:57'); 


-- 3 создание сущности верхнего уровня Рубрики

DROP TABLE IF EXISTS rubrics;
CREATE TABLE rubrics( 
		id SERIAL PRIMARY KEY,
		name_catalog VARCHAR(255) COMMENT 'Название раздела'
		
) COMMENT = 'Разделы интернет-магазина' ;

INSERT INTO rubrics VALUES (NULL,'Оружие'),
(NULL,'Патроны'),
(NULL,'Ножи'),
(NULL,'Оптика');


-- 4 создание таблицы нижнего уровня иерархии каталога - catalogs

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL primary KEY ,
	name VARCHAR(255) NOT NULL COMMENT 'Название каталога',
	rubric_id BIGINT UNSIGNED NOT NULL,
	
	INDEX cat_idx (rubric_id),
	FOREIGN KEY (rubric_id) REFERENCES rubrics(id)
 		ON UPDATE CASCADE 		
	   	ON DELETE RESTRICT 
)COMMENT = 'Каталоги';

INSERT INTO catalogs VALUES (NULL,'Нарезное оружие', '1'),
(NULL,'Гладкоствольное оружие', '1'),
(NULL,'Пневматическое оружие', '1'),
(NULL,'Прицелы', '4'),
(NULL,'Бинокли', '4'),
(NULL,'Для нарезного оружия','2'),
(NULL,'Для гладкоствольного оружия', '2'),
(NULL,'Холодное оружие', '3'),
(NULL,'Хозяйственные ножы', '3'),
(NULL,'Авторские ножы', '3');


-- 5 создание таблицы нижнего уровня иерархии каталога - subdirectories 

DROP TABLE IF EXISTS subdirectories;
CREATE TABLE subdirectories (
	id SERIAL PRIMARY KEY ,
	name VARCHAR(25) NOT NULL COMMENT 'Название подкаталога',
	cat_id BIGINT UNSIGNED NOT NULL,
	
 	INDEX in_subdes_cat_idx (cat_id),
	FOREIGN KEY (cat_id) REFERENCES catalogs(id)
 		ON UPDATE CASCADE 		
	   	ON DELETE RESTRICT 
) COMMENT = 'Подкаталоги';

INSERT INTO subdirectories VALUES (NULL,'Оптические прицелы', '4'),
(NULL,'Коллиматорные прицелы', '4'),
(NULL,'Пневматические винтовки', '3'),
(NULL,'Пневматические пистолеты', '3');


-- 6 создаем сущность Продукты с описанием

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	cat_id BIGINT UNSIGNED NOT NULL,
	subdir_id BIGINT UNSIGNED DEFAULT NULL,
	name VARCHAR(255) NOT NULL COMMENT 'Название продукта',
	description VARCHAR(255) COMMENT 'Описание продукта', 
	created DATETIME DEFAULT NOW() COMMENT 'Дата создания строки продукта',
	
	INDEX item_subcat_idx (subdir_id),
	INDEX item_name_idx (name),
	FOREIGN KEY (cat_id) REFERENCES catalogs(id),	
	FOREIGN KEY (subdir_id) REFERENCES subdirectories(id)
		ON UPDATE CASCADE 		
    	ON DELETE RESTRICT
)COMMENT 'Продукты';

INSERT INTO products VALUES (NULL,'1', NULL, 'Beretta CX4 Storm 9mm Para', 'Карабин Berretta CX4 Storm - первенец новой линейки X4 Storm', NOW()),
(NULL,'1', NULL, 'Browning Bar .9.3x62 MK3 Composite', 'Новое поколение Browning BAR MK3 вдохнуло новую жизнь в семейство знаменитых полуавтоматических карабинов BAR',NOW()),
(NULL,'2', NULL, 'Benelli Ethos Sport 12/76, 76', 'Калибр 12', NOW()),
(NULL,'2', NULL, 'Armsan P612 12/76 71 MC Camo Realtree Max4', 'Калибр 12', NOW()),
(NULL,'3', '3', 'Ultra-C M2 716/RB (SL) 3J Cal. 6,35 винтовка', '',NOW()),
(NULL,'3', '3', 'FX Monsoon Walnut Suntec редукт к.4.5 мм', '',NOW()),
(NULL,'3', '4', 'Stoeger XP4 GREEN к.4.5 мм', 'Начальная скорость пули (шарики ВВ): 130 м/с',NOW()),
(NULL,'3', '4', 'Diana Raptor 4" к.4.5 мм', 'Начальная скорость пули (шарики ВВ): 105 м/с',NOW()),
(NULL,'4', '1', 'Yukon Jaeger 1-4x24 (с меткой T01i)', 'Лёгĸий и ĸoмпaĸтный пpицeл',NOW()),
(NULL,'4', '1', 'Swarovski dS 5-25x52* ш SR 4A-I', 'Лёгĸий и ĸoмпaĸтный пpицeл',NOW()),
(NULL,'4', '2', 'Коллиматорный прицел Kahles Helia RD Picatinny', 'KAHLES представляет коллиматорный прицел для загонной охоты',NOW()),
(NULL,'4', '2', 'Оптический прибор ХПС3-0', 'Компактный голографический коллиматор компании L-3 EOTech',NOW()),
(NULL,'5', NULL, 'Бинокль Swarovski SLC 10x42 W B', 'Страна АВСТРИЯ',NOW()),
(NULL,'6', NULL, '.338 LapuaM Norma 19.5 Sierra HPBT', 'Охотничьи патроны',NOW()),
(NULL,'6', NULL, '.308W Geco 11.0 SP', 'Охотничьи патроны',NOW()),
(NULL,'7', NULL, 'Clever 12 дробь 7 Ferma Beccaccia 36 gr', 'Охотничьи патроны',NOW()),
(NULL,'7', NULL, '12 СКМ пуля 28 гр Гуаланди', 'Охотничьи патроны',NOW()),
(NULL,'7', NULL, '12 СКМ дробь 000 46 гр Магнум', 'Охотничьи патроны',NOW()),
(NULL,'8', NULL, 'КЗ Нож Медведь', '',NOW()),
(NULL,'8', NULL, 'КЗ Нож Алабай', '',NOW());


-- 7 создаем сущность корзина, у каждого пользователя будет своя корзина.

DROP TABLE IF EXISTS baskets;
CREATE TABLE IF NOT EXISTS baskets(
	id SERIAL PRIMARY KEY, 
    user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'Корзина';

INSERT INTO `baskets` VALUES ('1','41','1987-05-16 08:52:36','2014-06-24 20:19:04'),
('2','42','2018-06-28 00:48:30','1994-03-13 07:08:41'),
('3','43','2001-01-02 08:59:35','1972-12-01 01:39:15'),
('4','44','2007-07-17 01:35:16','1984-12-26 14:28:27'),
('5','45','2019-05-01 14:14:05','1988-08-25 21:18:29'),
('6','46','1976-04-13 23:11:09','2011-09-14 23:07:34'),
('7','49','1977-04-22 16:06:05','1975-02-07 10:39:05'),
('8','50','2014-11-28 17:45:43','2017-12-29 02:03:30'),
('9','51','1993-09-30 08:05:08','1983-07-12 21:20:13'),
('10','54','1980-09-11 07:21:08','2000-07-03 16:55:58'),
('11','56','1996-08-27 01:33:08','1987-10-31 01:58:09'),
('12','58','1994-03-18 07:50:02','1994-07-07 12:20:14'),
('13','60','1971-02-01 01:54:27','1993-05-12 09:30:37'),
('14','63','2008-06-15 23:17:30','1972-12-12 14:42:25'),
('15','64','1992-09-20 17:35:13','1973-01-08 15:31:13'),
('16','67','1996-03-22 05:34:18','1995-07-31 09:06:52'),
('17','69','2000-08-06 16:46:04','1977-01-02 08:39:54'),
('18','71','2014-01-04 05:54:36','2004-08-16 16:11:07'),
('19','72','2003-01-26 05:22:00','1988-09-23 10:53:08'),
('20','73','1999-03-26 02:16:58','2016-01-08 16:13:40'),
('21','74','2011-11-06 19:41:48','2010-08-16 17:14:09'),
('22','76','1991-03-21 05:56:03','2010-10-09 04:08:25'),
('23','77','1993-06-04 16:09:20','2008-04-11 03:23:36'),
('24','79','1996-01-15 03:23:05','1998-05-28 17:21:10'),
('25','80','1996-05-06 11:51:11','1976-05-17 11:39:15'),
('26','41','1988-03-26 07:03:03','1994-03-26 19:30:22'),
('27','42','1988-08-28 20:13:19','2011-02-03 04:07:24'),
('28','43','2015-05-05 16:53:09','2010-10-14 01:49:05'),
('29','44','2002-04-28 10:34:45','2005-03-31 12:22:09'),
('30','45','2013-01-09 00:41:43','1973-01-12 02:01:15'),
('31','46','1996-05-27 13:45:43','1982-08-20 10:38:27'),
('32','49','1986-09-23 04:00:06','1976-06-25 09:41:08'),
('33','50','2011-01-22 08:24:11','1995-04-10 00:56:38'),
('34','51','2019-06-02 23:31:06','2017-03-20 19:28:52'),
('35','54','1988-02-15 12:11:42','2015-01-22 00:16:29'),
('36','56','1988-01-16 12:48:45','1971-03-10 06:29:04'),
('37','58','1985-05-23 10:36:21','2008-01-13 15:45:33'),
('38','60','2006-04-26 12:35:30','1971-07-27 22:25:52'),
('39','63','2005-09-27 12:00:24','2003-05-24 10:36:37'),
('40','64','1986-06-03 15:55:16','2011-02-22 20:27:53'); 


-- 8 создаем сущность Заказы, здесь будут храниться составы закзов пользователя.

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  basket_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  total BIGINT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
--  status_id BIGINT UNSIGNED,
  status ENUM ('framed', 'paid', 'delivery','complated','canceled') COMMENT 'Виды статусов по категориям',
  /*Статусы:
	 * 'framed'- заказ оформлен
	 * 'paid' - заказ оплачен
	 * 'delivery' - доставка заказа
	 * 'complated' - заказ выполнен
	 * 'canceled' - заказ отменен
	 */
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (basket_id) REFERENCES baskets(id)
--  FOREIGN KEY (status_id) REFERENCES statuses(id)
) COMMENT = 'Состав заказа';

INSERT INTO `orders` VALUES ('1','1','1','4','canceled','1991-11-18 23:28:03','2011-08-03 01:10:44'),
('2','2','2','5','complated','1970-12-24 19:12:12','1980-08-20 17:05:02'),
('3','3','3','5','canceled','2012-01-08 00:10:42','2006-03-30 07:46:55'),
('4','4','4','7','delivery','2000-12-12 14:05:17','1984-06-01 09:34:58'),
('5','5','5','7','complated','2004-11-06 03:33:03','1993-08-05 20:57:58'),
('6','6','6','4','delivery','2009-09-10 22:06:34','1974-11-12 18:34:35'),
('7','7','7','1','framed','2011-06-11 03:27:52','1978-11-23 15:09:06'),
('8','8','8','9','canceled','2003-08-19 09:42:53','2016-08-17 04:25:57'),
('9','9','9','9','paid','2010-07-10 02:53:16','1971-11-26 18:27:29'),
('10','10','10','9','canceled','1987-11-05 05:29:56','1991-07-15 21:43:41'),
('11','11','11','7','complated','1998-04-01 02:10:07','2014-12-02 08:31:15'),
('12','12','12','8','framed','1987-08-29 21:59:30','1992-09-25 09:04:49'),
('13','13','13','9','paid','1998-08-30 00:02:09','2017-04-01 05:50:53'),
('14','14','14','1','delivery','2002-09-18 16:55:40','1981-03-03 06:41:40'),
('15','15','15','3','paid','1978-08-25 06:14:24','2015-04-06 18:38:22'),
('16','16','16','7','framed','2017-09-09 07:05:21','2015-06-19 02:08:22'),
('17','17','17','9','complated','1982-12-28 23:04:27','2003-04-25 01:20:40'),
('18','18','18','0','canceled','1977-02-25 15:17:31','1976-03-23 09:43:23'),
('19','19','19','2','framed','1983-10-30 13:23:45','1973-04-25 09:29:38'),
('20','20','20','6','framed','2011-10-14 05:27:52','1991-01-02 00:55:38'); 

-- 9 создаем сущность Цены, в ней будут храниться цены на продукты

DROP TABLE IF EXISTS prises;
CREATE TABLE IF NOT EXISTS prises (
	product_id BIGINT UNSIGNED NOT NULL,
	price INT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (product_id),
	FOREIGN KEY (product_id) REFERENCES products(id),
	
	-- индексы
	INDEX prices_item_idx (product_id)
);

INSERT INTO `prises` VALUES ('1','4','1980-05-11 17:18:43','1980-06-20 04:26:03'),
('2','4','1986-09-09 02:18:05','2014-04-26 13:30:50'),
('3','1297131','1981-08-21 02:24:18','2015-05-11 15:34:14'),
('4','787033','1992-12-11 09:59:50','1979-02-25 15:34:43'),
('5','667611','1970-10-01 18:57:25','1986-07-18 21:05:29'),
('6','20080','2016-07-19 02:40:45','2009-02-20 17:37:22'),
('7','366331178','2003-05-06 04:01:11','1978-10-18 20:36:24'),
('8','6','2003-08-24 04:13:12','2014-12-22 10:31:41'),
('9','747476836','2008-11-01 03:17:39','1974-08-10 02:01:57'),
('10','153','2014-11-02 12:21:11','1987-11-13 22:08:57'),
('11','6793470','2003-07-15 14:46:09','2003-03-15 18:18:12'),
('12','80','1999-10-17 10:50:48','2018-07-24 16:55:34'),
('13','63988290','1979-05-30 16:08:07','1995-11-15 02:37:01'),
('14','272859','1983-04-16 06:46:41','1983-04-08 17:57:41'),
('15','11113007','2008-06-11 02:49:28','1977-02-11 13:51:01'),
('16','1616','1998-08-14 22:38:11','2012-06-21 22:43:46'),
('17','18723059','2009-10-04 15:55:51','2018-05-01 11:57:35'),
('18','4','2014-12-22 13:12:06','1993-08-08 09:33:21'),
('19','1','1995-06-21 11:44:09','1984-12-27 02:47:21'),
('20','13646651','2007-07-10 15:15:24','2011-12-01 21:29:08'); 


-- 10 создание сущности Скидки:

DROP TABLE IF EXISTS discounts; 
CREATE TABLE IF NOT EXISTS discounts (
		id SERIAL primary key,
		order_id BIGINT UNSIGNED NOT NULL, -- скидки предоставляются только на определенный прайслист 
		type_of_disc ENUM ('product','subdir','cat','user','all') COMMENT 'Виды скидок по категориям',
		/*type_of_disc поле:
 		* 'product' - скидка на конкретную товарную позицию
 		* 'subdir' - скидка на подкатегорию товара
 		* 'cat' - скидка на подкатегорию товара
 		* 'user' - скидка, предоставляемая конкретному пользователю
 		* 'all' - скидка "всем на все"  
 		*/
		start_date DATETIME COMMENT 'Дата начала скидок', 
		stop_date DATETIME COMMENT 'Дата окончания скидок',
		disc_value TINYINT DEFAULT 0 COMMENT 'Уровень скидок (%)', 
				
		INDEX discount_obj_idx(order_id),
		FOREIGN KEY (order_id) REFERENCES orders(id)
) COMMENT = 'Скидки';

INSERT INTO `discounts` VALUES ('1','1','product','2007-08-28 21:46:03','2007-09-07 00:23:55','1'),
('2','2','cat','2008-03-02 18:41:47','2008-04-19 19:20:03','9'); 


-- 11 создаем сущность склады, это может быть склад в магазине, а может и отдельное помещение. 

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название склада',
  address VARCHAR(255) COMMENT 'Адрес склада',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

INSERT INTO `storehouses` VALUES ('1','Молот','21464 Jake Plaza Suite 981\nWest Devonteville, AK 93480','1981-02-21 20:45:32','1996-05-24 12:53:51'),
('2','Склад основной','689 Kiehn Mountains Apt. 546\nEast Casey, SD 21384','1971-04-25 04:14:14','1970-06-16 23:14:56'); 

-- 12 создаем сущность продукты на складах

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  FOREIGN KEY (storehouse_id) REFERENCES storehouses(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
  	ON UPDATE CASCADE 		
    ON DELETE RESTRICT
  ) COMMENT = 'Продукты на складе';
 
 INSERT INTO `storehouses_products` VALUES ('1','1','1','0','1980-02-12 14:29:26','2003-01-15 11:25:06'),
('2','2','2','4','2012-08-27 08:52:41','1992-08-01 05:35:55'),
('3','1','3','6','2016-08-09 04:22:58','2001-09-01 07:09:31'),
('4','2','4','7','1976-04-22 13:32:24','2009-07-03 09:46:29'),
('5','1','5','1','1974-10-29 14:35:21','1996-06-03 01:50:49'),
('6','2','6','6','2013-02-20 12:54:54','1984-05-18 09:44:34'),
('7','1','7','4','1989-07-31 07:32:52','1987-06-17 04:15:26'),
('8','2','8','8','2001-02-25 10:20:20','2014-09-22 00:55:32'),
('9','1','9','5','1995-08-14 18:46:16','1985-05-30 01:20:01'),
('10','2','10','0','1992-09-05 15:42:15','2007-04-07 06:47:24'),
('11','1','11','0','2019-01-05 21:20:54','2013-09-05 20:00:09'),
('12','2','12','1','2003-07-08 17:07:33','2008-05-08 21:33:25'),
('13','1','13','5','1979-01-03 17:32:56','1977-04-23 13:25:03'),
('14','2','14','4','2012-04-25 20:46:40','1976-10-23 10:22:18'),
('15','1','15','5','2004-03-04 09:58:17','2004-04-16 14:29:14'),
('16','2','16','4','1987-12-04 00:49:11','1971-04-29 16:58:53'),
('17','1','17','7','1978-11-25 23:20:40','1976-09-06 00:37:48'),
('18','2','18','6','1989-05-17 07:44:26','1978-09-03 18:33:47'),
('19','1','19','7','2008-08-30 01:27:12','2013-06-13 12:43:17'),
('20','2','20','9','1971-05-12 14:03:25','1994-03-24 10:22:38'); 


-- 13 создаем сущность Фотографии для хранения фотографий продуктов. 

DROP TABLE IF EXISTS photos;
CREATE TABLE photos(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) COMMENT 'Название фото',
	
	FOREIGN KEY (id) REFERENCES products(id)
)COMMENT = 'Фотографии';

INSERT INTO `photos` VALUES ('1','id'),
('2','autem'),
('3','quo'),
('4','dolorum'),
('5','in'),
('6','suscipit'),
('7','reprehenderit'),
('8','qui'),
('9','pariatur'),
('10','assumenda'),
('11','ab'),
('12','cumque'),
('13','vitae'),
('14','blanditiis'),
('15','est'),
('16','et'),
('17','doloremque'),
('18','sunt'),
('19','voluptates'),
('20','unde'); 

-- 14 создаем сущность Отзывы покупателей. 

DROP TABLE IF EXISTS user_review;
CREATE TABLE IF NOT EXISTS user_review(
		user_id BIGINT UNSIGNED NOT NULL,
		product_id BIGINT UNSIGNED NOT NULL,
		text_of_review TEXT,
		
		PRIMARY KEY (user_id, product_id),
		FOREIGN KEY (user_id) REFERENCES users(id),
	    FOREIGN KEY (product_id) REFERENCES products(id),
		
		INDEX ref_user_idx(user_id),
		INDEX ref_item_idx(product_id)		
)COMMENT = 'Отзывы';

INSERT INTO `user_review` VALUES ('41','1','Voluptatum error facere eum id.'),
('42','2','Dolore consequatur tempora et placeat omnis.'),
('43','3','Voluptas at sequi tempore neque cum eaque unde.'),
('44','4','Est voluptate ea est explicabo.'),
('45','5','Similique neque ipsa ratione exercitationem est.'),
('46','6','Recusandae omnis architecto adipisci.'),
('49','7','Maxime error sit ab impedit distinctio laudantium cupiditate.'),
('50','8','Mollitia perferendis totam repellendus voluptates enim aut voluptatum.'),
('51','9','Vitae ipsam cum quia quam harum facere.'),
('54','10','Enim nulla unde tempora sed deserunt et.'); 

-- 15 создаем сущность Likes от покупателей.

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	user_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    PRIMARY KEY (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO `likes` VALUES ('41','1','2001-04-05 10:44:25'),
('42','2','1978-02-28 07:43:15'),
('43','1','1978-02-23 05:57:01'),
('44','4','2004-09-21 10:28:13'),
('45','1','1987-12-06 14:16:55'),
('46','6','1991-03-18 22:03:26'),
('49','1','1984-08-29 17:54:04'),
('50','8','1989-11-30 22:58:06'),
('51','2','1972-04-13 03:14:54'),
('54','10','2015-05-10 13:16:49'); 