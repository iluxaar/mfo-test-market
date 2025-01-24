-- Adminer 4.8.1 MySQL 8.0.26 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'ID пользователя',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время заказа',
  `total_amount` int NOT NULL COMMENT 'Сумма в минимальной денежной единице',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `total_amount` (`total_amount`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Заказы';

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `total_amount`) VALUES
(1,	1,	'2025-01-24 16:39:07',	50000),
(2,	1,	'2025-01-24 16:39:26',	30000),
(3,	2,	'2025-01-24 16:39:44',	700000),
(4,	3,	'2025-01-24 16:40:05',	60000),
(5,	3,	'2025-01-24 16:40:18',	80000),
(6,	4,	'2025-01-24 16:40:33',	90000);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_uk` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Пользователи';

INSERT INTO `users` (`id`, `email`) VALUES
(1,	'a1@gmail.com'),
(2,	'b1@gmail.com'),
(3,	'c1@gmail.com'),
(4,	'd1@gmail.com');

-- 2025-01-24 10:58:00
