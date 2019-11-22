DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия', -- COMMENT на случай, если имя неочевидное
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    INDEX users_phone_idx(phone), -- как выбирать индексы?
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

INSERT INTO `users` VALUES ('1','Adriel','Botsford','nwillms@example.com','33'),
('2','Geraldine','Bahringer','libbie02@example.com','69'),
('3','Alysha','Hickle','ivy.altenwerth@example.net','0'),
('4','Al','Kling','huel.kacie@example.org','1'),
('5','Cade','Cassin','mckayla07@example.org','636'),
('6','Joelle','Wolff','moriah48@example.net','2982104781'),
('7','Johanna','Gottlieb','joany.willms@example.com','1'),
('8','Domenick','Leannon','jacey.tromp@example.org','1'),
('9','Jaylon','Schmidt','ali91@example.org','1'),
('10','Irma','Terry','bill.kutch@example.com','0'),
('11','Janelle','Mohr','deichmann@example.net','0'),
('12','Enid','Herzog','rosella34@example.org','0'),
('13','Hilda','Aufderhar','curt58@example.com','345723'),
('14','Miracle','Rowe','violette.weissnat@example.net','156115'),
('15','Mustafa','Erdman','mkeebler@example.org','162718'),
('16','Evangeline','Goldner','issac34@example.net','0'),
('17','Yvette','Fadel','mitchell.alysson@example.com','0'),
('18','Jazmyn','Lindgren','langworth.ned@example.org','652608'),
('19','Roxanne','McCullough','glangworth@example.com','776331'),
('20','Arne','Grady','floy.walsh@example.com','0'),
('21','Marcella','Jakubowski','kayley.koelpin@example.org','0'),
('22','Rubie','Towne','strosin.wanda@example.com','0'),
('23','Mose','Cormier','shaina61@example.net','0'),
('24','Austyn','Kiehn','lbrakus@example.org','0'),
('25','Hans','Hilpert','dessie.walker@example.org','1'),
('26','Mason','Torp','khettinger@example.org','6285693531'),
('27','Luisa','Windler','volkman.myles@example.com','1'),
('28','Regan','Connelly','marcelina35@example.net','0'),
('29','Terry','O\'Keefe','jacinthe.beier@example.com','1'),
('30','Kole','Stehr','wleannon@example.net','355755'),
('31','Virginie','O\'Hara','mboyle@example.net','1'),
('32','Mose','Becker','itzel90@example.com','301'),
('33','Kitty','Collins','upton.dax@example.org','710128'),
('34','Kaylin','Strosin','letitia.hartmann@example.org','725'),
('35','Maxwell','Kirlin','auer.zion@example.com','1'),
('36','Lenny','Grimes','lea.hettinger@example.net','318120'),
('37','Katelin','O\'Reilly','feil.glennie@example.com','744'),
('38','Sherwood','Marvin','xharvey@example.com','0'),
('39','Tiara','Pfeffer','schmeler.peyton@example.com','1'),
('40','Mable','Stanton','larkin.zechariah@example.com','0'),
('41','Abdiel','Block','iwisoky@example.net','1'),
('42','Mitchell','Lockman','hermina.treutel@example.com','389942'),
('43','Jamil','Pfeffer','darian25@example.com','23'),
('44','Ludie','Ziemann','joe.harber@example.net','426578'),
('45','Bertrand','Gislason','qwiza@example.com','414'),
('46','Gene','Schuster','laurianne94@example.org','692'),
('47','Theron','Schimmel','donavon33@example.net','0'),
('48','Jailyn','Abbott','aroob@example.org','0'),
('49','Leola','Schimmel','torp.sven@example.org','0'),
('50','Jamal','Zboncak','mitchell35@example.net','6991226533'); 


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
    is_active CHAR(1) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) -- что за зверь в целом?
       	ON UPDATE CASCADE -- как это работает? Какие варианты?
    	ON DELETE restrict -- как это работает? Какие варианты?
    -- , FOREIGN KEY (photo_id) REFERENCES media(id) -- пока рано, т.к. таблицы media еще нет
);

INSERT INTO `profiles` VALUES ('1','M','1972-11-09','1','2013-10-24 12:27:34','South Guymouth',NULL),
('2','D','1979-05-16','2','2002-07-28 06:13:28','Port Gretchenshire',NULL),
('3','D','1990-04-06','3','1982-09-09 06:30:11','Boydberg',NULL),
('4','P','1983-01-08','4','1996-12-10 09:15:37','North Olafstad',NULL),
('5','M','1981-07-10','5','1984-02-02 22:20:07','North Eliseoburgh',NULL),
('6','D','2001-12-24','6','2001-12-03 00:57:28','East Anibal',NULL),
('7','M','2011-11-05','7','1977-01-06 00:02:04','Port Pamelachester',NULL),
('8','P','2001-08-07','8','1994-05-04 18:49:05','Port Johnny',NULL),
('9','M','2007-12-27','9','1976-10-15 00:49:06','West Corene',NULL),
('10','D','1986-09-23','10','1971-07-11 18:17:51','Elishaberg',NULL),
('11','M','1980-05-21','11','1991-03-07 17:32:20','East Omaribury',NULL),
('12','M','2007-05-16','12','1983-12-04 20:13:01','South Darwinchester',NULL),
('13','P','2012-09-17','13','1999-04-04 08:54:56','Howeland',NULL),
('14','P','1985-03-19','14','1987-10-20 01:41:53','East Okeyhaven',NULL),
('15','M','2008-07-21','15','2007-10-13 04:27:38','West Ilastad',NULL),
('16','M','1998-04-20','16','1982-07-15 21:55:15','Beckermouth',NULL),
('17','D','2004-07-19','17','2018-06-18 11:23:27','East Aurelie',NULL),
('18','D','2016-01-09','18','1993-09-29 16:53:10','Jameyside',NULL),
('19','M','1972-03-09','19','1983-01-15 01:00:05','East Leobury',NULL),
('20','D','1998-07-06','20','1979-09-15 15:59:36','West Rudolphchester',NULL),
('21','D','2011-10-12','21','2001-05-14 22:13:13','East Alysa',NULL),
('22','D','1979-11-25','22','1987-02-17 01:53:25','South Rosemariehaven',NULL),
('23','M','2018-03-08','23','1983-10-20 21:58:12','Ryanbury',NULL),
('24','D','2011-11-20','24','2016-01-13 04:46:48','North Grayson',NULL),
('25','D','1992-06-26','25','1985-12-24 14:02:17','Prohaskahaven',NULL),
('26','P','1988-03-14','26','2010-12-02 04:00:06','O\'Connerhaven',NULL),
('27','M','2009-03-29','27','1978-08-27 20:45:06','South Ross',NULL),
('28','D','1982-05-22','28','2004-07-30 02:38:37','Crooksmouth',NULL),
('29','P','1982-04-15','29','1976-03-02 20:30:06','East Guillermo',NULL),
('30','P','2009-04-24','30','1980-03-14 14:06:42','Trevorfort',NULL),
('31','P','1996-03-13','31','1997-04-24 01:25:40','Lake Emmett',NULL),
('32','M','1987-04-09','32','2014-02-04 10:01:26','Schmittberg',NULL),
('33','M','2002-12-31','33','1991-06-27 09:27:11','Zanderberg',NULL),
('34','M','2008-09-30','34','2003-04-17 02:09:31','Elissastad',NULL),
('35','M','2001-08-15','35','2015-01-19 17:55:13','Port Minamouth',NULL),
('36','D','2002-06-26','36','2017-04-15 22:59:33','Roscoefort',NULL),
('37','P','2015-05-01','37','2019-03-29 09:04:05','New Elzaside',NULL),
('38','P','1999-07-16','38','1999-11-11 07:33:56','Houstonville',NULL),
('39','M','1972-12-17','39','1994-02-17 08:24:38','North Richmondfurt',NULL),
('40','P','1984-04-01','40','2012-05-18 21:09:00','Cronahaven',NULL),
('41','M','1994-07-03','41','2010-09-23 15:02:07','East Josh',NULL),
('42','M','1991-06-25','42','1972-07-14 21:47:38','Sterlingland',NULL),
('43','D','1991-05-28','43','1996-01-28 12:49:20','Port Santiagoton',NULL),
('44','P','2012-04-23','44','2008-08-12 12:01:44','Henrishire',NULL),
('45','P','2000-12-23','45','1992-03-14 17:59:32','Braulioview',NULL),
('46','M','1973-12-27','46','1970-03-31 22:21:02','Port Dakotaland',NULL),
('47','M','1976-07-29','47','2014-09-30 09:59:44','North Maria',NULL),
('48','M','1991-01-28','48','1977-11-03 09:30:17','Jonesburgh',NULL),
('49','M','1970-09-19','49','1971-02-18 17:36:39','Starkfort',NULL),
('50','M','2007-03-01','50','1996-08-05 12:12:01','East Newtonfort',NULL); 


DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке
    INDEX messages_from_user_id (from_user_id),
    INDEX messages_to_user_id (to_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

INSERT INTO `messages` VALUES ('1','1','2','Repellat quasi praesentium aut ea quibusdam fugiat.','1995-10-29 11:28:36'),
('2','2','3','Laboriosam veniam architecto eaque aut ratione sapiente.','1997-06-28 03:31:20'),
('3','3','4','Alias maiores quam labore ut voluptatum ea quo.','2009-11-27 04:07:15'),
('4','4','5','Deserunt delectus facilis vitae.','2014-05-29 08:42:52'),
('5','5','6','Aut minima quidem repellendus.','2007-11-13 21:57:26'),
('6','6','7','Officia id suscipit facilis fuga.','2000-04-18 12:30:33'),
('7','7','8','Voluptatem molestiae consequatur fugiat et qui.','2008-12-01 17:22:19'),
('8','8','9','Cum voluptatem cumque eum corporis.','1987-04-06 00:44:35'),
('9','9','10','At et est blanditiis dolorum maiores voluptas.','2018-04-24 14:27:19'),
('10','10','11','Eos nam velit sunt voluptas qui beatae amet.','1980-01-03 05:18:46'),
('11','11','12','Amet est labore dolor quis eius necessitatibus dolorem.','1983-02-10 09:04:51'),
('12','12','13','Consequatur temporibus sed officiis ut sed et nobis.','2000-12-28 16:29:21'),
('13','13','14','Reprehenderit cupiditate iusto porro quis tempora soluta.','2002-11-03 12:02:10'),
('14','14','15','Est assumenda hic delectus recusandae in quod.','1981-03-28 04:34:03'),
('15','15','16','Aliquid sunt est quo ut.','1971-11-25 21:35:13'),
('16','16','17','Voluptatem illo molestiae cum labore.','1992-12-01 09:32:17'),
('17','17','18','Laboriosam aliquid laborum quam est et consequuntur.','1972-03-25 13:09:44'),
('18','18','19','Maiores corporis ea quibusdam et magni.','1997-08-07 07:14:06'),
('19','19','20','Et mollitia a culpa rem sint.','2019-05-14 02:31:35'),
('20','20','1','Earum ut aut error.','1974-03-18 15:14:59'); 


DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	-- id SERIAL PRIMARY KEY, -- изменили на композитный ключ (initiator_user_id, target_user_id)
	initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    -- `status` TINYINT UNSIGNED,
    `status` ENUM('requested', 'approved', 'unfriended', 'declined'),
    -- `status` TINYINT UNSIGNED, -- в этом случае в коде хранили бы цифирный enum (0, 1, 2, 3...)
	requested_at DATETIME DEFAULT NOW(),
	confirmed_at DATETIME,
	
    PRIMARY KEY (initiator_user_id, target_user_id),
	INDEX (initiator_user_id), -- потому что обычно будем искать друзей конкретного пользователя
    INDEX (target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id)
);

INSERT INTO `friend_requests` VALUES ('1','3','unfriended','1990-09-15 06:10:04','1973-07-29 15:56:24'),
('2','1','approved','2010-08-16 01:10:10','1979-04-18 00:28:38'),
('3','5','unfriended','2019-10-10 02:34:16','1999-07-17 00:50:18'),
('4','2','declined','1993-02-08 21:30:50','1998-09-30 09:08:26'),
('5','3','declined','2003-07-12 02:09:25','1994-09-25 06:28:56'),
('6','5','unfriended','2006-01-21 04:49:16','1999-07-08 11:53:43'),
('7','8','approved','1986-10-21 13:31:08','1993-05-08 12:56:35'),
('8','9','requested','2003-01-27 22:34:38','2010-01-21 17:01:52'),
('9','10','unfriended','1975-12-31 17:37:31','1980-04-05 22:32:32'),
('10','11','approved','1981-12-25 17:03:16','2011-05-20 00:51:14'),
('11','12','requested','2015-01-28 12:37:05','2012-07-28 22:21:08'),
('12','13','declined','2015-11-09 07:51:39','1981-04-19 11:46:38'),
('13','14','declined','1978-03-15 14:54:14','1983-08-14 18:03:40'),
('14','15','unfriended','2015-09-21 09:11:13','2006-07-18 11:56:35'),
('15','16','unfriended','1990-06-26 05:26:51','1982-05-09 11:26:43'),
('16','17','unfriended','2001-05-30 23:49:57','1980-07-17 00:50:22'),
('17','18','declined','1998-02-09 09:00:54','1977-03-14 08:22:20'),
('18','19','requested','1973-08-20 15:51:57','2010-05-27 20:56:33'),
('19','20','declined','1986-07-31 12:28:44','2011-11-25 02:25:04'),
('20','6','requested','1970-10-31 02:32:25','1995-02-09 22:16:23'); 

DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),

	INDEX communities_name_idx(name)
);

INSERT INTO `communities` VALUES ('15','Automated impactful core'),
('16','Balanced even-keeled paradigm'),
('2','Cloned logistical matrices'),
('6','Cross-group context-sensitive knowledgebase'),
('8','Customer-focused 5thgeneration middleware'),
('5','Front-line holistic utilisation'),
('4','Fully-configurable maximized forecast'),
('9','Horizontal modular localareanetwork'),
('13','Persevering static focusgroup'),
('14','Polarised bifurcated conglomeration'),
('17','Polarised optimizing success'),
('19','Pre-emptive systemic functionalities'),
('10','Progressive exuding structure'),
('12','Re-contextualized content-based standardization'),
('18','Re-engineered user-facing conglomeration'),
('11','Synergistic cohesive emulation'),
('3','Universal hybrid archive'),
('7','Up-sized encompassing localareanetwork'),
('20','User-friendly systematic array'),
('1','Visionary modular knowledgebase'); 

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, community_id), -- чтобы не было 2 записей о пользователе и сообществе
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);

INSERT INTO `users_communities` VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20'),
('21','1'),
('22','2'),
('23','3'),
('24','4'),
('25','5'),
('26','6'),
('27','7'),
('28','8'),
('29','9'),
('30','10'),
('31','11'),
('32','12'),
('33','13'),
('34','14'),
('35','15'),
('36','16'),
('37','17'),
('38','18'),
('39','19'),
('40','20'),
('41','1'),
('42','2'),
('43','3'),
('44','4'),
('45','5'),
('46','6'),
('47','7'),
('48','8'),
('49','9'),
('50','10'); 


DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

    -- записей мало, поэтому индекс будет лишним (замедлит работу)!
);

INSERT INTO `media_types` VALUES ('1','quo','1983-06-04 23:41:51','2005-05-09 18:27:52'),
('2','atque','1998-09-25 14:29:46','1983-11-12 15:57:27'),
('3','minus','1972-12-04 15:25:51','1995-04-16 17:52:00'),
('4','sed','1997-04-17 03:13:56','1981-03-19 17:16:56'); 

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
  	body text,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

INSERT INTO `media` VALUES ('1','1','1','Nesciunt fugiat ex at dolor. Nam expedita voluptas quia ea omnis sed.','corrupti','486775846',NULL,'1980-01-02 21:03:39','2009-07-31 17:51:04'),
('2','2','2','Quis repudiandae molestiae nihil quidem. Alias quia quaerat aut dolorem sequi odio a voluptates.','aut','1',NULL,'1976-08-16 09:52:05','1994-05-24 22:59:47'),
('3','3','3','Quia tempora quis modi optio. Et omnis quaerat sed odit mollitia facere. Rerum accusantium laboriosam illum velit nostrum et aut.','eos','9297',NULL,'1974-01-17 23:20:37','1982-06-03 02:31:42'),
('4','4','4','Itaque facere ut qui itaque omnis. Possimus cumque beatae quis laudantium quibusdam velit nemo. Repellendus autem aut numquam non.','corrupti','4',NULL,'1987-09-19 11:03:47','1977-03-17 19:25:23'),
('5','1','5','Fuga amet illum vitae est eius. Voluptates voluptatum eveniet itaque sed.','omnis','483162471',NULL,'1976-02-09 01:04:48','1982-04-06 17:08:24'),
('6','2','6','Nulla qui voluptatem cumque dignissimos labore aut qui. Sapiente vitae reprehenderit sed harum debitis aperiam. Praesentium et doloremque voluptas facilis. Et molestiae quisquam explicabo minima dolorum voluptatem.','id','4',NULL,'1991-05-15 02:42:38','1998-08-22 07:43:57'),
('7','3','7','Qui quas enim ipsam ut expedita atque. Ex ullam culpa numquam officiis. Omnis repellat laborum enim in commodi quo ex.','et','77685150',NULL,'2013-09-05 19:42:28','2016-10-22 07:58:16'),
('8','4','8','Possimus et voluptatem ab quas. Fugiat et temporibus quos aperiam porro.','nesciunt','7882',NULL,'2013-08-13 04:40:04','2006-03-31 05:42:09'),
('9','1','9','Aperiam et sit at expedita. Nulla voluptatem reprehenderit molestiae eum optio qui cumque. Mollitia sunt consequatur amet porro aut quis. Blanditiis est cumque ut molestias dolorem quam sed similique.','aspernatur','7',NULL,'1983-03-12 05:21:02','1998-02-22 09:48:46'),
('10','2','10','Quod qui adipisci id nisi. Dolorem tempore ullam enim velit. Architecto autem enim sapiente iusto ad voluptatem. Quasi praesentium hic fugiat facilis molestias.','doloremque','18020397',NULL,'1976-07-15 00:32:44','1986-04-14 23:16:36'),
('11','3','11','Fuga doloribus molestiae cum veritatis. Est autem enim exercitationem. Itaque doloremque ut qui sed rerum mollitia.','eaque','748520932',NULL,'1998-01-18 08:17:58','2013-09-26 15:32:39'),
('12','4','12','Ipsam et qui sint sit quibusdam beatae. Molestiae fuga sint hic soluta a consequuntur. Voluptatem vel natus consectetur rerum est nihil placeat.','et','163744982',NULL,'1994-02-24 01:49:54','2008-03-24 19:22:43'),
('13','1','13','Numquam tenetur excepturi neque. Est natus vel praesentium aut. Eius fuga quod adipisci hic est. Hic ut rerum vel cupiditate.','dolore','105',NULL,'1988-05-06 00:47:26','2017-08-26 17:04:03'),
('14','2','14','Dolore accusamus quis in neque autem. Quis voluptatem debitis quo quis consequatur mollitia.','labore','3106',NULL,'1985-11-08 13:51:02','2017-06-13 11:18:24'),
('15','3','15','Praesentium autem culpa sunt modi asperiores. Eum dolor assumenda voluptatem aperiam aut sed. Tempora non repudiandae eius harum est earum sit.','est','735',NULL,'1970-08-09 02:34:20','2013-12-25 19:08:42'),
('16','4','16','Fugit est magni magnam dignissimos laboriosam. Sed eum similique esse at commodi.','qui','81606',NULL,'1988-03-10 10:01:58','2016-01-03 11:21:29'),
('17','1','17','Et tempora unde magnam incidunt. Dolor dolores magnam fugit quo. Doloribus ex ipsa qui ut. Itaque quia illum aut voluptas. Omnis quos velit eos libero ea nulla dolores.','id','9',NULL,'2001-11-25 12:02:24','1988-12-08 16:52:13'),
('18','2','18','Earum dolorem qui libero dolore. Aut quaerat molestias omnis ullam. Nostrum repellendus fugit sit enim et voluptate et est. Fugiat necessitatibus sint fugit cum dicta aut.','tempore','0',NULL,'1980-09-13 09:49:44','1999-02-08 08:51:05'),
('19','3','19','At ut voluptates eum facilis velit iste. Nihil id quas quis voluptas. Eaque architecto voluptatibus quia expedita est.','veritatis','8172927',NULL,'2018-12-08 11:40:28','2006-08-31 11:16:58'),
('20','4','20','Assumenda rerum ipsa qui sed illum. Optio ex omnis dolorem eaque quidem repudiandae fugiat a. Incidunt officia quod quos repellat aut.','aspernatur','70743261',NULL,'1981-06-13 22:16:59','1983-01-04 15:51:58'),
('21','1','21','Velit et expedita porro. Deleniti et quo enim quidem ex consequuntur doloremque. Incidunt dicta perspiciatis voluptatibus quisquam non voluptatum repellendus tenetur. Enim voluptatum nihil qui voluptatum ullam. Qui animi porro eos est ad nihil qui aut.','odit','3024',NULL,'1975-11-21 09:29:14','1979-09-29 13:17:31'),
('22','2','22','Quae voluptas voluptatem ab porro rerum id. Facere eaque pariatur soluta debitis. Aut sapiente numquam accusantium ut non.','officia','274',NULL,'1993-07-26 03:49:46','1992-04-29 19:45:53'),
('23','3','23','Nisi dolor velit at velit. Voluptas sunt explicabo dolores non et. Ea molestias et officiis voluptas. Iusto dicta non accusamus et quidem aut.','sunt','9486',NULL,'1980-08-12 01:29:30','1986-02-17 15:57:15'),
('24','4','24','Quas blanditiis est culpa earum dolor. Aut recusandae error ut deleniti animi aliquam commodi consectetur. Optio at quasi harum provident autem nam.','voluptatem','664535',NULL,'1999-05-19 16:27:44','1970-06-13 11:26:05'),
('25','1','25','Eos sint et distinctio sit id. Laborum a corporis enim amet. Dolor sit sint alias consequatur.','minus','140934417',NULL,'2009-06-06 19:40:38','2004-10-01 00:34:28'),
('26','2','26','Reiciendis dicta expedita impedit autem minima exercitationem. At non enim nobis sint ipsam non reprehenderit. Recusandae sed quia debitis eum nam. Pariatur dolor error esse incidunt inventore esse incidunt rerum.','omnis','494',NULL,'1980-08-06 08:52:18','2018-04-22 14:05:28'),
('27','3','27','Cum totam quidem et assumenda iste nemo laudantium aut. Dignissimos eum quam sit. Nulla amet odit blanditiis dolores nemo accusamus.','architecto','22',NULL,'1995-07-10 06:17:32','1994-02-14 10:51:21'),
('28','4','28','Rerum quia eum earum amet et aut minus exercitationem. Sequi deleniti officia in laborum illo molestiae molestiae. Culpa ducimus voluptas similique quisquam cumque. Voluptatem quidem qui sed commodi.','at','2871',NULL,'2015-08-25 02:21:26','1973-08-15 16:50:08'),
('29','1','29','Natus consequatur explicabo soluta sed. Eligendi quo dolor molestias atque non facere quam nostrum. Quia aut et id ab dolor aut.','suscipit','52',NULL,'2011-10-26 17:47:59','1984-10-09 03:45:06'),
('30','2','30','Hic eum qui saepe deserunt. Officiis voluptatem aliquam ipsa unde et.','perferendis','633904',NULL,'1972-06-27 00:27:15','1993-02-11 19:49:42'),
('31','3','31','Pariatur sed officiis quia. Inventore quia odio mollitia eveniet quis ea itaque. Fugit quis et voluptatibus maxime adipisci et qui.','veniam','29791288',NULL,'1976-10-12 15:52:13','2007-08-05 03:53:22'),
('32','4','32','Quo harum temporibus consequuntur facilis. Accusamus error tempora magnam maiores. Vitae aliquam architecto aliquam qui laborum esse blanditiis ducimus. Quos qui enim omnis aut qui officia nisi aut.','atque','5',NULL,'1975-07-04 18:13:24','2016-06-19 12:21:41'),
('33','1','33','Autem alias laborum tenetur omnis. Inventore et quis ea qui officiis architecto quia. Quae odit provident quia cupiditate temporibus. Veniam eligendi consequatur vel.','omnis','83472',NULL,'1995-04-19 21:49:30','1974-09-21 12:28:02'),
('34','2','34','Consequuntur et praesentium in occaecati assumenda ipsa occaecati. Consequuntur dolores optio et quisquam culpa repudiandae qui. Doloribus rem voluptatem est voluptate vel. Vero quia dicta eum ab ad sed sequi. Quis eligendi aut odit odit non nisi voluptas vel.','minus','411202268',NULL,'1979-10-06 00:58:56','2010-09-20 21:35:56'),
('35','3','35','Accusantium corrupti sapiente sed dolore. Fuga quae molestiae quas id tempora vel eveniet. Molestiae dolorem expedita aut iste facilis nihil aut. Modi neque consectetur sit.','velit','24977',NULL,'1972-02-23 11:49:34','1987-07-15 18:56:42'),
('36','4','36','Ut impedit esse saepe vero. Occaecati sint cum qui fugiat qui qui eveniet. Eligendi autem omnis inventore aperiam iure illo eveniet.','qui','5',NULL,'1970-04-03 13:35:04','2014-08-30 00:10:32'),
('37','1','37','Qui sapiente sequi et quisquam ea. Vel voluptatem et quaerat. A maiores nesciunt sequi adipisci eum eos. Praesentium ducimus quas sequi in nam quod unde corrupti.','eos','8',NULL,'2013-02-11 07:27:48','1973-11-21 02:43:52'),
('38','2','38','Perspiciatis ut autem cum sed. Alias at voluptatibus pariatur quia dolor sunt. Non deleniti recusandae ut sed sed. Eos quos omnis eligendi inventore deserunt asperiores sunt eos.','nostrum','7560201',NULL,'1974-05-08 23:29:13','1986-03-06 02:55:19'),
('39','3','39','Velit ipsam nobis dolores porro similique sint. Ut animi facilis quam vero eius iure consequatur et. Optio totam totam amet quibusdam quibusdam recusandae aperiam.','et','8',NULL,'1982-06-25 14:14:50','1984-08-02 13:05:28'),
('40','4','40','Facilis ea qui dolor et omnis et vel. Harum ut possimus omnis et minus quia dignissimos veniam. Quia eveniet debitis autem quae aut ut.','libero','377',NULL,'1979-07-11 04:47:18','1990-05-05 16:56:39'),
('41','1','41','Voluptatibus ea quis ut quis. Enim et dolore nesciunt voluptatum ullam voluptatem at dolorum. Labore in sit quo sint dolore voluptas. Quas necessitatibus qui consequatur possimus eligendi quia.','maxime','865457',NULL,'1991-08-20 19:06:14','2011-03-09 13:47:03'),
('42','2','42','Ut ut est ea quo et quo. Harum sint vero doloribus quia iusto rerum delectus. Modi aut libero ut id dolorem reprehenderit.','non','140298893',NULL,'1998-03-30 16:40:44','2009-08-26 21:59:16'),
('43','3','43','Qui omnis officiis aut tenetur. Ad mollitia animi asperiores officiis aperiam aspernatur voluptas. Rerum nesciunt dolore mollitia. Est enim voluptatem sit quo ut nisi libero vitae.','consequatur','94169',NULL,'2009-05-30 14:47:33','1992-10-11 00:07:01'),
('44','4','44','Repudiandae perspiciatis sapiente autem nihil. Exercitationem praesentium autem minus impedit quidem numquam quos. Ut autem nesciunt vel. Aut laudantium ducimus provident fuga. Modi voluptas autem mollitia distinctio vero sit.','eius','136',NULL,'1987-03-11 15:36:17','1970-09-30 22:17:42'),
('45','1','45','Et quas et et corrupti provident perspiciatis nihil. Expedita numquam mollitia ipsa qui et consectetur.','explicabo','53134077',NULL,'1980-10-30 06:47:31','2006-02-13 06:09:53'),
('46','2','46','Excepturi iusto odio non enim perferendis. Sit nobis praesentium est impedit. Dolorum dignissimos cupiditate aut repellendus aut architecto non.','aliquam','96',NULL,'1994-10-17 01:44:44','1979-08-19 18:10:59'),
('47','3','47','Modi reprehenderit aut sed. Eos tempore laboriosam earum numquam omnis velit. Corporis sed hic laudantium quam tenetur quisquam in. Omnis laudantium perspiciatis aperiam aut blanditiis aut cupiditate quia.','laborum','45',NULL,'2009-02-02 23:51:50','1996-05-01 09:00:42'),
('48','4','48','Qui omnis voluptatem placeat dolor cumque sapiente sit. Dignissimos cumque et veniam. Itaque voluptates molestiae harum velit et quis autem.','ut','45100',NULL,'1972-09-26 01:37:14','1977-10-30 02:50:06'),
('49','1','49','Fuga excepturi aut quos veniam. Quam eum dolor perferendis eos rerum ut hic. Libero harum non voluptatem quis voluptatem rerum animi.','ipsa','52',NULL,'2001-11-28 13:38:53','1998-03-18 19:06:56'),
('50','2','50','Incidunt et iusto quia nesciunt soluta. Exercitationem culpa quas a est. Enim rerum ut sit quis sed et officia. Eveniet aperiam dolor rem officia adipisci ab.','ullam','53323386',NULL,'1986-10-26 18:59:46','1996-07-20 09:45:56'); 


DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_id) REFERENCES media(id)

    -- PRIMARY KEY (user_id, media_id) – можно было и так вместо id в качестве PK
  	-- слишком увлекаться индексами тоже опасно, рациональнее их добавлять по мере необходимости (напр., провисают по времени какие-то запросы)  

/* намеренно забыли, чтобы увидеть нехватку в ER-диаграмме
    , FOREIGN KEY (user_id) REFERENCES users(id)
    , FOREIGN KEY (media_id) REFERENCES media(id)
*/
);

INSERT INTO `likes` VALUES ('1','1','1','1972-08-31 22:18:12'),
('2','2','2','1978-01-03 02:24:34'),
('3','3','3','1991-02-20 22:47:47'),
('4','4','4','2002-02-01 11:15:36'),
('5','5','5','2016-02-16 10:46:03'),
('6','6','6','2009-01-16 02:24:23'),
('7','7','7','2014-07-09 22:52:38'),
('8','8','8','1998-01-01 06:21:14'),
('9','9','9','1979-07-20 04:30:20'),
('10','10','10','2018-12-13 00:19:25'),
('11','11','11','2001-06-28 13:56:51'),
('12','12','12','1999-06-15 16:43:36'),
('13','13','13','1978-03-13 12:11:30'),
('14','14','14','2013-05-31 08:07:55'),
('15','15','15','1984-01-22 17:31:39'),
('16','16','16','1987-11-21 23:26:57'),
('17','17','17','2019-02-18 12:58:07'),
('18','18','18','1992-03-10 04:39:04'),
('19','19','19','2013-04-10 05:53:02'),
('20','20','20','2001-10-04 06:55:18'); 

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
  	PRIMARY KEY (`id`)
);

INSERT INTO `photo_albums` VALUES ('1','est','1'),
('2','quo','2'),
('3','autem','3'),
('4','quidem','4'),
('5','rem','5'),
('6','dignissimos','6'),
('7','culpa','7'),
('8','ut','8'),
('9','repudiandae','9'),
('10','sed','10'),
('11','provident','11'),
('12','asperiores','12'); 

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT unsigned NOT NULL,
	`media_id` BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

INSERT INTO `photos` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'),
('11','11','11'),
('12','12','12'),
('13','1','13'),
('14','2','14'),
('15','3','15'),
('16','4','16'),
('17','5','17'),
('18','6','18'),
('19','7','19'),
('20','8','20'),
('21','9','21'),
('22','10','22'),
('23','11','23'),
('24','12','24'),
('25','1','25'),
('26','2','26'),
('27','3','27'),
('28','4','28'),
('29','5','29'),
('30','6','30'),
('31','7','31'),
('32','8','32'),
('33','9','33'),
('34','10','34'),
('35','11','35'),
('36','12','36'),
('37','1','37'),
('38','2','38'),
('39','3','39'),
('40','4','40'),
('41','5','41'),
('42','6','42'),
('43','7','43'),
('44','8','44'),
('45','9','45'),
('46','10','46'),
('47','11','47'),
('48','12','48'),
('49','1','49'),
('50','2','50'); 

ALTER TABLE vk.profiles ADD CONSTRAINT profiles_FK FOREIGN KEY (photo_id) REFERENCES vk.media(id);
