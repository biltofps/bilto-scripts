-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.22.0.7382
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para londres-s1
CREATE DATABASE IF NOT EXISTS `londres-s1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `londres-s1`;

-- Copiando estrutura para tabela londres-s1.admin_activity_log
CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_time` timestamp NULL DEFAULT current_timestamp(),
  `online_count` int(11) NOT NULL DEFAULT 0,
  `total_money` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_activity_log: ~18 rows (aproximadamente)
INSERT IGNORE INTO `admin_activity_log` (`id`, `sample_time`, `online_count`, `total_money`) VALUES
	(3, '2026-10-25 22:25:47', 0, 0.00),
	(4, '2026-10-25 22:37:06', 0, 50.00),
	(5, '2026-10-25 22:52:06', 1, 50.00),
	(6, '2026-10-25 23:03:21', 0, 50.00),
	(7, '2026-10-25 23:18:12', 0, 50.00),
	(8, '2026-10-25 23:33:12', 1, 50.00),
	(9, '2026-10-25 23:38:50', 0, 50.00),
	(10, '2026-10-25 23:40:19', 0, 50.00),
	(11, '2026-10-26 03:06:39', 0, 50.00),
	(12, '2026-10-26 03:21:39', 1, 50.00),
	(13, '2026-10-26 03:35:18', 0, 45.00),
	(14, '2026-10-26 06:14:55', 0, 45.00),
	(15, '2026-10-26 06:29:55', 1, 24915.00),
	(16, '2026-10-26 06:44:55', 1, 24898.05),
	(17, '2026-10-26 06:46:43', 0, 24898.05),
	(18, '2026-10-26 07:01:43', 1, 24663.30),
	(19, '2026-10-26 07:17:19', 0, 323647.30),
	(20, '2026-10-26 07:32:21', 0, 323647.30);

-- Copiando estrutura para tabela londres-s1.admin_chat_messages
CREATE TABLE IF NOT EXISTS `admin_chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_citizenid` varchar(50) DEFAULT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_role` varchar(20) DEFAULT NULL,
  `sender_discord_name` varchar(255) DEFAULT NULL,
  `sender_discord_avatar_url` varchar(500) DEFAULT NULL,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_chat_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.admin_logs
CREATE TABLE IF NOT EXISTS `admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  `severity` varchar(10) NOT NULL DEFAULT 'low',
  `admin_citizenid` varchar(50) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `target_name` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `admin_citizenid` (`admin_citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_logs: ~1.328 rows (aproximadamente)
INSERT IGNORE INTO `admin_logs` (`id`, `category`, `severity`, `admin_citizenid`, `admin_name`, `action`, `details`, `target_name`, `ip`, `created_at`) VALUES
	(115, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(116, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(117, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(118, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(119, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(120, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(121, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(122, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(123, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(124, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(125, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(126, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(127, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(128, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(129, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(130, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(131, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(132, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(133, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(134, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(135, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(136, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(137, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(138, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(139, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(140, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(141, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(142, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(143, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(144, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(145, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(146, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(147, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(148, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(149, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(150, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(151, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(152, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(153, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(154, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(155, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(156, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(157, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(158, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(159, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(160, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(161, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(162, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(163, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(164, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(165, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(166, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(167, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(168, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(169, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(170, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(171, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(172, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(173, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(174, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(175, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(176, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(177, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(178, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(179, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(180, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(181, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(182, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(183, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(184, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(185, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(186, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-25 22:25:42'),
	(187, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(188, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(189, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(190, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(191, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(192, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(193, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(194, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(195, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(196, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(197, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(198, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(199, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(200, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(201, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(202, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(203, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(204, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(205, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(206, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(207, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(208, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(209, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(210, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(211, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(212, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(213, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(214, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(215, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(216, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(217, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(218, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(219, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(220, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(221, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(222, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(223, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(224, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(225, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(226, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(227, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(228, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(229, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(230, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(231, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(232, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(233, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(234, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(235, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(236, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(237, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(238, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(239, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(240, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(241, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(242, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(243, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(244, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(245, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(246, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(247, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(248, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(249, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(250, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(251, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(252, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(253, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(254, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(255, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(256, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(257, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(258, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-25 22:37:01'),
	(259, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(260, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(261, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(262, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(263, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(264, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(265, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(266, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(267, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(268, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(269, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(270, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(271, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(272, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(273, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(274, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(275, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(276, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(277, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(278, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(279, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(280, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(281, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(282, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(283, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(284, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(285, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(286, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(287, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(288, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(289, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(290, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(291, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(292, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(293, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(294, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:41:58'),
	(295, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:41:58'),
	(296, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:45:22'),
	(297, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:45:22'),
	(298, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:48:55'),
	(299, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:48:55'),
	(300, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:50:17'),
	(301, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:50:17'),
	(302, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:51:15'),
	(303, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:51:15'),
	(304, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:52:03'),
	(305, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:52:03'),
	(306, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:54:42'),
	(307, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:54:42'),
	(308, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:57:19'),
	(309, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:57:19'),
	(310, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 22:59:10'),
	(311, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 22:59:10'),
	(312, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(313, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(314, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(315, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(316, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(317, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(318, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(319, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(320, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(321, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(322, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(323, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(324, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(325, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(326, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(327, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(328, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(329, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(330, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(331, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(332, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(333, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(334, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(335, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(336, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(337, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(338, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(339, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(340, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(341, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(342, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(343, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(344, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(345, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(346, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(347, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(348, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(349, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(350, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(351, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(352, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(353, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(354, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(355, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(356, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(357, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(358, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(359, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(360, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(361, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(362, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(363, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(364, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(365, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(366, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(367, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(368, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(369, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(370, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(371, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(372, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(373, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(374, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(375, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(376, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(377, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(378, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(379, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(380, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(381, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(382, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(383, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-25 23:03:16'),
	(384, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(385, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(386, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(387, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(388, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(389, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(390, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(391, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(392, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(393, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(394, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(395, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(396, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(397, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(398, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(399, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(400, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(401, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(402, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(403, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(404, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(405, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(406, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(407, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(408, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(409, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(410, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(411, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(412, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(413, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(414, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(415, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(416, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(417, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(418, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(419, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:06:53'),
	(420, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:06:53'),
	(421, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:08:22'),
	(422, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:08:22'),
	(423, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:09:13'),
	(424, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:09:13'),
	(425, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:10:50'),
	(426, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:10:50'),
	(427, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:12:37'),
	(428, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:12:37'),
	(429, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:13:22'),
	(430, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:13:22'),
	(431, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:14:58'),
	(432, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:14:58'),
	(433, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:15:33'),
	(434, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:15:33'),
	(435, 'player_action', 'medium', 'KPP16072', 'RSRSRSRS', 'Changed player job', 'Job: medic | Grade: 3', 'RSRSRSRS', 'ip:192.168.1.100', '2026-10-25 23:15:56'),
	(436, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:17:12'),
	(437, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:17:12'),
	(438, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(439, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(440, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(441, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(442, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(443, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(444, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(445, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(446, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(447, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(448, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(449, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(450, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(451, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(452, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(453, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(454, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(455, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(456, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(457, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(458, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(459, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(460, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(461, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(462, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(463, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(464, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(465, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(466, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(467, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(468, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(469, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(470, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(471, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(472, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(473, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(474, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(475, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(476, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(477, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(478, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(479, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(480, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(481, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(482, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(483, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(484, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(485, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(486, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(487, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(488, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(489, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(490, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(491, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(492, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(493, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(494, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(495, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(496, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(497, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(498, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(499, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(500, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(501, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(502, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(503, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(504, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(505, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(506, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(507, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(508, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(509, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-25 23:18:07'),
	(510, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:21:53'),
	(511, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(512, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(513, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(514, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(515, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(516, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(517, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(518, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(519, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(520, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(521, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(522, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(523, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(524, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(525, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(526, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(527, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(528, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(529, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(530, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(531, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(532, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(533, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(534, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(535, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(536, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(537, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(538, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(539, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(540, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(541, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(542, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(543, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(544, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(545, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(546, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(547, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:24:27'),
	(548, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:24:27'),
	(549, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:28:48'),
	(550, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:28:48'),
	(551, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:29:59'),
	(552, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:29:59'),
	(553, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-25 23:32:08'),
	(554, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 23:32:08'),
	(555, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:32:08'),
	(556, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:32:08'),
	(557, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:32:38'),
	(558, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:32:38'),
	(559, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-25 23:33:22'),
	(560, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 23:33:22'),
	(561, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:33:22'),
	(562, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:33:22'),
	(563, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:33:22'),
	(564, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:33:22'),
	(565, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-25 23:37:09'),
	(566, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:37:09'),
	(567, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-25 23:37:10'),
	(568, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 23:37:10'),
	(569, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:37:10'),
	(570, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:37:10'),
	(571, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 23:38:02'),
	(572, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(573, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(574, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(575, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(576, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(577, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(578, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(579, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(580, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(581, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(582, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(583, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(584, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(585, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(586, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(587, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(588, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(589, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(590, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(591, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(592, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(593, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(594, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(595, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(596, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(597, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(598, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(599, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(600, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(601, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(602, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(603, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(604, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(605, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(606, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(607, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(608, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(609, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(610, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(611, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(612, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(613, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(614, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(615, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(616, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(617, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(618, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(619, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(620, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(621, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(622, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(623, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(624, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(625, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(626, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(627, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(628, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(629, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(630, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(631, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(632, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(633, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(634, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(635, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(636, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(637, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(638, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(639, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(640, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(641, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(642, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(643, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(644, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:38:45'),
	(645, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(646, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(647, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(648, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(649, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(650, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(651, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(652, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(653, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(654, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(655, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(656, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(657, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(658, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(659, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(660, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(661, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(662, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(663, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(664, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(665, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(666, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(667, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(668, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(669, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(670, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(671, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(672, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(673, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(674, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(675, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(676, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(677, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(678, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(679, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(680, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(681, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(682, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(683, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(684, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(685, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(686, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(687, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(688, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(689, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(690, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(691, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(692, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(693, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(694, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(695, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(696, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(697, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(698, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(699, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(700, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(701, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(702, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(703, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(704, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(705, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(706, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(707, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(708, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(709, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(710, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(711, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(712, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(713, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(714, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(715, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(716, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(717, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-25 23:40:14'),
	(718, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(719, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(720, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(721, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(722, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(723, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(724, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(725, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(726, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(727, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(728, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(729, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(730, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(731, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(732, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(733, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(734, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(735, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(736, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(737, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(738, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(739, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(740, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(741, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(742, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(743, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(744, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(745, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(746, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(747, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(748, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(749, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(750, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(751, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(752, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(753, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(754, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-25 23:43:59'),
	(755, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-25 23:43:59'),
	(756, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(757, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(758, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(759, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(760, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(761, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(762, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(763, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(764, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(765, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(766, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(767, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(768, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(769, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(770, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(771, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(772, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(773, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(774, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(775, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(776, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(777, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(778, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(779, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(780, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(781, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(782, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(783, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(784, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(785, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(786, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(787, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(788, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(789, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(790, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(791, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(792, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(793, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(794, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(795, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(796, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(797, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(798, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(799, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(800, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(801, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(802, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(803, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(804, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(805, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(806, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(807, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(808, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(809, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(810, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(811, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(812, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(813, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(814, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(815, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(816, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(817, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(818, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(819, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(820, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(821, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(822, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(823, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(824, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(825, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(826, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(827, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(828, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 03:06:34'),
	(829, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(830, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(831, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(832, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(833, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(834, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(835, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(836, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(837, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(838, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(839, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(840, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(841, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(842, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(843, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(844, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(845, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(846, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(847, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(848, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(849, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(850, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(851, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(852, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(853, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(854, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(855, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(856, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(857, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(858, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(859, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(860, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(861, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(862, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(863, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(864, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(865, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 03:16:18'),
	(866, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:16:18'),
	(867, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 03:17:19'),
	(868, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:17:19'),
	(869, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 03:19:52'),
	(870, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:19:52'),
	(871, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 03:21:55'),
	(872, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:21:55'),
	(873, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 03:23:12'),
	(874, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 03:23:12'),
	(875, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 03:25:51'),
	(876, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 03:25:51'),
	(877, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 03:25:54'),
	(878, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-26 03:25:54'),
	(879, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 03:25:54'),
	(880, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:25:54'),
	(881, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 03:27:28'),
	(882, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 03:27:28'),
	(883, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(884, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(885, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(886, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(887, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(888, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(889, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(890, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(891, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(892, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(893, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(894, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(895, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(896, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(897, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(898, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(899, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(900, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(901, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(902, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(903, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(904, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(905, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(906, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(907, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(908, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(909, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(910, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(911, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hud\'', 'Resource: rsg-hud | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(912, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(913, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(914, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(915, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(916, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(917, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(918, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(919, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(920, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(921, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(922, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(923, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(924, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(925, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(926, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(927, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(928, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(929, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(930, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(931, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(932, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(933, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(934, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(935, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(936, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(937, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(938, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(939, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(940, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(941, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(942, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(943, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(944, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(945, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(946, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(947, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(948, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(949, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(950, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(951, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(952, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(953, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(954, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(955, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 03:35:13'),
	(956, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(957, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(958, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(959, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(960, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(961, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(962, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(963, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(964, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(965, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(966, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(967, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(968, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(969, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(970, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(971, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(972, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(973, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(974, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(975, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(976, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(977, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(978, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(979, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(980, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(981, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(982, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(983, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(984, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(985, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(986, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(987, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(988, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(989, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(990, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(991, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(992, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(993, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(994, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(995, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(996, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(997, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(998, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(999, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1000, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1001, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1002, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1003, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1004, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1005, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1006, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1007, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1008, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1009, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1010, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1011, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1012, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1013, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1014, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1015, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1016, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1017, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1018, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1019, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1020, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1021, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1022, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1023, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1024, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1025, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1026, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-26 06:14:50'),
	(1027, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1028, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1029, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1030, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1031, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1032, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1033, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1034, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1035, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1036, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1037, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1038, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1039, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1040, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1041, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1042, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1043, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1044, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1045, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1046, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1047, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1048, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1049, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1050, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-samples\'', 'Resource: rsg-samples | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1051, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1052, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1053, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stores\'', 'Resource: rsg-stores | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1054, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1055, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1056, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1057, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1058, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1059, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:16:12'),
	(1060, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:16:12'),
	(1061, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 06:16:19'),
	(1062, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 06:17:38'),
	(1063, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 06:17:38'),
	(1064, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:17:40'),
	(1065, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:17:40'),
	(1066, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:17:48'),
	(1067, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:17:48'),
	(1068, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:17:51'),
	(1069, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:17:51'),
	(1070, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-26 06:18:39'),
	(1071, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-26 06:19:03'),
	(1072, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: stop', NULL, NULL, '2026-10-26 06:19:03'),
	(1073, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:20:24'),
	(1074, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stores\'', 'Resource: rsg-stores | Action: stop', NULL, NULL, '2026-10-26 06:20:24'),
	(1075, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:20:24'),
	(1076, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-26 06:20:26'),
	(1077, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: stop', NULL, NULL, '2026-10-26 06:20:26'),
	(1078, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-26 06:22:59'),
	(1079, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 06:25:48'),
	(1080, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-26 06:27:37'),
	(1081, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-26 06:27:37'),
	(1082, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:27:37'),
	(1083, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:27:37'),
	(1084, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 06:27:40'),
	(1085, 'system', 'low', NULL, NULL, 'Stopped resource \'ox_target\'', 'Resource: ox_target | Action: stop', NULL, NULL, '2026-10-26 06:28:35'),
	(1086, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-26 06:28:35'),
	(1087, 'system', 'low', NULL, NULL, 'Started resource \'ox_target\'', 'Resource: ox_target | Action: start', NULL, NULL, '2026-10-26 06:28:35'),
	(1088, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 06:28:36'),
	(1089, 'system', 'low', NULL, NULL, 'Started resource \'bilto_notify\'', 'Resource: bilto_notify | Action: start', NULL, NULL, '2026-10-26 06:31:08'),
	(1090, 'system', 'low', NULL, NULL, 'Started resource \'bilto_hud\'', 'Resource: bilto_hud | Action: start', NULL, NULL, '2026-10-26 06:31:11'),
	(1091, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:35:16'),
	(1092, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:38:55'),
	(1093, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:38:55'),
	(1094, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:39:12'),
	(1095, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:39:12'),
	(1096, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:42:23'),
	(1097, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:42:23'),
	(1098, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:42:58'),
	(1099, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:42:58'),
	(1100, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:43:38'),
	(1101, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:43:38'),
	(1102, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1103, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1104, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1105, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1106, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1107, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1108, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1109, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1110, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1111, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1112, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1113, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1114, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1115, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1116, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1117, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 06:44:11'),
	(1118, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 06:44:11'),
	(1119, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:44:13'),
	(1120, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1121, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1122, 'system', 'low', NULL, NULL, 'Started resource \'rsg-animations\'', 'Resource: rsg-animations | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1123, 'system', 'low', NULL, NULL, 'Started resource \'rsg-auction\'', 'Resource: rsg-auction | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1124, 'system', 'low', NULL, NULL, 'Started resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1125, 'system', 'low', NULL, NULL, 'Started resource \'rsg-banking\'', 'Resource: rsg-banking | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1126, 'system', 'low', NULL, NULL, 'Started resource \'rsg-barbers\'', 'Resource: rsg-barbers | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1127, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wardrobe\'', 'Resource: rsg-wardrobe | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1128, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bathing\'', 'Resource: rsg-bathing | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1129, 'system', 'low', NULL, NULL, 'Started resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1130, 'system', 'low', NULL, NULL, 'Started resource \'rsg-bossmenu\'', 'Resource: rsg-bossmenu | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1131, 'system', 'low', NULL, NULL, 'Started resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1132, 'system', 'low', NULL, NULL, 'Started resource \'rsg-consume\'', 'Resource: rsg-consume | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1133, 'system', 'low', NULL, NULL, 'Started resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1134, 'system', 'low', NULL, NULL, 'Started resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1135, 'system', 'low', NULL, NULL, 'Started resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1136, 'system', 'low', NULL, NULL, 'Started resource \'rsg-doorlock\'', 'Resource: rsg-doorlock | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1137, 'system', 'low', NULL, NULL, 'Started resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1138, 'system', 'low', NULL, NULL, 'Started resource \'rsg-essentials\'', 'Resource: rsg-essentials | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1139, 'system', 'low', NULL, NULL, 'Started resource \'rsg-farming\'', 'Resource: rsg-farming | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1140, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishing\'', 'Resource: rsg-fishing | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1141, 'system', 'low', NULL, NULL, 'Started resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1142, 'system', 'low', NULL, NULL, 'Started resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1143, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1144, 'system', 'low', NULL, NULL, 'Started resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1145, 'system', 'low', NULL, NULL, 'Started resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1146, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1147, 'system', 'low', NULL, NULL, 'Started resource \'rsg-housing\'', 'Resource: rsg-housing | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1148, 'system', 'low', NULL, NULL, 'Started resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1149, 'system', 'low', NULL, NULL, 'Started resource \'rsg-huntingpets\'', 'Resource: rsg-huntingpets | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1150, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lawman\'', 'Resource: rsg-lawman | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1151, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loading\'', 'Resource: rsg-loading | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1152, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lockpick\'', 'Resource: rsg-lockpick | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1153, 'system', 'low', NULL, NULL, 'Started resource \'rsg-looting\'', 'Resource: rsg-looting | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1154, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lottery\'', 'Resource: rsg-lottery | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1155, 'system', 'low', NULL, NULL, 'Started resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1156, 'system', 'low', NULL, NULL, 'Started resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1157, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mdt\'', 'Resource: rsg-mdt | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1158, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1159, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mining\'', 'Resource: rsg-mining | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1160, 'system', 'low', NULL, NULL, 'Started resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1161, 'system', 'low', NULL, NULL, 'Started resource \'rsg-multijob\'', 'Resource: rsg-multijob | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1162, 'system', 'low', NULL, NULL, 'Started resource \'rsg-noticeboard\'', 'Resource: rsg-noticeboard | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1163, 'system', 'low', NULL, NULL, 'Started resource \'rsg-npcs\'', 'Resource: rsg-npcs | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1164, 'system', 'low', NULL, NULL, 'Started resource \'rsg-playerinfo\'', 'Resource: rsg-playerinfo | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1165, 'system', 'low', NULL, NULL, 'Started resource \'rsg-poison\'', 'Resource: rsg-poison | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1166, 'system', 'low', NULL, NULL, 'Started resource \'rsg-prison\'', 'Resource: rsg-prison | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1167, 'system', 'low', NULL, NULL, 'Started resource \'rsg-radialmenu\'', 'Resource: rsg-radialmenu | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1168, 'system', 'low', NULL, NULL, 'Started resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1169, 'system', 'low', NULL, NULL, 'Started resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1170, 'system', 'low', NULL, NULL, 'Started resource \'rsg-roulette\'', 'Resource: rsg-roulette | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1171, 'system', 'low', NULL, NULL, 'Started resource \'rsg-samples\'', 'Resource: rsg-samples | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1172, 'system', 'low', NULL, NULL, 'Started resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1173, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stables\'', 'Resource: rsg-stables | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1174, 'system', 'low', NULL, NULL, 'Started resource \'rsg-stores\'', 'Resource: rsg-stores | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1175, 'system', 'low', NULL, NULL, 'Started resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1176, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telegram\'', 'Resource: rsg-telegram | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1177, 'system', 'low', NULL, NULL, 'Started resource \'rsg-telephone\'', 'Resource: rsg-telephone | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1178, 'system', 'low', NULL, NULL, 'Started resource \'rsg-track\'', 'Resource: rsg-track | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1179, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trader\'', 'Resource: rsg-trader | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1180, 'system', 'low', NULL, NULL, 'Started resource \'rsg-trapdoors\'', 'Resource: rsg-trapdoors | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1181, 'system', 'low', NULL, NULL, 'Started resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1182, 'system', 'low', NULL, NULL, 'Started resource \'rsg-wagons\'', 'Resource: rsg-wagons | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1183, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weaponcomp\'', 'Resource: rsg-weaponcomp | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1184, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1185, 'system', 'low', NULL, NULL, 'Started resource \'rsg-weather\'', 'Resource: rsg-weather | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1186, 'system', 'low', NULL, NULL, 'Started resource \'rsg-zonenotify\'', 'Resource: rsg-zonenotify | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1187, 'system', 'low', NULL, NULL, 'Started resource \'redm-ymaps\'', 'Resource: redm-ymaps | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1188, 'system', 'low', NULL, NULL, 'Started resource \'rsg-mapping\'', 'Resource: rsg-mapping | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1189, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Blackjack\'', 'Resource: Nt_Blackjack | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1190, 'system', 'low', NULL, NULL, 'Started resource \'Nt_Holdem\'', 'Resource: Nt_Holdem | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1191, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1192, 'system', 'low', NULL, NULL, 'Started resource \'bilto_notify\'', 'Resource: bilto_notify | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1193, 'system', 'low', NULL, NULL, 'Started resource \'bilto_hud\'', 'Resource: bilto_hud | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1194, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:46:38'),
	(1195, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:51:38'),
	(1196, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:51:38'),
	(1197, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:52:05'),
	(1198, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:52:05'),
	(1199, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:52:33'),
	(1200, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:52:33'),
	(1201, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:54:42'),
	(1202, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:54:42'),
	(1203, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1204, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1205, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ammo\'', 'Resource: rsg-ammo | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1206, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-consume\'', 'Resource: rsg-consume | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1207, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-cooking\'', 'Resource: rsg-cooking | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1208, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-canteen\'', 'Resource: rsg-canteen | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1209, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-beekeeper\'', 'Resource: rsg-beekeeper | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1210, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-backpacks\'', 'Resource: rsg-backpacks | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1211, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-auction\'', 'Resource: rsg-auction | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1212, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-crafting\'', 'Resource: rsg-crafting | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1213, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-deliveries\'', 'Resource: rsg-deliveries | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1214, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-drugs\'', 'Resource: rsg-drugs | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1215, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-farming\'', 'Resource: rsg-farming | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1216, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-fishmonger\'', 'Resource: rsg-fishmonger | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1217, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-gangmenu\'', 'Resource: rsg-gangmenu | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1218, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldclaim\'', 'Resource: rsg-goldclaim | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1219, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-goldpanning\'', 'Resource: rsg-goldpanning | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1220, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-herbalist\'', 'Resource: rsg-herbalist | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1221, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hotair\'', 'Resource: rsg-hotair | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1222, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-housing\'', 'Resource: rsg-housing | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1223, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-hunting\'', 'Resource: rsg-hunting | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1224, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-looting\'', 'Resource: rsg-looting | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1225, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-loyalty\'', 'Resource: rsg-loyalty | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1226, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-lumberjack\'', 'Resource: rsg-lumberjack | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1227, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1228, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-mining\'', 'Resource: rsg-mining | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1229, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-moonshine\'', 'Resource: rsg-moonshine | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1230, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-poison\'', 'Resource: rsg-poison | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1231, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-prison\'', 'Resource: rsg-prison | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1232, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-railroad\'', 'Resource: rsg-railroad | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1233, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-ranch\'', 'Resource: rsg-ranch | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1234, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-smelting\'', 'Resource: rsg-smelting | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1235, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-stables\'', 'Resource: rsg-stables | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1236, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-targetpractise\'', 'Resource: rsg-targetpractise | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1237, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-trader\'', 'Resource: rsg-trader | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1238, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-treasure\'', 'Resource: rsg-treasure | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1239, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-weapons\'', 'Resource: rsg-weapons | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1240, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 06:54:50'),
	(1241, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 06:54:50'),
	(1242, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 06:54:51'),
	(1243, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:00:12'),
	(1244, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:00:12'),
	(1245, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:01:42'),
	(1246, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:01:42'),
	(1247, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:03:44'),
	(1248, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:03:44'),
	(1249, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:04:57'),
	(1250, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:04:57'),
	(1251, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:05:06'),
	(1252, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 07:05:06'),
	(1253, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 07:05:06'),
	(1254, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:05:07'),
	(1255, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:07:06'),
	(1256, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:07:06'),
	(1257, 'system', 'low', NULL, NULL, 'Started resource \'rsg-medic\'', 'Resource: rsg-medic | Action: start', NULL, NULL, '2026-10-26 07:09:07'),
	(1258, 'system', 'low', NULL, NULL, 'Started resource \'bilto_admin\'', 'Resource: bilto_admin | Action: start', NULL, NULL, '2026-10-26 07:09:07'),
	(1259, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:09:54'),
	(1260, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_admin\'', 'Resource: bilto_admin | Action: stop', NULL, NULL, '2026-10-26 07:09:54'),
	(1261, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-medic\'', 'Resource: rsg-medic | Action: stop', NULL, NULL, '2026-10-26 07:09:54'),
	(1262, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 07:09:54'),
	(1263, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 07:09:54'),
	(1264, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:09:55'),
	(1265, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:10:46'),
	(1266, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:10:46'),
	(1267, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:11:02'),
	(1268, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:11:02'),
	(1269, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:13:36'),
	(1270, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:13:36'),
	(1271, 'system', 'low', NULL, NULL, 'Stopped resource \'bilto_shop\'', 'Resource: bilto_shop | Action: stop', NULL, NULL, '2026-10-26 07:14:38'),
	(1272, 'system', 'low', NULL, NULL, 'Stopped resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: stop', NULL, NULL, '2026-10-26 07:14:38'),
	(1273, 'system', 'low', NULL, NULL, 'Started resource \'rsg-inventory\'', 'Resource: rsg-inventory | Action: start', NULL, NULL, '2026-10-26 07:14:38'),
	(1274, 'system', 'low', NULL, NULL, 'Started resource \'bilto_shop\'', 'Resource: bilto_shop | Action: start', NULL, NULL, '2026-10-26 07:14:39'),
	(1275, 'system', 'low', NULL, NULL, 'Recurso \'rsg-inventory\' iniciado', 'Recurso: rsg-inventory | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1276, 'system', 'low', NULL, NULL, 'Recurso \'rsg-ammo\' iniciado', 'Recurso: rsg-ammo | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1277, 'system', 'low', NULL, NULL, 'Recurso \'rsg-animations\' iniciado', 'Recurso: rsg-animations | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1278, 'system', 'low', NULL, NULL, 'Recurso \'rsg-auction\' iniciado', 'Recurso: rsg-auction | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1279, 'system', 'low', NULL, NULL, 'Recurso \'rsg-backpacks\' iniciado', 'Recurso: rsg-backpacks | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1280, 'system', 'low', NULL, NULL, 'Recurso \'rsg-banking\' iniciado', 'Recurso: rsg-banking | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1281, 'system', 'low', NULL, NULL, 'Recurso \'rsg-barbers\' iniciado', 'Recurso: rsg-barbers | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1282, 'system', 'low', NULL, NULL, 'Recurso \'rsg-wardrobe\' iniciado', 'Recurso: rsg-wardrobe | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1283, 'system', 'low', NULL, NULL, 'Recurso \'rsg-bathing\' iniciado', 'Recurso: rsg-bathing | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1284, 'system', 'low', NULL, NULL, 'Recurso \'rsg-beekeeper\' iniciado', 'Recurso: rsg-beekeeper | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1285, 'system', 'low', NULL, NULL, 'Recurso \'rsg-bossmenu\' iniciado', 'Recurso: rsg-bossmenu | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1286, 'system', 'low', NULL, NULL, 'Recurso \'rsg-canteen\' iniciado', 'Recurso: rsg-canteen | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1287, 'system', 'low', NULL, NULL, 'Recurso \'rsg-consume\' iniciado', 'Recurso: rsg-consume | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1288, 'system', 'low', NULL, NULL, 'Recurso \'rsg-cooking\' iniciado', 'Recurso: rsg-cooking | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1289, 'system', 'low', NULL, NULL, 'Recurso \'rsg-crafting\' iniciado', 'Recurso: rsg-crafting | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1290, 'system', 'low', NULL, NULL, 'Recurso \'rsg-deliveries\' iniciado', 'Recurso: rsg-deliveries | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1291, 'system', 'low', NULL, NULL, 'Recurso \'rsg-doorlock\' iniciado', 'Recurso: rsg-doorlock | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1292, 'system', 'low', NULL, NULL, 'Recurso \'rsg-drugs\' iniciado', 'Recurso: rsg-drugs | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1293, 'system', 'low', NULL, NULL, 'Recurso \'rsg-essentials\' iniciado', 'Recurso: rsg-essentials | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1294, 'system', 'low', NULL, NULL, 'Recurso \'rsg-farming\' iniciado', 'Recurso: rsg-farming | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1295, 'system', 'low', NULL, NULL, 'Recurso \'rsg-fishing\' iniciado', 'Recurso: rsg-fishing | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1296, 'system', 'low', NULL, NULL, 'Recurso \'rsg-fishmonger\' iniciado', 'Recurso: rsg-fishmonger | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1297, 'system', 'low', NULL, NULL, 'Recurso \'rsg-gangmenu\' iniciado', 'Recurso: rsg-gangmenu | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1298, 'system', 'low', NULL, NULL, 'Recurso \'rsg-goldclaim\' iniciado', 'Recurso: rsg-goldclaim | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1299, 'system', 'low', NULL, NULL, 'Recurso \'rsg-goldpanning\' iniciado', 'Recurso: rsg-goldpanning | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1300, 'system', 'low', NULL, NULL, 'Recurso \'rsg-herbalist\' iniciado', 'Recurso: rsg-herbalist | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1301, 'system', 'low', NULL, NULL, 'Recurso \'rsg-hotair\' iniciado', 'Recurso: rsg-hotair | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1302, 'system', 'low', NULL, NULL, 'Recurso \'rsg-housing\' iniciado', 'Recurso: rsg-housing | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1303, 'system', 'low', NULL, NULL, 'Recurso \'rsg-hunting\' iniciado', 'Recurso: rsg-hunting | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1304, 'system', 'low', NULL, NULL, 'Recurso \'rsg-huntingpets\' iniciado', 'Recurso: rsg-huntingpets | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1305, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lawman\' iniciado', 'Recurso: rsg-lawman | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1306, 'system', 'low', NULL, NULL, 'Recurso \'rsg-loading\' iniciado', 'Recurso: rsg-loading | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1307, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lockpick\' iniciado', 'Recurso: rsg-lockpick | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1308, 'system', 'low', NULL, NULL, 'Recurso \'rsg-looting\' iniciado', 'Recurso: rsg-looting | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1309, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lottery\' iniciado', 'Recurso: rsg-lottery | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1310, 'system', 'low', NULL, NULL, 'Recurso \'rsg-loyalty\' iniciado', 'Recurso: rsg-loyalty | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1311, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lumberjack\' iniciado', 'Recurso: rsg-lumberjack | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1312, 'system', 'low', NULL, NULL, 'Recurso \'rsg-mdt\' iniciado', 'Recurso: rsg-mdt | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1313, 'system', 'low', NULL, NULL, 'Recurso \'rsg-medic\' iniciado', 'Recurso: rsg-medic | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1314, 'system', 'low', NULL, NULL, 'Recurso \'rsg-mining\' iniciado', 'Recurso: rsg-mining | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1315, 'system', 'low', NULL, NULL, 'Recurso \'rsg-moonshine\' iniciado', 'Recurso: rsg-moonshine | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1316, 'system', 'low', NULL, NULL, 'Recurso \'rsg-multijob\' iniciado', 'Recurso: rsg-multijob | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1317, 'system', 'low', NULL, NULL, 'Recurso \'rsg-noticeboard\' iniciado', 'Recurso: rsg-noticeboard | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1318, 'system', 'low', NULL, NULL, 'Recurso \'rsg-npcs\' iniciado', 'Recurso: rsg-npcs | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1319, 'system', 'low', NULL, NULL, 'Recurso \'rsg-playerinfo\' iniciado', 'Recurso: rsg-playerinfo | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1320, 'system', 'low', NULL, NULL, 'Recurso \'rsg-poison\' iniciado', 'Recurso: rsg-poison | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1321, 'system', 'low', NULL, NULL, 'Recurso \'rsg-prison\' iniciado', 'Recurso: rsg-prison | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1322, 'system', 'low', NULL, NULL, 'Recurso \'rsg-radialmenu\' iniciado', 'Recurso: rsg-radialmenu | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1323, 'system', 'low', NULL, NULL, 'Recurso \'rsg-railroad\' iniciado', 'Recurso: rsg-railroad | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1324, 'system', 'low', NULL, NULL, 'Recurso \'rsg-ranch\' iniciado', 'Recurso: rsg-ranch | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1325, 'system', 'low', NULL, NULL, 'Recurso \'rsg-roulette\' iniciado', 'Recurso: rsg-roulette | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1326, 'system', 'low', NULL, NULL, 'Recurso \'rsg-samples\' iniciado', 'Recurso: rsg-samples | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1327, 'system', 'low', NULL, NULL, 'Recurso \'rsg-smelting\' iniciado', 'Recurso: rsg-smelting | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1328, 'system', 'low', NULL, NULL, 'Recurso \'rsg-stables\' iniciado', 'Recurso: rsg-stables | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1329, 'system', 'low', NULL, NULL, 'Recurso \'rsg-stores\' iniciado', 'Recurso: rsg-stores | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1330, 'system', 'low', NULL, NULL, 'Recurso \'rsg-targetpractise\' iniciado', 'Recurso: rsg-targetpractise | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1331, 'system', 'low', NULL, NULL, 'Recurso \'rsg-telegram\' iniciado', 'Recurso: rsg-telegram | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1332, 'system', 'low', NULL, NULL, 'Recurso \'rsg-telephone\' iniciado', 'Recurso: rsg-telephone | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1333, 'system', 'low', NULL, NULL, 'Recurso \'rsg-track\' iniciado', 'Recurso: rsg-track | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1334, 'system', 'low', NULL, NULL, 'Recurso \'rsg-trader\' iniciado', 'Recurso: rsg-trader | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1335, 'system', 'low', NULL, NULL, 'Recurso \'rsg-trapdoors\' iniciado', 'Recurso: rsg-trapdoors | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1336, 'system', 'low', NULL, NULL, 'Recurso \'rsg-treasure\' iniciado', 'Recurso: rsg-treasure | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1337, 'system', 'low', NULL, NULL, 'Recurso \'rsg-wagons\' iniciado', 'Recurso: rsg-wagons | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1338, 'system', 'low', NULL, NULL, 'Recurso \'rsg-weaponcomp\' iniciado', 'Recurso: rsg-weaponcomp | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1339, 'system', 'low', NULL, NULL, 'Recurso \'rsg-weapons\' iniciado', 'Recurso: rsg-weapons | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1340, 'system', 'low', NULL, NULL, 'Recurso \'rsg-weather\' iniciado', 'Recurso: rsg-weather | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1341, 'system', 'low', NULL, NULL, 'Recurso \'rsg-zonenotify\' iniciado', 'Recurso: rsg-zonenotify | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1342, 'system', 'low', NULL, NULL, 'Recurso \'redm-ymaps\' iniciado', 'Recurso: redm-ymaps | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1343, 'system', 'low', NULL, NULL, 'Recurso \'rsg-mapping\' iniciado', 'Recurso: rsg-mapping | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1344, 'system', 'low', NULL, NULL, 'Recurso \'Nt_Blackjack\' iniciado', 'Recurso: Nt_Blackjack | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1345, 'system', 'low', NULL, NULL, 'Recurso \'Nt_Holdem\' iniciado', 'Recurso: Nt_Holdem | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1346, 'system', 'low', NULL, NULL, 'Recurso \'bilto_admin\' iniciado', 'Recurso: bilto_admin | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1347, 'system', 'low', NULL, NULL, 'Recurso \'bilto_notify\' iniciado', 'Recurso: bilto_notify | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1348, 'system', 'low', NULL, NULL, 'Recurso \'bilto_hud\' iniciado', 'Recurso: bilto_hud | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1349, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:17:14'),
	(1350, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:20:21'),
	(1351, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:20:21'),
	(1352, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:22:12'),
	(1353, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:22:12'),
	(1354, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:22:36'),
	(1355, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:22:36'),
	(1356, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:23:48'),
	(1357, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:23:48'),
	(1358, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:24:48'),
	(1359, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:24:48'),
	(1360, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:26:23'),
	(1361, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:26:23'),
	(1362, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' parado', 'Recurso: bilto_shop | Ação: stop', NULL, NULL, '2026-10-26 07:28:03'),
	(1363, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:28:03'),
	(1364, 'system', 'low', NULL, NULL, 'Recurso \'rsg-chat\' parado', 'Recurso: rsg-chat | Ação: stop', NULL, NULL, '2026-10-26 07:31:19'),
	(1365, 'system', 'low', NULL, NULL, 'Recurso \'rsg-chat\' iniciado', 'Recurso: rsg-chat | Ação: start', NULL, NULL, '2026-10-26 07:31:19'),
	(1366, 'system', 'low', NULL, NULL, 'Recurso \'rsg-chat\' parado', 'Recurso: rsg-chat | Ação: stop', NULL, NULL, '2026-10-26 07:31:46'),
	(1367, 'system', 'low', NULL, NULL, 'Recurso \'rsg-chat\' iniciado', 'Recurso: rsg-chat | Ação: start', NULL, NULL, '2026-10-26 07:31:46'),
	(1368, 'system', 'low', NULL, NULL, 'Recurso \'rsg-inventory\' iniciado', 'Recurso: rsg-inventory | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1369, 'system', 'low', NULL, NULL, 'Recurso \'rsg-ammo\' iniciado', 'Recurso: rsg-ammo | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1370, 'system', 'low', NULL, NULL, 'Recurso \'rsg-animations\' iniciado', 'Recurso: rsg-animations | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1371, 'system', 'low', NULL, NULL, 'Recurso \'rsg-auction\' iniciado', 'Recurso: rsg-auction | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1372, 'system', 'low', NULL, NULL, 'Recurso \'rsg-backpacks\' iniciado', 'Recurso: rsg-backpacks | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1373, 'system', 'low', NULL, NULL, 'Recurso \'rsg-banking\' iniciado', 'Recurso: rsg-banking | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1374, 'system', 'low', NULL, NULL, 'Recurso \'rsg-barbers\' iniciado', 'Recurso: rsg-barbers | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1375, 'system', 'low', NULL, NULL, 'Recurso \'rsg-wardrobe\' iniciado', 'Recurso: rsg-wardrobe | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1376, 'system', 'low', NULL, NULL, 'Recurso \'rsg-bathing\' iniciado', 'Recurso: rsg-bathing | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1377, 'system', 'low', NULL, NULL, 'Recurso \'rsg-beekeeper\' iniciado', 'Recurso: rsg-beekeeper | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1378, 'system', 'low', NULL, NULL, 'Recurso \'rsg-bossmenu\' iniciado', 'Recurso: rsg-bossmenu | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1379, 'system', 'low', NULL, NULL, 'Recurso \'rsg-canteen\' iniciado', 'Recurso: rsg-canteen | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1380, 'system', 'low', NULL, NULL, 'Recurso \'rsg-consume\' iniciado', 'Recurso: rsg-consume | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1381, 'system', 'low', NULL, NULL, 'Recurso \'rsg-cooking\' iniciado', 'Recurso: rsg-cooking | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1382, 'system', 'low', NULL, NULL, 'Recurso \'rsg-crafting\' iniciado', 'Recurso: rsg-crafting | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1383, 'system', 'low', NULL, NULL, 'Recurso \'rsg-deliveries\' iniciado', 'Recurso: rsg-deliveries | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1384, 'system', 'low', NULL, NULL, 'Recurso \'rsg-doorlock\' iniciado', 'Recurso: rsg-doorlock | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1385, 'system', 'low', NULL, NULL, 'Recurso \'rsg-drugs\' iniciado', 'Recurso: rsg-drugs | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1386, 'system', 'low', NULL, NULL, 'Recurso \'rsg-essentials\' iniciado', 'Recurso: rsg-essentials | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1387, 'system', 'low', NULL, NULL, 'Recurso \'rsg-farming\' iniciado', 'Recurso: rsg-farming | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1388, 'system', 'low', NULL, NULL, 'Recurso \'rsg-fishing\' iniciado', 'Recurso: rsg-fishing | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1389, 'system', 'low', NULL, NULL, 'Recurso \'rsg-fishmonger\' iniciado', 'Recurso: rsg-fishmonger | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1390, 'system', 'low', NULL, NULL, 'Recurso \'rsg-gangmenu\' iniciado', 'Recurso: rsg-gangmenu | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1391, 'system', 'low', NULL, NULL, 'Recurso \'rsg-goldclaim\' iniciado', 'Recurso: rsg-goldclaim | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1392, 'system', 'low', NULL, NULL, 'Recurso \'rsg-goldpanning\' iniciado', 'Recurso: rsg-goldpanning | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1393, 'system', 'low', NULL, NULL, 'Recurso \'rsg-herbalist\' iniciado', 'Recurso: rsg-herbalist | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1394, 'system', 'low', NULL, NULL, 'Recurso \'rsg-hotair\' iniciado', 'Recurso: rsg-hotair | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1395, 'system', 'low', NULL, NULL, 'Recurso \'rsg-housing\' iniciado', 'Recurso: rsg-housing | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1396, 'system', 'low', NULL, NULL, 'Recurso \'rsg-hunting\' iniciado', 'Recurso: rsg-hunting | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1397, 'system', 'low', NULL, NULL, 'Recurso \'rsg-huntingpets\' iniciado', 'Recurso: rsg-huntingpets | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1398, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lawman\' iniciado', 'Recurso: rsg-lawman | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1399, 'system', 'low', NULL, NULL, 'Recurso \'rsg-loading\' iniciado', 'Recurso: rsg-loading | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1400, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lockpick\' iniciado', 'Recurso: rsg-lockpick | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1401, 'system', 'low', NULL, NULL, 'Recurso \'rsg-looting\' iniciado', 'Recurso: rsg-looting | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1402, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lottery\' iniciado', 'Recurso: rsg-lottery | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1403, 'system', 'low', NULL, NULL, 'Recurso \'rsg-loyalty\' iniciado', 'Recurso: rsg-loyalty | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1404, 'system', 'low', NULL, NULL, 'Recurso \'rsg-lumberjack\' iniciado', 'Recurso: rsg-lumberjack | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1405, 'system', 'low', NULL, NULL, 'Recurso \'rsg-mdt\' iniciado', 'Recurso: rsg-mdt | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1406, 'system', 'low', NULL, NULL, 'Recurso \'rsg-medic\' iniciado', 'Recurso: rsg-medic | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1407, 'system', 'low', NULL, NULL, 'Recurso \'rsg-mining\' iniciado', 'Recurso: rsg-mining | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1408, 'system', 'low', NULL, NULL, 'Recurso \'rsg-moonshine\' iniciado', 'Recurso: rsg-moonshine | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1409, 'system', 'low', NULL, NULL, 'Recurso \'rsg-multijob\' iniciado', 'Recurso: rsg-multijob | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1410, 'system', 'low', NULL, NULL, 'Recurso \'rsg-noticeboard\' iniciado', 'Recurso: rsg-noticeboard | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1411, 'system', 'low', NULL, NULL, 'Recurso \'rsg-npcs\' iniciado', 'Recurso: rsg-npcs | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1412, 'system', 'low', NULL, NULL, 'Recurso \'rsg-playerinfo\' iniciado', 'Recurso: rsg-playerinfo | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1413, 'system', 'low', NULL, NULL, 'Recurso \'rsg-poison\' iniciado', 'Recurso: rsg-poison | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1414, 'system', 'low', NULL, NULL, 'Recurso \'rsg-prison\' iniciado', 'Recurso: rsg-prison | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1415, 'system', 'low', NULL, NULL, 'Recurso \'rsg-radialmenu\' iniciado', 'Recurso: rsg-radialmenu | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1416, 'system', 'low', NULL, NULL, 'Recurso \'rsg-railroad\' iniciado', 'Recurso: rsg-railroad | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1417, 'system', 'low', NULL, NULL, 'Recurso \'rsg-ranch\' iniciado', 'Recurso: rsg-ranch | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1418, 'system', 'low', NULL, NULL, 'Recurso \'rsg-roulette\' iniciado', 'Recurso: rsg-roulette | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1419, 'system', 'low', NULL, NULL, 'Recurso \'rsg-samples\' iniciado', 'Recurso: rsg-samples | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1420, 'system', 'low', NULL, NULL, 'Recurso \'rsg-smelting\' iniciado', 'Recurso: rsg-smelting | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1421, 'system', 'low', NULL, NULL, 'Recurso \'rsg-stables\' iniciado', 'Recurso: rsg-stables | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1422, 'system', 'low', NULL, NULL, 'Recurso \'rsg-stores\' iniciado', 'Recurso: rsg-stores | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1423, 'system', 'low', NULL, NULL, 'Recurso \'rsg-targetpractise\' iniciado', 'Recurso: rsg-targetpractise | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1424, 'system', 'low', NULL, NULL, 'Recurso \'rsg-telegram\' iniciado', 'Recurso: rsg-telegram | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1425, 'system', 'low', NULL, NULL, 'Recurso \'rsg-telephone\' iniciado', 'Recurso: rsg-telephone | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1426, 'system', 'low', NULL, NULL, 'Recurso \'rsg-track\' iniciado', 'Recurso: rsg-track | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1427, 'system', 'low', NULL, NULL, 'Recurso \'rsg-trader\' iniciado', 'Recurso: rsg-trader | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1428, 'system', 'low', NULL, NULL, 'Recurso \'rsg-trapdoors\' iniciado', 'Recurso: rsg-trapdoors | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1429, 'system', 'low', NULL, NULL, 'Recurso \'rsg-treasure\' iniciado', 'Recurso: rsg-treasure | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1430, 'system', 'low', NULL, NULL, 'Recurso \'rsg-wagons\' iniciado', 'Recurso: rsg-wagons | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1431, 'system', 'low', NULL, NULL, 'Recurso \'rsg-weaponcomp\' iniciado', 'Recurso: rsg-weaponcomp | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1432, 'system', 'low', NULL, NULL, 'Recurso \'rsg-weapons\' iniciado', 'Recurso: rsg-weapons | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1433, 'system', 'low', NULL, NULL, 'Recurso \'rsg-weather\' iniciado', 'Recurso: rsg-weather | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1434, 'system', 'low', NULL, NULL, 'Recurso \'rsg-zonenotify\' iniciado', 'Recurso: rsg-zonenotify | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1435, 'system', 'low', NULL, NULL, 'Recurso \'redm-ymaps\' iniciado', 'Recurso: redm-ymaps | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1436, 'system', 'low', NULL, NULL, 'Recurso \'rsg-mapping\' iniciado', 'Recurso: rsg-mapping | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1437, 'system', 'low', NULL, NULL, 'Recurso \'Nt_Blackjack\' iniciado', 'Recurso: Nt_Blackjack | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1438, 'system', 'low', NULL, NULL, 'Recurso \'Nt_Holdem\' iniciado', 'Recurso: Nt_Holdem | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1439, 'system', 'low', NULL, NULL, 'Recurso \'bilto_admin\' iniciado', 'Recurso: bilto_admin | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1440, 'system', 'low', NULL, NULL, 'Recurso \'bilto_notify\' iniciado', 'Recurso: bilto_notify | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1441, 'system', 'low', NULL, NULL, 'Recurso \'bilto_hud\' iniciado', 'Recurso: bilto_hud | Ação: start', NULL, NULL, '2026-10-26 07:32:16'),
	(1442, 'system', 'low', NULL, NULL, 'Recurso \'bilto_shop\' iniciado', 'Recurso: bilto_shop | Ação: start', NULL, NULL, '2026-10-26 07:32:16');

-- Copiando estrutura para tabela londres-s1.admin_player_history
CREATE TABLE IF NOT EXISTS `admin_player_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `action` varchar(20) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `duration_seconds` int(11) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_player_history: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.admin_report_messages
CREATE TABLE IF NOT EXISTS `admin_report_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `sender_type` varchar(50) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `admin_report_messages_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `admin_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_report_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.admin_report_nearby_players
CREATE TABLE IF NOT EXISTS `admin_report_nearby_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `player_license` varchar(255) NOT NULL,
  `distance` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `admin_report_nearby_players_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `admin_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_report_nearby_players: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.admin_reports
CREATE TABLE IF NOT EXISTS `admin_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(50) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reporter_name` varchar(255) NOT NULL,
  `reporter_license` varchar(255) NOT NULL,
  `reporter_discord` varchar(255) DEFAULT NULL,
  `reporter_coords` varchar(255) NOT NULL,
  `reported_player_id` int(11) DEFAULT NULL,
  `reported_player_name` varchar(255) DEFAULT NULL,
  `reported_player_license` varchar(255) DEFAULT NULL,
  `reported_player_discord` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'open',
  `assigned_admin_id` int(11) DEFAULT NULL,
  `assigned_admin_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reporter_steam` varchar(50) DEFAULT NULL,
  `severity` varchar(20) DEFAULT 'medium',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_reports: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.admin_roles
CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `license` varchar(100) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `granted_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_roles: ~0 rows (aproximadamente)
INSERT IGNORE INTO `admin_roles` (`id`, `citizenid`, `license`, `discord`, `name`, `role`, `granted_by`, `created_at`) VALUES
	(1, 'KPP16072', NULL, 'discord:1540137936685637653', 'Bilto Maldonado', 'god', 'server.cfg', '2026-10-25 23:03:41');

-- Copiando estrutura para tabela londres-s1.admin_whitelist
CREATE TABLE IF NOT EXISTS `admin_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `reason` varchar(255) DEFAULT NULL,
  `added_by_name` varchar(255) DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.admin_whitelist: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.adminmenu_blips
CREATE TABLE IF NOT EXISTS `adminmenu_blips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sprite` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `scale` float NOT NULL DEFAULT 1,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.adminmenu_blips: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.adminmenu_custom_items
CREATE TABLE IF NOT EXISTS `adminmenu_custom_items` (
  `name` varchar(64) NOT NULL,
  `label` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT 'item',
  `image` varchar(150) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.adminmenu_custom_items: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.adminmenu_settings
CREATE TABLE IF NOT EXISTS `adminmenu_settings` (
  `setting_key` varchar(64) NOT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.adminmenu_settings: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.adminmenu_teleports
CREATE TABLE IF NOT EXISTS `adminmenu_teleports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(30) NOT NULL DEFAULT 'special',
  `description` varchar(255) DEFAULT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.adminmenu_teleports: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Anticheat',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bans: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.bilto_admin_permission_presets
CREATE TABLE IF NOT EXISTS `bilto_admin_permission_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `preset_key` varchar(64) NOT NULL,
  `label` varchar(96) NOT NULL DEFAULT '',
  `permissions` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_preset_key` (`preset_key`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bilto_admin_permission_presets: ~5 rows (aproximadamente)
INSERT IGNORE INTO `bilto_admin_permission_presets` (`id`, `preset_key`, `label`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'fundador', 'Fundador', '{"spawnAdminHorse":true,"privateMessage":true,"upsertMultijobJob":true,"copyCoords":true,"togglePlayerWall":true,"teleportToCoords":true,"setJob":true,"viewBannedPlayers":true,"renameCharacter":true,"removeJob":true,"togglePlayerBlips":true,"addMoney":true,"all_permissions":true,"editBan":true,"checkItemCapacity":true,"removeMoney":true,"addWeight":true,"changeHeight":true,"openInventory":true,"banPlayer":true,"toggleNoclip":true,"viewUtilitiesPanel":true,"manageTeleportLocations":true,"openCompanyStash":true,"kick":true,"executeLightning":true,"revive":true,"clearInventory":true,"addSlots":true,"addItem":true,"spectate":true,"goto":true,"removeBan":true,"heal":true,"manage_permissions":true,"toggleFreeze":true,"bring":true}', '2026-10-25 23:21:53', '2026-10-25 23:21:53'),
	(2, 'developer', 'Developer', '{"spawnAdminHorse":true,"privateMessage":true,"upsertMultijobJob":true,"copyCoords":true,"togglePlayerWall":true,"teleportToCoords":true,"setJob":true,"viewBannedPlayers":true,"renameCharacter":true,"removeJob":true,"togglePlayerBlips":true,"addMoney":true,"all_permissions":true,"editBan":true,"checkItemCapacity":true,"removeMoney":true,"addWeight":true,"changeHeight":true,"openInventory":true,"banPlayer":true,"toggleNoclip":true,"viewUtilitiesPanel":true,"manageTeleportLocations":true,"openCompanyStash":true,"kick":true,"executeLightning":true,"revive":true,"clearInventory":true,"addSlots":true,"addItem":true,"spectate":true,"goto":true,"removeBan":true,"heal":true,"manage_permissions":true,"toggleFreeze":true,"bring":true}', '2026-10-25 23:21:53', '2026-10-25 23:21:53'),
	(3, 'administrador', 'Administrador', '{"spawnAdminHorse":true,"privateMessage":true,"upsertMultijobJob":true,"copyCoords":true,"togglePlayerWall":true,"teleportToCoords":true,"setJob":true,"viewBannedPlayers":true,"renameCharacter":true,"removeJob":true,"togglePlayerBlips":true,"addMoney":true,"all_permissions":true,"editBan":true,"checkItemCapacity":true,"removeMoney":true,"addWeight":true,"changeHeight":true,"openInventory":true,"banPlayer":true,"toggleNoclip":true,"viewUtilitiesPanel":true,"manageTeleportLocations":true,"openCompanyStash":true,"kick":true,"executeLightning":true,"revive":true,"clearInventory":true,"addSlots":true,"addItem":true,"spectate":true,"goto":true,"removeBan":true,"heal":true,"manage_permissions":true,"toggleFreeze":true,"bring":true}', '2026-10-25 23:21:53', '2026-10-25 23:21:53'),
	(4, 'banimento', 'Banimento', '{"spawnAdminHorse":false,"privateMessage":false,"upsertMultijobJob":false,"copyCoords":false,"togglePlayerWall":false,"teleportToCoords":false,"setJob":false,"viewBannedPlayers":false,"renameCharacter":false,"removeJob":false,"togglePlayerBlips":false,"addMoney":false,"all_permissions":false,"editBan":false,"checkItemCapacity":false,"removeMoney":false,"addWeight":false,"changeHeight":false,"openInventory":false,"banPlayer":false,"toggleNoclip":false,"viewUtilitiesPanel":false,"manageTeleportLocations":false,"openCompanyStash":false,"kick":false,"executeLightning":false,"revive":false,"clearInventory":false,"addSlots":false,"addItem":false,"spectate":false,"goto":false,"removeBan":false,"heal":false,"manage_permissions":false,"toggleFreeze":false,"bring":false}', '2026-10-25 23:21:53', '2026-10-25 23:21:53'),
	(5, 'suporte', 'Suporte', '{"spawnAdminHorse":false,"privateMessage":false,"upsertMultijobJob":false,"copyCoords":false,"togglePlayerWall":false,"teleportToCoords":false,"setJob":false,"viewBannedPlayers":false,"renameCharacter":false,"removeJob":false,"togglePlayerBlips":false,"addMoney":false,"all_permissions":false,"editBan":false,"checkItemCapacity":false,"removeMoney":false,"addWeight":false,"changeHeight":false,"openInventory":false,"banPlayer":false,"toggleNoclip":false,"viewUtilitiesPanel":false,"manageTeleportLocations":false,"openCompanyStash":false,"kick":false,"executeLightning":false,"revive":false,"clearInventory":false,"addSlots":false,"addItem":false,"spectate":false,"goto":false,"removeBan":false,"heal":false,"manage_permissions":false,"toggleFreeze":false,"bring":false}', '2026-10-25 23:21:53', '2026-10-25 23:21:53');

-- Copiando estrutura para tabela londres-s1.bilto_admin_permissions
CREATE TABLE IF NOT EXISTS `bilto_admin_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citzenid` varchar(64) NOT NULL,
  `name` varchar(96) NOT NULL DEFAULT '',
  `granted_by` varchar(96) NOT NULL DEFAULT '',
  `preset_key` varchar(64) NOT NULL DEFAULT '',
  `permissions` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_citzenid` (`citzenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bilto_admin_permissions: ~0 rows (aproximadamente)
INSERT IGNORE INTO `bilto_admin_permissions` (`id`, `citzenid`, `name`, `granted_by`, `preset_key`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'kpp16072', 'Bilto Maldonado', 'Bilto Maldonado', 'headadmin', '{"toggleNoclip":true,"openInventory":true,"toggleFreeze":true,"setJob":true,"manageTeleportLocations":true,"goto":true,"openCompanyStash":true,"bring":true,"removeMoney":true,"revive":true,"togglePlayerBlips":true,"addWeight":true,"addMoney":true,"viewUtilitiesPanel":true,"removeBan":true,"spawnAdminHorse":true,"renameCharacter":true,"all_permissions":true,"banPlayer":true,"heal":true,"clearInventory":true,"executeLightning":true,"removeJob":true,"kick":true,"teleportToCoords":true,"spectate":true,"checkItemCapacity":true,"addItem":true,"upsertMultijobJob":true,"privateMessage":true,"togglePlayerWall":true,"copyCoords":true,"addSlots":true,"changeHeight":true,"editBan":true,"viewBannedPlayers":true}', '2026-10-26 03:28:48', '2026-10-26 03:28:48');

-- Copiando estrutura para tabela londres-s1.bilto_admin_role_permissions
CREATE TABLE IF NOT EXISTS `bilto_admin_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `preset_key` varchar(64) NOT NULL,
  `label` varchar(96) NOT NULL DEFAULT '',
  `permissions` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_preset_key` (`preset_key`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bilto_admin_role_permissions: ~5 rows (aproximadamente)
INSERT IGNORE INTO `bilto_admin_role_permissions` (`id`, `preset_key`, `label`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, 'headadmin', 'Head Admin', '{"toggleNoclip":true,"openInventory":true,"toggleFreeze":true,"setJob":true,"manageTeleportLocations":true,"goto":true,"openCompanyStash":true,"bring":true,"removeMoney":true,"revive":true,"togglePlayerBlips":true,"addWeight":true,"addMoney":true,"viewUtilitiesPanel":true,"removeBan":true,"spawnAdminHorse":true,"renameCharacter":true,"all_permissions":true,"banPlayer":true,"heal":true,"clearInventory":true,"executeLightning":true,"removeJob":true,"kick":true,"teleportToCoords":true,"spectate":true,"checkItemCapacity":true,"addItem":true,"upsertMultijobJob":true,"privateMessage":true,"togglePlayerWall":true,"copyCoords":true,"addSlots":true,"changeHeight":true,"editBan":true,"viewBannedPlayers":true}', '2026-10-26 03:25:51', '2026-10-26 03:28:35'),
	(2, 'developer', 'Developer', '{"removeBan":true,"clearInventory":true,"upsertMultijobJob":true,"goto":true,"openInventory":true,"changeHeight":true,"setJob":true,"toggleNoclip":true,"spectate":true,"openCompanyStash":true,"addMoney":true,"banPlayer":true,"manageTeleportLocations":true,"addSlots":true,"heal":true,"copyCoords":true,"executeLightning":true,"bring":true,"spawnAdminHorse":true,"teleportToCoords":true,"viewBannedPlayers":true,"removeJob":true,"all_permissions":false,"renameCharacter":true,"addWeight":true,"kick":true,"revive":true,"removeMoney":true,"toggleFreeze":true,"checkItemCapacity":true,"addItem":true,"privateMessage":true,"viewUtilitiesPanel":true,"editBan":true,"togglePlayerBlips":true,"togglePlayerWall":true}', '2026-10-26 03:25:51', '2026-10-26 03:25:51'),
	(3, 'admin', 'Admin', '{"removeBan":true,"clearInventory":true,"upsertMultijobJob":true,"goto":true,"openInventory":true,"changeHeight":true,"setJob":true,"toggleNoclip":true,"spectate":true,"openCompanyStash":true,"addMoney":false,"banPlayer":true,"manageTeleportLocations":true,"addSlots":false,"heal":true,"copyCoords":true,"executeLightning":true,"bring":true,"spawnAdminHorse":false,"teleportToCoords":true,"viewBannedPlayers":true,"removeJob":true,"all_permissions":false,"renameCharacter":true,"addWeight":false,"kick":true,"revive":true,"removeMoney":false,"toggleFreeze":true,"checkItemCapacity":true,"addItem":true,"privateMessage":true,"viewUtilitiesPanel":true,"editBan":true,"togglePlayerBlips":true,"togglePlayerWall":true}', '2026-10-26 03:25:51', '2026-10-26 03:25:51'),
	(4, 'mod', 'Moderador', '{"removeBan":false,"clearInventory":false,"upsertMultijobJob":false,"goto":true,"openInventory":true,"changeHeight":false,"setJob":false,"toggleNoclip":true,"spectate":true,"openCompanyStash":false,"addMoney":false,"banPlayer":true,"manageTeleportLocations":false,"addSlots":false,"heal":true,"copyCoords":true,"executeLightning":false,"bring":true,"spawnAdminHorse":false,"teleportToCoords":true,"viewBannedPlayers":true,"removeJob":false,"all_permissions":false,"renameCharacter":false,"addWeight":false,"kick":true,"revive":true,"removeMoney":false,"toggleFreeze":true,"checkItemCapacity":false,"addItem":false,"privateMessage":true,"viewUtilitiesPanel":true,"editBan":false,"togglePlayerBlips":true,"togglePlayerWall":true}', '2026-10-26 03:25:51', '2026-10-26 03:25:51'),
	(5, 'helper', 'Helper', '{"removeBan":false,"clearInventory":false,"upsertMultijobJob":false,"goto":true,"openInventory":false,"changeHeight":false,"setJob":false,"toggleNoclip":true,"spectate":true,"openCompanyStash":false,"addMoney":false,"banPlayer":false,"manageTeleportLocations":false,"addSlots":false,"heal":true,"copyCoords":true,"executeLightning":false,"bring":true,"spawnAdminHorse":false,"teleportToCoords":true,"viewBannedPlayers":false,"removeJob":false,"all_permissions":false,"renameCharacter":false,"addWeight":false,"kick":false,"revive":true,"removeMoney":false,"toggleFreeze":false,"checkItemCapacity":false,"addItem":false,"privateMessage":true,"viewUtilitiesPanel":true,"editBan":false,"togglePlayerBlips":false,"togglePlayerWall":false}', '2026-10-26 03:25:51', '2026-10-26 03:25:51');

-- Copiando estrutura para tabela londres-s1.bilto_admin_roles
CREATE TABLE IF NOT EXISTS `bilto_admin_roles` (
  `role` varchar(32) NOT NULL,
  `permissions` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bilto_admin_roles: ~5 rows (aproximadamente)
INSERT IGNORE INTO `bilto_admin_roles` (`role`, `permissions`, `updated_at`) VALUES
	('admin', '["copyCoords","viewBannedPlayers","viewUtilitiesPanel","goto","bring","revive","heal","executeLightning","toggleFreeze","spectate","openInventory","setJob","upsertMultijobJob","removeJob","addItem","renameCharacter","changeHeight","clearInventory","privateMessage","kick","banPlayer","editBan","removeBan","checkItemCapacity","togglePlayerBlips","togglePlayerWall","toggleNoclip","openCompanyStash","teleportToCoords","manageTeleportLocations"]', '2026-10-30 18:26:09'),
	('developer', '["copyCoords","viewBannedPlayers","viewUtilitiesPanel","goto","bring","revive","heal","executeLightning","toggleFreeze","spectate","openInventory","setJob","upsertMultijobJob","removeJob","addItem","addMoney","removeMoney","addWeight","addSlots","removeWeight","removeSlots","renameCharacter","changeHeight","clearInventory","privateMessage","kick","banPlayer","editBan","removeBan","checkItemCapacity","togglePlayerBlips","togglePlayerWall","toggleNoclip","spawnAdminHorse","openCompanyStash","teleportToCoords","manageTeleportLocations"]', '2026-10-30 18:26:09'),
	('headadmin', '["copyCoords","viewBannedPlayers","viewUtilitiesPanel","goto","bring","revive","heal","executeLightning","toggleFreeze","spectate","openInventory","setJob","upsertMultijobJob","removeJob","addItem","addMoney","removeMoney","addWeight","addSlots","removeWeight","removeSlots","renameCharacter","changeHeight","clearInventory","privateMessage","kick","banPlayer","editBan","removeBan","checkItemCapacity","togglePlayerBlips","togglePlayerWall","toggleNoclip","spawnAdminHorse","openCompanyStash","teleportToCoords","manageTeleportLocations"]', '2026-10-30 18:26:09'),
	('helper', '["copyCoords","viewUtilitiesPanel","goto","bring","revive","heal","spectate","privateMessage","toggleNoclip","teleportToCoords"]', '2026-10-30 18:26:09'),
	('mod', '["copyCoords","viewBannedPlayers","viewUtilitiesPanel","goto","bring","revive","heal","toggleFreeze","spectate","openInventory","privateMessage","kick","banPlayer","togglePlayerBlips","togglePlayerWall","toggleNoclip","teleportToCoords"]', '2026-10-30 18:26:09');

-- Copiando estrutura para tabela londres-s1.bilto_admin_staff
CREATE TABLE IF NOT EXISTS `bilto_admin_staff` (
  `citizenid` varchar(64) NOT NULL,
  `name` varchar(96) NOT NULL,
  `role` varchar(32) NOT NULL,
  `granted_by` varchar(96) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bilto_admin_staff: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.bilto_admin_teleports
CREATE TABLE IF NOT EXISTS `bilto_admin_teleports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(30) NOT NULL DEFAULT 'special',
  `description` varchar(255) NOT NULL DEFAULT '',
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `created_by` varchar(96) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.bilto_admin_teleports: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.bilto_hud
CREATE TABLE IF NOT EXISTS `bilto_hud` (
  `license` varchar(64) NOT NULL,
  `layout` longtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela londres-s1.bilto_hud: ~1 rows (aproximadamente)
INSERT IGNORE INTO `bilto_hud` (`license`, `layout`, `updated_at`) VALUES
	('license:f800f02b1b6980b09ae3e12fb5d9a14324d0ad71', '{"version":1,"elements":{"outlaw":{"color":"#e5484d","style":"hex","autoHide":false,"size":1,"icon":"star","iconColor":"#ffffff","visible":true,"x":51.536,"y":12.39,"showValue":false},"horse_clean":{"color":"#a58a66","style":"hex","autoHide":false,"size":1,"icon":"brush","iconColor":"#ffffff","visible":true,"x":52.902,"y":91.327,"showValue":false},"logo":{"color":"#ffffff","style":"plain","autoHide":false,"size":1,"icon":"image","iconColor":"#ffffff","visible":true,"x":50,"y":0,"showValue":false},"mail":{"color":"#f1c21b","style":"hex","autoHide":false,"size":1,"icon":"mail","iconColor":"#ffffff","visible":true,"x":48.464,"y":12.39,"showValue":false},"health":{"color":"#e5484d","style":"hex","autoHide":false,"size":1,"icon":"heart","iconColor":"#ffffff","visible":true,"x":41.293,"y":97.832,"showValue":false},"cash":{"color":"#4cc38a","style":"pill","autoHide":false,"size":1,"icon":"dollar","iconColor":"#4cc38a","visible":false,"x":98.761,"y":2.134,"showValue":false},"voice":{"color":"#ffffff","style":"hex","autoHide":false,"size":1,"icon":"mic","iconColor":"#ffffff","visible":true,"x":58.707,"y":97.832,"showValue":false},"stamina":{"color":"#f5d90a","style":"hex","autoHide":false,"size":1,"icon":"bolt","iconColor":"#ffffff","visible":true,"x":44.196,"y":97.832,"showValue":false},"id":{"color":"#ffffff","style":"pill","autoHide":false,"size":1,"icon":"idcard","iconColor":"#ffffff","visible":false,"x":98.789,"y":9.68,"showValue":false},"horse_stamina":{"color":"#e0a84f","style":"hex","autoHide":false,"size":1,"icon":"horseshoe","iconColor":"#ffffff","visible":true,"x":50,"y":91.327,"showValue":false},"thirst":{"color":"#3b9eff","style":"hex","autoHide":false,"size":1,"icon":"drop","iconColor":"#ffffff","visible":true,"x":50,"y":97.832,"showValue":false},"temp":{"color":"#ffb224","style":"pill","autoHide":false,"size":1,"icon":"thermo","iconColor":"#ffb224","visible":false,"x":98.791,"y":17.225,"showValue":false},"bloodmoney":{"color":"#e5484d","style":"pill","autoHide":false,"size":1,"icon":"coins","iconColor":"#e5484d","visible":false,"x":98.782,"y":24.771,"showValue":false},"bank":{"color":"#8da4ef","style":"pill","autoHide":false,"size":1,"icon":"bank","iconColor":"#8da4ef","visible":false,"x":98.782,"y":20.998,"showValue":false},"gold":{"color":"#f1c21b","style":"pill","autoHide":false,"size":1,"icon":"goldbars","iconColor":"#f1c21b","visible":false,"x":98.799,"y":5.907,"showValue":false},"hunger":{"color":"#f76b15","style":"hex","autoHide":false,"size":1,"icon":"drumstick","iconColor":"#ffffff","visible":true,"x":47.098,"y":97.832,"showValue":false},"horse_health":{"color":"#c27c2c","style":"hex","autoHide":false,"size":1,"icon":"horse","iconColor":"#ffffff","visible":true,"x":47.098,"y":91.327,"showValue":false},"stress":{"color":"#d6409f","style":"hex","autoHide":false,"size":1,"icon":"frown","iconColor":"#ffffff","visible":true,"x":55.804,"y":97.832,"showValue":false},"clock":{"color":"#ffffff","style":"pill","autoHide":false,"size":1,"icon":"clock","iconColor":"#ffffff","visible":true,"x":55.154,"y":4.12,"showValue":false},"cleanliness":{"color":"#7ce2fe","style":"hex","autoHide":false,"size":1,"icon":"sparkles","iconColor":"#ffffff","visible":true,"x":52.902,"y":97.832,"showValue":false}},"preset":"hexagonal","global":{"snap":true,"scale":1,"bgOpacity":0.55,"grid":2,"showGrid":true,"lowAlert":true,"opacity":1}}', '2026-10-26 06:31:57');

-- Copiando estrutura para tabela londres-s1.bilto_hud_presets
CREATE TABLE IF NOT EXISTS `bilto_hud_presets` (
  `license` varchar(64) NOT NULL,
  `presets` longtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela londres-s1.bilto_hud_presets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.bilto_natal_ranking
CREATE TABLE IF NOT EXISTS `bilto_natal_ranking` (
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `points` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela londres-s1.bilto_natal_ranking: ~1 rows (aproximadamente)
INSERT IGNORE INTO `bilto_natal_ranking` (`citizenid`, `name`, `points`, `updated_at`) VALUES
	('KPP16072', 'Bilto Maldonado', 5, '2026-10-28 20:12:07');

-- Copiando estrutura para tabela londres-s1.favorites_animations
CREATE TABLE IF NOT EXISTS `favorites_animations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `favorites` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.favorites_animations: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.horse_race_tracks
CREATE TABLE IF NOT EXISTS `horse_race_tracks` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`points`)),
  `timestamp` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.horse_race_tracks: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.inventories: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.management_funds: ~6 rows (aproximadamente)
INSERT IGNORE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'vallaw', 0, 'boss'),
	(2, 'rholaw', 0, 'boss'),
	(3, 'blklaw', 0, 'boss'),
	(4, 'strlaw', 0, 'boss'),
	(5, 'stdenlaw', 0, 'boss'),
	(6, 'medic', 0, 'boss');

-- Copiando estrutura para tabela londres-s1.mdt_audit_logs
CREATE TABLE IF NOT EXISTS `mdt_audit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` varchar(100) DEFAULT NULL,
  `target_name` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `performed_by` varchar(50) NOT NULL,
  `performed_by_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_action` (`action`),
  KEY `idx_performed_by` (`performed_by`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_audit_logs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `last_seen` varchar(255) DEFAULT NULL,
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_bolos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_charge_attachments
CREATE TABLE IF NOT EXISTS `mdt_charge_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `attached_by` varchar(50) NOT NULL,
  `attached_by_name` varchar(100) NOT NULL,
  `attached_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_charge_report` (`charge_id`,`report_id`),
  KEY `idx_charge_id` (`charge_id`),
  KEY `idx_report_id` (`report_id`),
  CONSTRAINT `mdt_charge_attachments_ibfk_1` FOREIGN KEY (`charge_id`) REFERENCES `mdt_issued_charges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mdt_charge_attachments_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_charge_attachments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_charge_templates
CREATE TABLE IF NOT EXISTS `mdt_charge_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `jailtime` int(11) DEFAULT 0,
  `category` varchar(50) DEFAULT 'misdemeanor',
  `created_by` varchar(50) DEFAULT NULL,
  `created_by_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_charge_templates: ~14 rows (aproximadamente)
INSERT IGNORE INTO `mdt_charge_templates` (`id`, `name`, `description`, `fine`, `jailtime`, `category`, `created_by`, `created_by_name`, `created_at`, `updated_at`) VALUES
	(1, 'Assault', 'Physical assault on another person', 50, 2, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(2, 'Battery', 'Unlawful physical force against another', 75, 3, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(3, 'Theft', 'Stealing property valued under $50', 25, 0, 'misdemeanor', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(4, 'Grand Theft', 'Stealing property valued $50 or more', 100, 6, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(5, 'Trespassing', 'Unauthorized entry onto private property', 15, 0, 'misdemeanor', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(6, 'Public Intoxication', 'Being drunk in public', 10, 0, 'infraction', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(7, 'Disorderly Conduct', 'Disturbing the peace', 20, 0, 'misdemeanor', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(8, 'Vandalism', 'Willful destruction of property', 30, 0, 'misdemeanor', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(9, 'Fraud', 'Deception for personal gain', 150, 12, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(10, 'Murder', 'Unlawful killing of another person', 0, 60, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(11, 'Horse Theft', 'Stealing a horse or other mount', 200, 24, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(12, 'Bank Robbery', 'Robbery of a banking institution', 500, 48, 'felony', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(13, 'Resisting Arrest', 'Resisting or fleeing from law enforcement', 50, 1, 'misdemeanor', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58'),
	(14, 'Obstruction of Justice', 'Interfering with law enforcement duties', 40, 0, 'misdemeanor', NULL, NULL, '2026-10-10 22:26:58', '2026-10-10 22:26:58');

-- Copiando estrutura para tabela londres-s1.mdt_citizen_profiles
CREATE TABLE IF NOT EXISTS `mdt_citizen_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `profile_picture` varchar(512) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_citizen_profiles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_fines
CREATE TABLE IF NOT EXISTS `mdt_fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `citizen_name` varchar(100) NOT NULL,
  `issued_charge_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`issued_charge_ids`)),
  `total_amount` int(11) NOT NULL DEFAULT 0,
  `due_date` timestamp NULL DEFAULT NULL,
  `status` enum('unpaid','paid','overdue') DEFAULT 'unpaid',
  `issued_at` timestamp NULL DEFAULT current_timestamp(),
  `paid_at` timestamp NULL DEFAULT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `paid_to_officer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`),
  KEY `idx_due_date` (`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_fines: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_issued_charges
CREATE TABLE IF NOT EXISTS `mdt_issued_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `citizen_name` varchar(100) NOT NULL,
  `charge_template_id` int(11) DEFAULT NULL,
  `charge_name` varchar(255) NOT NULL,
  `charge_description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `jailtime` int(11) DEFAULT 0,
  `time_served` int(11) DEFAULT 0,
  `is_served` tinyint(1) DEFAULT 0,
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `served_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_officer` (`officer`),
  KEY `idx_is_served` (`is_served`),
  KEY `charge_template_id` (`charge_template_id`),
  CONSTRAINT `mdt_issued_charges_ibfk_1` FOREIGN KEY (`charge_template_id`) REFERENCES `mdt_charge_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_issued_charges: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_records
CREATE TABLE IF NOT EXISTS `mdt_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `crime` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `jailtime` int(11) DEFAULT 0,
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_records: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_report_comments
CREATE TABLE IF NOT EXISTS `mdt_report_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `author` varchar(100) NOT NULL,
  `author_cid` varchar(50) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_report_id` (`report_id`),
  CONSTRAINT `mdt_report_comments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `mdt_reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_report_comments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT 'incident',
  `description` text DEFAULT NULL,
  `officers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`officers`)),
  `suspects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`suspects`)),
  `evidence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`evidence`)),
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_officer` (`officer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_reports: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_roles
CREATE TABLE IF NOT EXISTS `mdt_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_roles: ~3 rows (aproximadamente)
INSERT IGNORE INTO `mdt_roles` (`id`, `name`, `label`, `permissions`, `created_at`) VALUES
	(1, 'admin', 'Administrator', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": true}', '2026-10-10 22:26:58'),
	(2, 'supervisor', 'Supervisor', '{"canCreateRecords": true, "canDeleteRecords": true, "canManageWarrants": true, "isAdmin": false}', '2026-10-10 22:26:58'),
	(3, 'officer', 'Officer', '{"canCreateRecords": true, "canDeleteRecords": false, "canManageWarrants": false, "isAdmin": false}', '2026-10-10 22:26:58');

-- Copiando estrutura para tabela londres-s1.mdt_staff
CREATE TABLE IF NOT EXISTS `mdt_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT 'officer',
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_staff: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('active','served','expired') DEFAULT 'active',
  `officer` varchar(100) NOT NULL,
  `officer_cid` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.mdt_warrants: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.multijob_jobs
CREATE TABLE IF NOT EXISTS `multijob_jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `default_duty` tinyint(1) NOT NULL DEFAULT 1,
  `off_duty_pay` tinyint(1) NOT NULL DEFAULT 0,
  `grades` longtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.multijob_jobs: ~14 rows (aproximadamente)
INSERT IGNORE INTO `multijob_jobs` (`name`, `label`, `type`, `icon`, `default_duty`, `off_duty_pay`, `grades`, `updated_at`) VALUES
	('blklaw', 'Blackwater Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 17:26:58'),
	('downesranch', 'Downes Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 17:26:58'),
	('emeraldranch', 'Emerald Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 17:26:58'),
	('hangingdogranch', 'Hanging Dog Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 17:26:58'),
	('herbalist', 'Herbalist', NULL, NULL, 1, 0, '{"1":{"payment":0,"isboss":true,"name":"Master"},"0":{"payment":0,"name":"Apprentice"}}', '2026-10-14 17:26:58'),
	('hillhavenranch', 'Hill Haven Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 17:26:58'),
	('macfarranch', 'Macfarlane Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 17:26:58'),
	('medic', 'Medic', 'medic', 'fa-solid fa-user-nurse', 0, 0, '{"1":{"payment":25,"name":"Trainee"},"2":{"payment":50,"name":"Doctor"},"0":{"payment":5,"name":"Recruit"},"3":{"payment":75,"name":"Surgeon"},"4":{"payment":100,"isboss":true,"name":"Manager"}}', '2026-10-14 17:26:58'),
	('pronghornranch', 'Pronghorn Rancher', 'rancher', NULL, 1, 0, '{"1":{"payment":5,"name":"Ranch Hand"},"2":{"payment":0,"isboss":true,"name":"Ranch Manager"},"0":{"payment":3,"name":"Trainee Rancher"}}', '2026-10-14 17:26:58'),
	('rholaw', 'Rhodes Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 17:26:58'),
	('stdenlaw', 'Saint Denis Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 17:26:58'),
	('strlaw', 'Strawberry Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 17:26:58'),
	('unemployed', 'Civilian', NULL, NULL, 1, 0, '{"0":{"payment":3,"name":"Freelancer"}}', '2026-10-14 17:26:58'),
	('vallaw', 'Valentine Law Enforcement', 'leo', 'fa-solid fa-shield', 0, 0, '{"1":{"payment":25,"name":"Deputy"},"2":{"payment":50,"isboss":true,"name":"Sheriff"},"0":{"payment":10,"name":"Recruit"}}', '2026-10-14 17:26:58');

-- Copiando estrutura para tabela londres-s1.player_ammo
CREATE TABLE IF NOT EXISTS `player_ammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `ammo_revolver` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_express` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_revolver_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_express` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_pistol_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_express` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_repeater_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_express` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_express_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_high_velocity` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_split_point` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_buckshot_incendiary` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_slug` int(3) NOT NULL DEFAULT 0,
  `ammo_shotgun_slug_explosive` int(3) NOT NULL DEFAULT 0,
  `ammo_rifle_elephant` int(3) NOT NULL DEFAULT 0,
  `ammo_22` int(3) NOT NULL DEFAULT 0,
  `ammo_22_tranquilizer` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_small_game` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_fire` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_poison` int(3) NOT NULL DEFAULT 0,
  `ammo_arrow_dynamite` int(3) NOT NULL DEFAULT 0,
  `ammo_molotov` int(3) NOT NULL DEFAULT 0,
  `ammo_tomahawk` int(3) NOT NULL DEFAULT 0,
  `ammo_tomahawk_ancient` int(3) NOT NULL DEFAULT 0,
  `ammo_dynamite` int(3) NOT NULL DEFAULT 0,
  `ammo_poisonbottle` int(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives` int(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives_drain` int(3) NOT NULL DEFAULT 0,
  `ammo_throwing_knives_poison` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas_hawkmoth` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas_intertwined` int(3) NOT NULL DEFAULT 0,
  `ammo_bolas_ironspiked` int(3) NOT NULL DEFAULT 0,
  `ammo_hatchet` int(3) NOT NULL DEFAULT 0,
  `ammo_hatchet_hunter` int(3) NOT NULL DEFAULT 0,
  `ammo_hatchet_cleaver` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_ammo: ~0 rows (aproximadamente)
INSERT IGNORE INTO `player_ammo` (`id`, `citizenid`, `ammo_revolver`, `ammo_revolver_express`, `ammo_revolver_express_explosive`, `ammo_revolver_high_velocity`, `ammo_revolver_split_point`, `ammo_pistol`, `ammo_pistol_express`, `ammo_pistol_express_explosive`, `ammo_pistol_high_velocity`, `ammo_pistol_split_point`, `ammo_repeater`, `ammo_repeater_express`, `ammo_repeater_express_explosive`, `ammo_repeater_high_velocity`, `ammo_repeater_split_point`, `ammo_rifle`, `ammo_rifle_express`, `ammo_rifle_express_explosive`, `ammo_rifle_high_velocity`, `ammo_rifle_split_point`, `ammo_shotgun`, `ammo_shotgun_buckshot_incendiary`, `ammo_shotgun_slug`, `ammo_shotgun_slug_explosive`, `ammo_rifle_elephant`, `ammo_22`, `ammo_22_tranquilizer`, `ammo_arrow`, `ammo_arrow_small_game`, `ammo_arrow_fire`, `ammo_arrow_poison`, `ammo_arrow_dynamite`, `ammo_molotov`, `ammo_tomahawk`, `ammo_tomahawk_ancient`, `ammo_dynamite`, `ammo_poisonbottle`, `ammo_throwing_knives`, `ammo_throwing_knives_drain`, `ammo_throwing_knives_poison`, `ammo_bolas`, `ammo_bolas_hawkmoth`, `ammo_bolas_intertwined`, `ammo_bolas_ironspiked`, `ammo_hatchet`, `ammo_hatchet_hunter`, `ammo_hatchet_cleaver`) VALUES
	(1, 'KPP16072', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Copiando estrutura para tabela londres-s1.player_backpack
CREATE TABLE IF NOT EXISTS `player_backpack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(32) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `backpackitem` varchar(50) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_backpack: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_birds
CREATE TABLE IF NOT EXISTS `player_birds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `preset` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_birds: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_dogs
CREATE TABLE IF NOT EXISTS `player_dogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `preset` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_dogs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_goldrockers
CREATE TABLE IF NOT EXISTS `player_goldrockers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `propid` int(11) NOT NULL,
  `proptype` varchar(50) DEFAULT NULL,
  `licensed` tinyint(1) NOT NULL DEFAULT 0,
  `claimname` varchar(100) DEFAULT NULL,
  `paydirt` int(3) NOT NULL DEFAULT 0,
  `water` int(3) NOT NULL DEFAULT 0,
  `quality` int(3) NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_goldrockers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_jobs: ~1 rows (aproximadamente)
INSERT IGNORE INTO `player_jobs` (`id`, `citizenid`, `job`, `grade`) VALUES
	(1, 'KPP16072', 'medic', 3),
	(2, 'KPP16072', 'emeraldranch', 2);

-- Copiando estrutura para tabela londres-s1.player_playtime
CREATE TABLE IF NOT EXISTS `player_playtime` (
  `citizenid` varchar(50) NOT NULL,
  `minutes` int(11) NOT NULL DEFAULT 0,
  `last_seen` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_playtime: ~0 rows (aproximadamente)
INSERT IGNORE INTO `player_playtime` (`citizenid`, `minutes`, `last_seen`) VALUES
	('KPP16072', 172, '2026-10-26 07:40:16');

-- Copiando estrutura para tabela londres-s1.player_samples
CREATE TABLE IF NOT EXISTS `player_samples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `sample_id` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizenid_sampleid` (`citizenid`,`sample_id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_sample_id` (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_samples: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_selected_pets
CREATE TABLE IF NOT EXISTS `player_selected_pets` (
  `identifier` varchar(50) NOT NULL,
  `charid` int(11) NOT NULL,
  `selected_dog` int(11) DEFAULT NULL,
  `selected_bird` int(11) DEFAULT NULL,
  UNIQUE KEY `uc_player` (`identifier`,`charid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_selected_pets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_smelter
CREATE TABLE IF NOT EXISTS `player_smelter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `propid` int(11) NOT NULL,
  `proptype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_smelter: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.player_weapons
CREATE TABLE IF NOT EXISTS `player_weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(16) NOT NULL,
  `citizenid` varchar(9) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  `components_before` varchar(4096) NOT NULL DEFAULT '{}',
  `price` decimal(5,2) NOT NULL DEFAULT 0.00,
  `town` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_weapons: ~8 rows (aproximadamente)
INSERT IGNORE INTO `player_weapons` (`id`, `serial`, `citizenid`, `components`, `components_before`, `price`, `town`) VALUES
	(1, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(2, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(3, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(4, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(5, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(6, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(7, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(8, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(9, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0),
	(10, '41HGy8Zb868YvEN', 'KPP16072', '{}', '{}', 0.00, 0);

-- Copiando estrutura para tabela londres-s1.player_weapons_custom
CREATE TABLE IF NOT EXISTS `player_weapons_custom` (
  `gunsiteid` varchar(20) NOT NULL,
  `propid` varchar(20) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `propdata` longtext NOT NULL,
  PRIMARY KEY (`gunsiteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.player_weapons_custom: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.playeroutfit
CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes` longtext DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.playeroutfit: ~0 rows (aproximadamente)
INSERT IGNORE INTO `playeroutfit` (`id`, `citizenid`, `name`, `clothes`, `is_default`) VALUES
	(1, 'KPP16072', 'Default', '[]', 1);

-- Copiando estrutura para tabela londres-s1.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `outlawstatus` int(11) NOT NULL DEFAULT 0,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `slots` int(11) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.players: ~1 rows (aproximadamente)
INSERT IGNORE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `outlawstatus`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `weight`, `slots`, `last_updated`) VALUES
	(1, 'KPP16072', 1, 'license:f800f02b1b6980b09ae3e12fb5d9a14324d0ad71', 'B', 0, '{"rhobank":0,"gold":0,"bank":12,"armbank":0,"bloodmoney":0,"valbank":1553.0,"cash":322043.6,"blkbank":0}', '{"nationality":"American","firstname":"Bilto","birthdate":"1870-01-01","account":"US09RSGCore1150150159","gender":0,"lastname":"Maldonado"}', '{"type":"none","name":"unemployed","label":"Civilian","isboss":false,"onduty":true,"payment":3,"grade":{"isboss":false,"level":0,"name":"Freelancer","payment":3}}', '{"isboss":false,"label":"No Gang","name":"none","grade":{"isboss":false,"level":0,"name":"Unaffiliated"}}', '{"x":-227.89450073242188,"y":2149.5166015625,"z":312.154541015625}', '{"equippedweapons":{"41HGy8Zb868YvEN":{"serie":"41HGy8Zb868YvEN","name":"weapon_rifle_boltaction"}},"armor":0,"thirst":86.18,"injail":0,"stress":0,"fingerprint":"JH338Y18QYS9016","rep":[],"hunger":90.78,"cleanliness":100,"status":[],"bloodtype":"B+","criminalrecord":{"hasRecord":false},"health":600,"isdead":false,"ishandcuffed":false,"callsign":"NO CALLSIGN","walletid":"RSG-39830417","addiction":{"subs":{"alcohol":{"craving":0,"level":0},"weed":{"craving":0,"level":0}},"rehab":0},"jailitems":[]}', '[{"slot":2,"name":"weapon_rifle_boltaction","info":{"quality":99.94999999999999,"serie":"41HGy8Zb868YvEN"},"amount":1},{"slot":3,"name":"ammo_box_rifle","info":[],"amount":7},{"slot":4,"name":"water","info":[],"amount":17},{"slot":5,"name":"bandage","info":[],"amount":2}]', 35000, 10, '2026-10-30 18:46:50');

-- Copiando estrutura para tabela londres-s1.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `skin` varchar(8000) NOT NULL,
  `clothes` varchar(8000) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.playerskins: ~0 rows (aproximadamente)
INSERT IGNORE INTO `playerskins` (`id`, `citizenid`, `skin`, `clothes`) VALUES
	(1, 'KPP16072', '{"chin_height":-5,"nose_size":-35,"nose_width":0,"chin_width":-25,"eyebrows_c1":52,"head":48,"upper_lip_width":-25,"mouth_x_pos":35,"upper_lip_depth":-5,"nose_angle":-15,"jaw_height":-40,"eyes_color":15,"body_size":4,"mouth_y_pos":-20,"ears_height":0,"hair":{"hash":613297523},"eyes_angle":-30,"lower_lip_height":20,"cheekbones_depth":-40,"chin_depth":-35,"cheekbones_width":-10,"lower_lip_width":-15,"nose_curvature":5,"nostrils_distance":5,"jaw_width":-10,"eyebrows_op":80,"skin_tone":4,"sex":1,"ears_width":30,"eyes_distance":-15,"ears_angle":30,"eyebrows_t":14,"eyelid_width":-40,"eyebrow_depth":-40,"eyelid_height":5,"ears_size":25,"eyebrow_width":-35,"cheekbones_height":15,"body_waist":16,"nose_height":-35,"face_width":25,"eyebrows_id":10,"jaw_depth":-25,"eyes_depth":-5,"teeth":5,"upper_lip_height":-5,"eyebrow_height":-20,"beard":{"hash":502538388},"mouth_width":-20,"mouth_depth":30}', '[]');

-- Copiando estrutura para tabela londres-s1.railroad_companies
CREATE TABLE IF NOT EXISTS `railroad_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT 1,
  `xp` int(11) NOT NULL DEFAULT 0,
  `missions_completed` int(11) NOT NULL DEFAULT 0,
  `total_earnings` float NOT NULL DEFAULT 0,
  `joined_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizen_company` (`citizenid`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_companies: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.railroad_companies_owned
CREATE TABLE IF NOT EXISTS `railroad_companies_owned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `owner_name` varchar(100) NOT NULL DEFAULT '',
  `company_name` varchar(100) DEFAULT NULL,
  `cash_register` float NOT NULL DEFAULT 0,
  `purchased_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company` (`company_id`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_companies_owned: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.railroad_company_supplies
CREATE TABLE IF NOT EXISTS `railroad_company_supplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_item` (`company_id`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_company_supplies: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.railroad_company_upgrades
CREATE TABLE IF NOT EXISTS `railroad_company_upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `train_model` varchar(50) NOT NULL,
  `upgrade_speed` int(11) NOT NULL DEFAULT 0,
  `upgrade_fuel_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_water_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_durability` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_model` (`company_id`,`train_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_company_upgrades: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.railroad_employees
CREATE TABLE IF NOT EXISTS `railroad_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `xp` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 1,
  `missions_completed` int(11) NOT NULL DEFAULT 0,
  `total_earnings` float NOT NULL DEFAULT 0,
  `applied_at` timestamp NULL DEFAULT current_timestamp(),
  `approved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_company_citizen` (`company_id`,`citizenid`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_employees: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.railroad_rewards
CREATE TABLE IF NOT EXISTS `railroad_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `reward_id` varchar(50) NOT NULL DEFAULT '',
  `claimed_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_citizen_reward` (`citizenid`,`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_rewards: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.railroad_trains
CREATE TABLE IF NOT EXISTS `railroad_trains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '',
  `company_id` varchar(50) NOT NULL DEFAULT '',
  `train_model` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL DEFAULT '',
  `fuel` int(11) NOT NULL DEFAULT 100,
  `water` int(11) NOT NULL DEFAULT 100,
  `condition` int(11) NOT NULL DEFAULT 100,
  `upgrade_speed` int(11) NOT NULL DEFAULT 0,
  `upgrade_fuel_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_water_cap` int(11) NOT NULL DEFAULT 0,
  `upgrade_durability` int(11) NOT NULL DEFAULT 0,
  `total_miles` float NOT NULL DEFAULT 0,
  `is_parked` tinyint(1) NOT NULL DEFAULT 1,
  `parked_station` varchar(50) DEFAULT NULL,
  `parked_direction` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.railroad_trains: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_auction_bids
CREATE TABLE IF NOT EXISTS `rsg_auction_bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auction_id` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `player_name` varchar(100) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `is_buyout` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_auction` (`auction_id`),
  CONSTRAINT `fk_auction_bids_auction` FOREIGN KEY (`auction_id`) REFERENCES `rsg_auctions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_auction_bids: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_auction_collections
CREATE TABLE IF NOT EXISTS `rsg_auction_collections` (
  `id` varchar(100) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `auction_id` varchar(50) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_label` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `sold_for` bigint(20) NOT NULL DEFAULT 0,
  `seller_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_auction_collections: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_auction_collections` (`id`, `citizenid`, `auction_id`, `item_name`, `item_label`, `count`, `metadata`, `sold_for`, `seller_name`, `created_at`) VALUES
	('AUC_1793000384_5181_1793029495_4307_1', 'KPP16072', 'AUC_1793000384_5181', 'emptybottle', 'Empty Glass Bottle', 1, '[]', 0, 'Bilto Maldonado', '2026-10-26 15:44:55');

-- Copiando estrutura para tabela londres-s1.rsg_auction_payouts
CREATE TABLE IF NOT EXISTS `rsg_auction_payouts` (
  `citizenid` varchar(50) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_auction_payouts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_auctions
CREATE TABLE IF NOT EXISTS `rsg_auctions` (
  `id` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_label` varchar(100) NOT NULL,
  `item_count` int(11) NOT NULL,
  `item_metadata` longtext DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `location_label` varchar(100) NOT NULL,
  `starting_bid` bigint(20) NOT NULL,
  `current_bid` bigint(20) NOT NULL DEFAULT 0,
  `buyout_price` bigint(20) DEFAULT NULL,
  `highest_bidder_citizenid` varchar(50) DEFAULT NULL,
  `highest_bidder_name` varchar(100) DEFAULT NULL,
  `winner_citizenid` varchar(50) DEFAULT NULL,
  `winner_name` varchar(100) DEFAULT NULL,
  `sold_for` bigint(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `total_bids` int(11) NOT NULL DEFAULT 0,
  `creation_fee` bigint(20) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `escrow_item` tinyint(1) NOT NULL DEFAULT 0,
  `escrow_amount` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_auctions: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_auctions` (`id`, `owner_citizenid`, `owner_name`, `item_name`, `item_label`, `item_count`, `item_metadata`, `category`, `location`, `location_label`, `starting_bid`, `current_bid`, `buyout_price`, `highest_bidder_citizenid`, `highest_bidder_name`, `winner_citizenid`, `winner_name`, `sold_for`, `status`, `total_bids`, `creation_fee`, `created_at`, `end_time`, `escrow_item`, `escrow_amount`) VALUES
	('AUC_1793000384_5181', 'KPP16072', 'Bilto Maldonado', 'emptybottle', 'Empty Glass Bottle', 1, '[]', 'other', 'valentine', 'Valentine', 100, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ended', 0, 70, 1793000384, 1793003984, 0, 0);

-- Copiando estrutura para tabela londres-s1.rsg_bank_accounts
CREATE TABLE IF NOT EXISTS `rsg_bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_accounts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_bank_accounts_old
CREATE TABLE IF NOT EXISTS `rsg_bank_accounts_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_accounts_old: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_bank_accounts_old` (`id`, `citizenid`, `bank`, `balance`, `created_at`) VALUES
	(1, 'KPP16072', 'rhodes', 0.00, '2026-10-26 03:26:54');

-- Copiando estrutura para tabela londres-s1.rsg_bank_home
CREATE TABLE IF NOT EXISTS `rsg_bank_home` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_home: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_bank_home` (`citizenid`, `bank`) VALUES
	('KPP16072', 'rhodes');

-- Copiando estrutura para tabela londres-s1.rsg_bank_loans
CREATE TABLE IF NOT EXISTS `rsg_bank_loans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `principal` decimal(12,2) NOT NULL,
  `owed` decimal(12,2) NOT NULL,
  `due_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `late` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizen_bank` (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_loans: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_bank_lockbox_items
CREATE TABLE IF NOT EXISTS `rsg_bank_lockbox_items` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `item` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citizenid`,`bank`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_lockbox_items: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_bank_lockboxes
CREATE TABLE IF NOT EXISTS `rsg_bank_lockboxes` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  `upgrades` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_lockboxes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_bank_meta
CREATE TABLE IF NOT EXISTS `rsg_bank_meta` (
  `k` varchar(50) NOT NULL,
  `v` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_meta: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_bank_meta` (`k`, `v`) VALUES
	('core_migrated', '2026-10-25 19:25:42');

-- Copiando estrutura para tabela londres-s1.rsg_bank_opened
CREATE TABLE IF NOT EXISTS `rsg_bank_opened` (
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `opened_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_fee_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`citizenid`,`bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_opened: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_bank_opened` (`citizenid`, `bank`, `opened_at`, `last_fee_at`) VALUES
	('KPP16072', 'valbank', '2026-10-26 16:25:33', '2026-10-26 16:25:33');

-- Copiando estrutura para tabela londres-s1.rsg_bank_transactions
CREATE TABLE IF NOT EXISTS `rsg_bank_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizen_bank_idx` (`citizenid`,`bank`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_bank_transactions: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_bank_transactions` (`id`, `citizenid`, `bank`, `type`, `amount`, `note`, `created_at`) VALUES
	(1, 'KPP16072', 'rhodes', 'opened', 5.00, NULL, '2026-10-26 03:26:55');

-- Copiando estrutura para tabela londres-s1.rsg_beehives
CREATE TABLE IF NOT EXISTS `rsg_beehives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `activated_at` int(10) unsigned DEFAULT NULL,
  `food` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `water` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `health` tinyint(3) unsigned NOT NULL DEFAULT 100,
  `honey` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `smoked_until` int(10) unsigned DEFAULT NULL,
  `prop` varchar(50) NOT NULL DEFAULT 'bee_house_gk_1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_beehives: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_cooking_campfires
CREATE TABLE IF NOT EXISTS `rsg_cooking_campfires` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `expires` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_cooking_campfires: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_cooking_stations
CREATE TABLE IF NOT EXISTS `rsg_cooking_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `world` tinyint(1) NOT NULL DEFAULT 0,
  `stype` varchar(20) NOT NULL DEFAULT 'campfire',
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `recipe` varchar(50) DEFAULT NULL,
  `hopper` longtext DEFAULT NULL,
  `output` int(11) NOT NULL DEFAULT 0,
  `fuel` int(11) NOT NULL DEFAULT 0,
  `batch_left` int(11) DEFAULT NULL,
  `last_tick` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_cooking_stations: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_doorlocks
CREATE TABLE IF NOT EXISTS `rsg_doorlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `doors` longtext NOT NULL,
  `text_coords` longtext NOT NULL,
  `jobs` longtext NOT NULL,
  `distance` float NOT NULL DEFAULT 1.25,
  `locked` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_doorlocks: ~37 rows (aproximadamente)
INSERT IGNORE INTO `rsg_doorlocks` (`id`, `name`, `doors`, `text_coords`, `jobs`, `distance`, `locked`) VALUES
	(1, 'Imported door 1988748538', '[{"hash":1988748538,"coords":{"y":802.591064453125,"x":-276.0126037597656,"z":118.41165161132813}}]', '{"y":802.591064453125,"x":-276.0126037597656,"z":119.41165161132813}', '["vallaw"]', 3, 1),
	(2, 'Imported door 395506985', '[{"hash":395506985,"coords":{"y":812.0270385742188,"x":-275.8447570800781,"z":118.41483306884766}}]', '{"y":812.0270385742188,"x":-275.8447570800781,"z":119.41483306884766}', '["vallaw"]', 3, 1),
	(3, 'Imported door 1508776842', '[{"hash":1508776842,"coords":{"y":810.0264892578125,"x":-270.76641845703127,"z":118.39580535888672}}]', '{"y":810.0264892578125,"x":-270.76641845703127,"z":119.39580535888672}', '["vallaw"]', 1, 1),
	(4, 'Imported door 535323366', '[{"hash":535323366,"coords":{"y":809.2740478515625,"x":-275.0232849121094,"z":118.36856842041016}}]', '{"y":809.2740478515625,"x":-275.0232849121094,"z":119.36856842041016}', '["vallaw"]', 2, 1),
	(5, 'Imported door 295355979', '[{"hash":295355979,"coords":{"y":809.966064453125,"x":-273.4643249511719,"z":118.36823272705078}}]', '{"y":809.966064453125,"x":-273.4643249511719,"z":119.36823272705078}', '["vallaw"]', 1, 1),
	(6, 'Imported door 193903155', '[{"hash":193903155,"coords":{"y":808.25830078125,"x":-272.0520935058594,"z":118.36851501464844}}]', '{"y":808.25830078125,"x":-272.0520935058594,"z":119.36851501464844}', '["vallaw"]', 1, 1),
	(7, 'Imported door 349074475', '[{"hash":349074475,"coords":{"y":-1305.9600830078126,"x":1359.710205078125,"z":76.76842498779297}}]', '{"y":-1305.9600830078126,"x":1359.710205078125,"z":77.76842498779297}', '["rholaw"]', 3, 1),
	(8, 'Imported door 1614494720', '[{"hash":1614494720,"coords":{"y":-1297.5343017578126,"x":1359.097900390625,"z":76.78761291503906}}]', '{"y":-1297.5343017578126,"x":1359.097900390625,"z":77.78761291503906}', '["rholaw"]', 3, 1),
	(9, 'Imported door 1878514758', '[{"hash":1878514758,"coords":{"y":-1302.4530029296876,"x":1357.3343505859376,"z":76.76018524169922}}]', '{"y":-1302.4530029296876,"x":1357.3343505859376,"z":76.76018524169922}', '["rholaw"]', 1.5, 1),
	(10, 'Imported door 3410720590', '[{"hash":3410720590,"coords":{"y":-1268.485107421875,"x":-757.0421752929688,"z":43.068603515625}},{"hash":3821185084,"coords":{"y":-1269.9234619140626,"x":-757.0421142578125,"z":43.06863021850586}}]', '{"y":-1269.3399658203126,"x":-757.27001953125,"z":44.04000091552734}', '["blklaw"]', 3, 1),
	(11, 'Imported door 2810801921', '[{"hash":2810801921,"coords":{"y":-1268.7451171875,"x":-769.1370849609375,"z":43.0400390625}}]', '{"y":-1268.7451171875,"x":-769.1370849609375,"z":44.0400390625}', '["blklaw"]', 3, 1),
	(12, 'Imported door 2167775834', '[{"hash":2167775834,"coords":{"y":-1262.4608154296876,"x":-763.52783203125,"z":43.02327346801758}}]', '{"y":-1262.4608154296876,"x":-763.52783203125,"z":44.02327346801758}', '["blklaw"]', 1, 1),
	(13, 'Imported door 2514996159', '[{"hash":2514996159,"coords":{"y":-1264.7044677734376,"x":-765.8607788085938,"z":43.02326965332031}}]', '{"y":-1264.7044677734376,"x":-765.8607788085938,"z":44.02326965332031}', '["blklaw"]', 1, 1),
	(14, 'Imported door 1821044729', '[{"hash":1821044729,"coords":{"y":-350.31280517578127,"x":-1806.6751708984376,"z":163.64759826660157}}]', '{"y":-350.31280517578127,"x":-1806.6751708984376,"z":164.64759826660157}', '["strlaw"]', 3, 1),
	(15, 'Imported door 902070893', '[{"hash":902070893,"coords":{"y":-353.1470947265625,"x":-1814.400390625,"z":160.44180297851563}}]', '{"y":-353.1470947265625,"x":-1814.400390625,"z":161.44180297851563}', '["strlaw"]', 1.5, 1),
	(16, 'Imported door 1207903970', '[{"hash":1207903970,"coords":{"y":-351.92095947265627,"x":-1812.0101318359376,"z":160.46839904785157}}]', '{"y":-351.92095947265627,"x":-1812.0101318359376,"z":161.46839904785157}', '["strlaw"]', 1.5, 1),
	(17, 'Imported door 1514359658', '[{"hash":1514359658,"coords":{"y":-345.08489990234377,"x":-1812.669189453125,"z":163.64759826660157}}]', '{"y":-345.08489990234377,"x":-1812.669189453125,"z":164.64759826660157}', '["strlaw"]', 3, 1),
	(18, 'Imported door 417663242', '[{"hash":417663242,"coords":{"y":-1309.9276123046876,"x":2516.144287109375,"z":47.95257186889648}},{"hash":1611175760,"coords":{"y":-1307.724853515625,"x":2516.14453125,"z":47.95257186889648}}]', '{"y":-1309.9276123046876,"x":2516.144287109375,"z":48.95257186889648}', '["stdenlaw"]', 1.5, 1),
	(19, 'Imported door 3601535313', '[{"hash":3601535313,"coords":{"y":-1312.2154541015626,"x":2510.90771484375,"z":47.95257186889648}},{"hash":3430284519,"coords":{"y":-1310.4840087890626,"x":2510.90771484375,"z":47.95257186889648}}]', '{"y":-1312.2154541015626,"x":2510.90771484375,"z":48.95257186889648}', '["stdenlaw"]', 1.5, 1),
	(20, 'Imported door 3124713594', '[{"hash":3124713594,"coords":{"y":-1307.141357421875,"x":2510.90771484375,"z":47.95716857910156}},{"hash":1879655431,"coords":{"y":-1305.41162109375,"x":2510.90771484375,"z":47.95716857910156}}]', '{"y":-1307.141357421875,"x":2510.90771484375,"z":48.95716857910156}', '["stdenlaw"]', 1.5, 1),
	(21, 'Imported door 1020479727', '[{"hash":1020479727,"coords":{"y":-1317.2796630859376,"x":2508.337646484375,"z":47.95257186889648}},{"hash":603068205,"coords":{"y":-1317.2796630859376,"x":2506.606201171875,"z":47.95257186889648}}]', '{"y":-1317.2796630859376,"x":2508.337646484375,"z":48.95257186889648}', '["stdenlaw"]', 1.5, 1),
	(22, 'Imported door 305296302', '[{"hash":305296302,"coords":{"y":-1317.28271484375,"x":2497.684814453125,"z":47.95257186889648}},{"hash":2503834054,"coords":{"y":-1317.28271484375,"x":2495.953369140625,"z":47.95257186889648}}]', '{"y":-1317.28271484375,"x":2497.684814453125,"z":48.95257186889648}', '["stdenlaw"]', 1.5, 1),
	(23, 'Imported door 1992193795', '[{"hash":1992193795,"coords":{"y":-1311.95654296875,"x":2493.37255859375,"z":47.95257186889648}},{"hash":1694749582,"coords":{"y":-1310.2252197265626,"x":2493.37255859375,"z":47.95257186889648}}]', '{"y":-1311.95654296875,"x":2493.37255859375,"z":48.95257186889648}', '["stdenlaw"]', 1.5, 1),
	(24, 'Imported door 1979938193', '[{"hash":1979938193,"coords":{"y":-1307.41845703125,"x":2493.37255859375,"z":47.95257186889648}},{"hash":1674105116,"coords":{"y":-1305.68701171875,"x":2493.37255859375,"z":47.95257186889648}}]', '{"y":-1307.41845703125,"x":2493.37255859375,"z":48.95257186889648}', '["stdenlaw"]', 1.5, 1),
	(25, 'Imported door 3365520707', '[{"hash":3365520707,"coords":{"y":-1307.85595703125,"x":2498.5,"z":47.95327377319336}}]', '{"y":-1307.85595703125,"x":2498.5,"z":48.95327377319336}', '["stdenlaw"]', 1, 1),
	(26, 'Imported door 1995743734', '[{"hash":1995743734,"coords":{"y":-1309.8763427734376,"x":2499.752197265625,"z":47.95327377319336}}]', '{"y":-1309.8763427734376,"x":2499.752197265625,"z":48.95327377319336}', '["stdenlaw"]', 1, 1),
	(27, 'Imported door 1711767580', '[{"hash":1711767580,"coords":{"y":-1307.85595703125,"x":2502.4296875,"z":47.95327377319336}}]', '{"y":-1307.85595703125,"x":2502.4296875,"z":48.95327377319336}', '["stdenlaw"]', 1, 1),
	(28, 'Imported door 2515591150', '[{"hash":2515591150,"coords":{"y":-1309.8763427734376,"x":2503.638671875,"z":47.95327377319336}}]', '{"y":-1309.8763427734376,"x":2503.638671875,"z":48.95327377319336}', '["stdenlaw"]', 1, 1),
	(29, 'Imported door 1692000954', '[{"hash":1692000954,"coords":{"y":-700.0700073242188,"x":3331.85009765625,"z":43.09000015258789}}]', '{"y":-700.0700073242188,"x":3331.85009765625,"z":43.09000015258789}', '[]', 3, 1),
	(30, 'Imported door -1819721708', '[{"hash":-1819721708,"coords":{"y":-702.02001953125,"x":3333.60009765625,"z":43.09000015258789}}]', '{"y":-702.02001953125,"x":3333.60009765625,"z":43.09000015258789}', '[]', 3, 1),
	(31, 'Imported door 559643844', '[{"hash":559643844,"coords":{"y":-648.0,"x":3350.699951171875,"z":44.4000015258789}}]', '{"y":-648.0,"x":3350.699951171875,"z":44.4000015258789}', '[]', 1.5, 1),
	(32, 'Imported door 559643844', '[{"hash":559643844,"coords":{"y":-645.280029296875,"x":3349.9599609375,"z":44.40999984741211}}]', '{"y":-645.280029296875,"x":3349.9599609375,"z":44.40999984741211}', '[]', 1.5, 1),
	(33, 'Imported door 4249790129', '[{"hash":4249790129,"coords":{"y":-639.477783203125,"x":3384.615478515625,"z":45.4660758972168}}]', '{"y":-639.477783203125,"x":3384.615478515625,"z":45.4660758972168}', '[]', 1.5, 1),
	(34, 'Imported door 559643844', '[{"hash":559643844,"coords":{"y":-680.1199951171875,"x":3366.449951171875,"z":45.4900016784668}}]', '{"y":-680.1199951171875,"x":3366.449951171875,"z":45.4900016784668}', '[]', 1.5, 1),
	(35, 'Imported door 559643844', '[{"hash":559643844,"coords":{"y":-723.5900268554688,"x":3369.56005859375,"z":44.31000137329101}}]', '{"y":-723.5900268554688,"x":3369.56005859375,"z":44.31000137329101}', '[]', 1.5, 1),
	(36, 'Imported door 559643844', '[{"hash":559643844,"coords":{"y":-677.719970703125,"x":3407.31005859375,"z":45.5}}]', '{"y":-677.719970703125,"x":3407.31005859375,"z":45.5}', '[]', 1.5, 1),
	(37, 'Imported door -1694920053', '[{"hash":-1694920053,"coords":{"y":-658.0032348632813,"x":3318.453125,"z":44.8508186340332}}]', '{"y":-658.0032348632813,"x":3318.453125,"z":44.8508186340332}', '[]', 1.5, 1);

-- Copiando estrutura para tabela londres-s1.rsg_drugs_labs
CREATE TABLE IF NOT EXISTS `rsg_drugs_labs` (
  `citizenid` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_drugs_labs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_farming_plants
CREATE TABLE IF NOT EXISTS `rsg_farming_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `crop` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `h` float NOT NULL DEFAULT 0,
  `growth` float NOT NULL DEFAULT 0,
  `water` float NOT NULL DEFAULT 0,
  `fertilizer` float NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 100,
  `dead` tinyint(1) NOT NULL DEFAULT 0,
  `dead_time` int(11) NOT NULL DEFAULT 0,
  `planted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_farming_plants: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_farming_wellpumps
CREATE TABLE IF NOT EXISTS `rsg_farming_wellpumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `h` float NOT NULL DEFAULT 0,
  `placed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_farming_wellpumps: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_housekeys
CREATE TABLE IF NOT EXISTS `rsg_housekeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0,
  `perm_doors` tinyint(1) NOT NULL DEFAULT 1,
  `perm_storage` tinyint(1) NOT NULL DEFAULT 1,
  `perm_wardrobe` tinyint(1) NOT NULL DEFAULT 1,
  `perm_mailbox` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_housekeys: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_housing
CREATE TABLE IF NOT EXISTS `rsg_housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(30) NOT NULL,
  `houseid` varchar(7) NOT NULL,
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL DEFAULT '0',
  `rented` tinyint(1) NOT NULL DEFAULT 0,
  `rent` int(11) NOT NULL DEFAULT 0,
  `rent_due` datetime DEFAULT NULL,
  `reminder_sent` tinyint(1) NOT NULL DEFAULT 0,
  `custom_name` varchar(30) DEFAULT NULL,
  `storage_tier` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_houseid` (`houseid`),
  KEY `idx_rented` (`rented`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_housing: ~48 rows (aproximadamente)
INSERT IGNORE INTO `rsg_housing` (`id`, `region`, `houseid`, `citizenid`, `fullname`, `rented`, `rent`, `rent_due`, `reminder_sent`, `custom_name`, `storage_tier`) VALUES
	(1, 'newhanover', 'house1', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(2, 'westelizabeth', 'house2', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(3, 'newhanover', 'house3', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(4, 'lemoyne', 'house4', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(5, 'lemoyne', 'house5', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(6, 'lemoyne', 'house6', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(7, 'newaustin', 'house7', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(8, 'newhanover', 'house8', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(9, 'newhanover', 'house9', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(10, 'newhanover', 'house10', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(11, 'lemoyne', 'house11', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(12, 'lemoyne', 'house12', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(13, 'lemoyne', 'house13', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(14, 'lemoyne', 'house14', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(15, 'lemoyne', 'house15', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(16, 'lemoyne', 'house16', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(17, 'newhanover', 'house17', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(18, 'newhanover', 'house18', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(19, 'newhanover', 'house19', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(20, 'ambarino', 'house20', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(21, 'newhanover', 'house21', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(22, 'ambarino', 'house22', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(23, 'ambarino', 'house23', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(24, 'ambarino', 'house24', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(25, 'westelizabeth', 'house25', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(26, 'westelizabeth', 'house26', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(27, 'westelizabeth', 'house27', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(28, 'westelizabeth', 'house28', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(29, 'newaustin', 'house29', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(30, 'newaustin', 'house30', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(31, 'newaustin', 'house31', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(32, 'newaustin', 'house32', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(33, 'newaustin', 'house33', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(34, 'ambarino', 'house34', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(35, 'ambarino', 'house35', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(36, 'newhanover', 'house36', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(37, 'ambarino', 'house37', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(38, 'newhanover', 'house38', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(39, 'newhanover', 'house39', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(40, 'lemoyne', 'house40', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(41, 'lemoyne', 'house41', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(42, 'ambarino', 'house42', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(43, 'newaustin', 'house43', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(44, 'newhanover', 'house44', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(45, 'lemoyne', 'house45', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(46, 'westelizabeth', 'house46', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(47, 'newhanover', 'house47', '0', '0', 0, 50, NULL, 0, NULL, 1),
	(48, 'westelizabeth', 'house48', '0', '0', 0, 50, NULL, 0, NULL, 1);

-- Copiando estrutura para tabela londres-s1.rsg_imaps
CREATE TABLE IF NOT EXISTS `rsg_imaps` (
  `hash` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `updated_by` varchar(64) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_imaps: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_lottery_config
CREATE TABLE IF NOT EXISTS `rsg_lottery_config` (
  `setting` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_lottery_config: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_lottery_config` (`setting`, `value`) VALUES
	('current_jackpot', '100');

-- Copiando estrutura para tabela londres-s1.rsg_lottery_draws
CREATE TABLE IF NOT EXISTS `rsg_lottery_draws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` date NOT NULL,
  `jackpot` int(11) NOT NULL,
  `winning_number` text DEFAULT NULL,
  `drawn_at` datetime DEFAULT NULL,
  `status` varchar(32) DEFAULT 'pending',
  `winner_citizenid` varchar(64) DEFAULT NULL,
  `winner_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `draw_date` (`draw_date`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_lottery_draws: ~5 rows (aproximadamente)
INSERT IGNORE INTO `rsg_lottery_draws` (`id`, `draw_date`, `jackpot`, `winning_number`, `drawn_at`, `status`, `winner_citizenid`, `winner_name`) VALUES
	(1, '2026-10-25', 100, '[1,4,8,9,15]', '2026-10-26 00:06:35', 'drawn', NULL, NULL),
	(7, '2026-10-26', 100, '[2,12,13,16,19]', '2026-10-28 16:45:15', 'drawn', NULL, NULL),
	(15, '2026-10-28', 100, '[1,9,13,15,19]', '2026-10-30 14:20:40', 'drawn', NULL, NULL),
	(16, '2026-10-30', 100, '[2,9,10,15,20]', '2026-11-01 13:34:58', 'drawn', NULL, NULL),
	(18, '2026-11-01', 100, NULL, NULL, 'pending', NULL, NULL);

-- Copiando estrutura para tabela londres-s1.rsg_lottery_tickets
CREATE TABLE IF NOT EXISTS `rsg_lottery_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `ticket_number` varchar(16) NOT NULL,
  `numbers` text NOT NULL,
  `draw_date` date NOT NULL,
  `purchased_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizen_draw` (`citizenid`,`draw_date`),
  KEY `idx_draw` (`draw_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_lottery_tickets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_lottery_winners
CREATE TABLE IF NOT EXISTS `rsg_lottery_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` date NOT NULL,
  `citizenid` varchar(64) NOT NULL,
  `winner_name` varchar(128) NOT NULL,
  `prize` int(11) NOT NULL,
  `match_count` int(11) NOT NULL,
  `win_type` varchar(32) NOT NULL DEFAULT 'regular',
  `collected` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_citizen_collected` (`citizenid`,`collected`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_lottery_winners: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_loyalty
CREATE TABLE IF NOT EXISTS `rsg_loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `charname` varchar(50) NOT NULL,
  `loyalty_points` int(11) NOT NULL DEFAULT 0,
  `lifetime_points` int(11) NOT NULL DEFAULT 0,
  `last_update` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `loyalty_points_idx` (`loyalty_points`),
  KEY `lifetime_points_idx` (`lifetime_points`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_loyalty: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_loyalty` (`id`, `citizenid`, `charname`, `loyalty_points`, `lifetime_points`, `last_update`) VALUES
	(1, 'KPP16072', 'Bilto Maldonado', 20, 20, '2026-10-26 07:39:29');

-- Copiando estrutura para tabela londres-s1.rsg_lumberjack_trees
CREATE TABLE IF NOT EXISTS `rsg_lumberjack_trees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(64) NOT NULL,
  `owner_citizenid` varchar(50) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `model` varchar(64) NOT NULL DEFAULT 'p_tree_birch_01_sapling',
  `stage` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `state` enum('planted','growing','ready','chopped') NOT NULL DEFAULT 'planted',
  `watered` tinyint(1) NOT NULL DEFAULT 0,
  `fertilized` tinyint(1) NOT NULL DEFAULT 0,
  `planted_at` datetime NOT NULL DEFAULT current_timestamp(),
  `next_stage_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stage` (`stage`),
  KEY `idx_state` (`state`),
  KEY `idx_owner` (`owner_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_lumberjack_trees: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_mining
CREATE TABLE IF NOT EXISTS `rsg_mining` (
  `mine` varchar(50) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `expires` int(11) NOT NULL DEFAULT 0,
  `wages` int(11) NOT NULL DEFAULT 0,
  `supplies` longtext DEFAULT NULL,
  `storage` longtext DEFAULT NULL,
  PRIMARY KEY (`mine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_mining: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_mining_workers
CREATE TABLE IF NOT EXISTS `rsg_mining_workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mine` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `skill` float NOT NULL DEFAULT 1,
  `food` int(11) NOT NULL DEFAULT 100,
  `water` int(11) NOT NULL DEFAULT 100,
  `pickaxe` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'idle',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_mining_workers: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_moonshine_stills
CREATE TABLE IF NOT EXISTS `rsg_moonshine_stills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `recipe` varchar(50) DEFAULT NULL,
  `hopper` longtext DEFAULT NULL,
  `output` int(11) NOT NULL DEFAULT 0,
  `fuel` int(11) NOT NULL DEFAULT 0,
  `batch_left` int(11) DEFAULT NULL,
  `last_tick` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_moonshine_stills: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_noticeboard_boards
CREATE TABLE IF NOT EXISTS `rsg_noticeboard_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL DEFAULT 'Notice Board',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  `created_by` varchar(64) DEFAULT NULL,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_noticeboard_boards: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_noticeboard_notices
CREATE TABLE IF NOT EXISTS `rsg_noticeboard_notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(64) NOT NULL,
  `author` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `category` varchar(32) NOT NULL,
  `town` varchar(32) DEFAULT NULL,
  `duration` varchar(16) NOT NULL,
  `created_at` int(11) NOT NULL,
  `expires_at` int(11) NOT NULL,
  `warned` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`),
  KEY `idx_expires` (`expires_at`),
  KEY `idx_town` (`town`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_noticeboard_notices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_animals
CREATE TABLE IF NOT EXISTS `rsg_ranch_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranchid` varchar(50) DEFAULT NULL,
  `animalid` varchar(50) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `age` smallint(5) unsigned DEFAULT 0,
  `health` tinyint(3) unsigned DEFAULT 100,
  `thirst` tinyint(3) unsigned DEFAULT 100,
  `hunger` tinyint(3) unsigned DEFAULT 100,
  `born` int(10) unsigned NOT NULL,
  `scale` decimal(4,2) DEFAULT 0.50,
  `last_production` int(10) unsigned DEFAULT 0,
  `product_ready` tinyint(1) DEFAULT 0,
  `gender` enum('male','female') DEFAULT 'female',
  `pregnant` tinyint(1) DEFAULT 0,
  `gestation_end_time` int(10) unsigned DEFAULT NULL,
  `breeding_ready_time` int(10) unsigned DEFAULT 0,
  `breeding_attempts` int(10) unsigned DEFAULT 0,
  `mother_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_animalid` (`animalid`),
  KEY `idx_ranchid` (`ranchid`),
  KEY `idx_animalid` (`animalid`),
  KEY `idx_product_ready` (`product_ready`),
  KEY `idx_ranchid_product` (`ranchid`,`product_ready`),
  KEY `idx_pregnant` (`pregnant`),
  KEY `idx_gender` (`gender`),
  KEY `idx_breeding_ready` (`breeding_ready_time`),
  KEY `idx_mother_id` (`mother_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_animals: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_chickencoops
CREATE TABLE IF NOT EXISTS `rsg_ranch_chickencoops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coopid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `chickens` smallint(5) unsigned DEFAULT 0,
  `eggs_stored` smallint(5) unsigned DEFAULT 0,
  `feed_level` tinyint(3) unsigned DEFAULT 100,
  `last_feed_update` int(10) unsigned DEFAULT 0,
  `last_production` int(10) unsigned DEFAULT 0,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_coopid` (`coopid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_chickencoops: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_custom
CREATE TABLE IF NOT EXISTS `rsg_ranch_custom` (
  `ranchid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 5000,
  `npcmodel` varchar(60) NOT NULL DEFAULT 'g_m_m_uniranchers_01',
  `npc_x` float NOT NULL,
  `npc_y` float NOT NULL,
  `npc_z` float NOT NULL,
  `npc_w` float NOT NULL DEFAULT 0,
  `spawn_x` float NOT NULL,
  `spawn_y` float NOT NULL,
  `spawn_z` float NOT NULL,
  `spawn_w` float NOT NULL DEFAULT 0,
  `blipsprite` varchar(60) NOT NULL DEFAULT 'blip_ambient_herd',
  `blipscale` float NOT NULL DEFAULT 0.2,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_custom: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_feedtroughs
CREATE TABLE IF NOT EXISTS `rsg_ranch_feedtroughs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedtroughid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `uses` tinyint(3) unsigned DEFAULT 10,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_feedtroughid` (`feedtroughid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_feedtroughs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_orders
CREATE TABLE IF NOT EXISTS `rsg_ranch_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `amount` smallint(5) unsigned DEFAULT 1,
  `price` int(10) unsigned DEFAULT 0,
  `ordered_at` int(10) unsigned DEFAULT NULL,
  `ready_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_orderid` (`orderid`),
  KEY `idx_ranchid` (`ranchid`),
  KEY `idx_ready_at` (`ready_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_orders: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_owners
CREATE TABLE IF NOT EXISTS `rsg_ranch_owners` (
  `ranchid` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `purchased_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ranchid`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_owners: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_ranch_owners` (`ranchid`, `citizenid`, `purchased_at`) VALUES
	('emeraldranch', 'KPP16072', 1792995793);

-- Copiando estrutura para tabela londres-s1.rsg_ranch_settings
CREATE TABLE IF NOT EXISTS `rsg_ranch_settings` (
  `ranchid` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `blipname` varchar(100) DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `showblip` tinyint(1) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_settings: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_storages
CREATE TABLE IF NOT EXISTS `rsg_ranch_storages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storageid` varchar(50) NOT NULL,
  `ranchid` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL DEFAULT 'general',
  `label` varchar(50) NOT NULL DEFAULT 'General Storage',
  `maxweight` int(10) unsigned NOT NULL DEFAULT 10000000,
  `slots` smallint(5) unsigned NOT NULL DEFAULT 100,
  `min_grade` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `purchased_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_storageid` (`storageid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_storages: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_ranch_storages` (`id`, `storageid`, `ranchid`, `size`, `label`, `maxweight`, `slots`, `min_grade`, `purchased_by`, `created_at`) VALUES
	(1, 'emeraldranch', 'emeraldranch', 'general', 'General Storage', 10000000, 100, 1, NULL, 1792995793);

-- Copiando estrutura para tabela londres-s1.rsg_ranch_watertroughs
CREATE TABLE IF NOT EXISTS `rsg_ranch_watertroughs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watertroughid` varchar(50) DEFAULT NULL,
  `ranchid` varchar(50) DEFAULT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `pos_w` float NOT NULL,
  `uses` tinyint(3) unsigned DEFAULT 10,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_watertroughid` (`watertroughid`),
  KEY `idx_ranchid` (`ranchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_watertroughs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_ranch_wellpumps
CREATE TABLE IF NOT EXISTS `rsg_ranch_wellpumps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `h` float NOT NULL DEFAULT 0,
  `placed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_ranch_wellpumps: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_roulette_tables
CREATE TABLE IF NOT EXISTS `rsg_roulette_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `room` bigint(20) NOT NULL DEFAULT 0,
  `placed_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_roulette_tables: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_shops_blips
CREATE TABLE IF NOT EXISTS `rsg_shops_blips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sprite` bigint(20) NOT NULL,
  `color` varchar(64) DEFAULT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `associated_npc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_assoc_npc` (`associated_npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_shops_blips: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_shops_items
CREATE TABLE IF NOT EXISTS `rsg_shops_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npc_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_npc_id` (`npc_id`),
  KEY `idx_item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_shops_items: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_shops_npcs
CREATE TABLE IF NOT EXISTS `rsg_shops_npcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `h` double NOT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `shop_label` varchar(100) DEFAULT NULL,
  `shop_type` varchar(10) NOT NULL DEFAULT 'both',
  PRIMARY KEY (`id`),
  KEY `idx_shop_name` (`shop_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_shops_npcs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_shops_presets
CREATE TABLE IF NOT EXISTS `rsg_shops_presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_kind_value` (`kind`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_shops_presets: ~28 rows (aproximadamente)
INSERT IGNORE INTO `rsg_shops_presets` (`id`, `kind`, `label`, `value`) VALUES
	(1, 'model', 'cfg_model_tumbleweed_store', 'u_f_m_tumgeneralstoreowner_01'),
	(2, 'model', 'cfg_model_armadillo_store', 'u_m_m_armgeneralstoreowner_01'),
	(4, 'model', 'cfg_model_rhodes_store_1', 'u_m_m_rhdgenstoreowner_01'),
	(5, 'model', 'cfg_model_rhodes_store_2', 'u_m_m_rhdgenstoreowner_02'),
	(6, 'model', 'cfg_model_strawberry_store', 'u_m_m_strgenstoreowner_01'),
	(7, 'model', 'cfg_model_valentine_store', 'u_m_m_valgenstoreowner_01'),
	(8, 'model', 'cfg_model_wallace_store', 'u_m_m_walgeneralstoreowner_01'),
	(9, 'model', 'cfg_model_annesburg_gunsmith', 'u_m_m_asbgunsmith_01'),
	(10, 'model', 'cfg_model_saintdenis_gunsmith', 'u_m_m_nbxgunsmith_01'),
	(11, 'model', 'cfg_model_rhodes_gunsmith', 'u_m_m_rhdgunsmith_01'),
	(12, 'model', 'cfg_model_tumbleweed_gunsmith', 'u_m_m_tumgunsmith_01'),
	(13, 'model', 'cfg_model_valentine_gunsmith', 'u_m_m_valgunsmith_01'),
	(14, 'model', 'cfg_model_generic_butcher', 's_m_m_unibutchers_01'),
	(15, 'model', 'cfg_model_tumbleweed_butcher', 'u_m_m_tumbutcher_01'),
	(16, 'model', 'cfg_model_valentine_butcher', 'u_m_m_valbutcher_01'),
	(17, 'model', 'cfg_model_saintdenis_trapper', 'u_m_m_sdtrapper_01'),
	(18, 'model', 'cfg_model_thieveslanding_bartender', 'u_f_m_tljbartender_01'),
	(19, 'model', 'cfg_model_vanhorn_bartender', 'u_f_m_vhtbartender_01'),
	(20, 'model', 'cfg_model_saintdenis_bartender_1', 'u_m_m_nbxbartender_01'),
	(21, 'model', 'cfg_model_saintdenis_bartender_2', 'u_m_m_nbxbartender_02'),
	(22, 'model', 'cfg_model_rhodes_bartender', 'u_m_m_rhdbartender_01'),
	(23, 'model', 'cfg_model_armadillo_bartender', 'u_m_o_armbartender_01'),
	(24, 'model', 'cfg_model_blackwater_bartender', 'u_m_o_blwbartender_01'),
	(25, 'model', 'cfg_model_valentine_bartender', 'u_m_o_valbartender_01'),
	(26, 'blip', 'cfg_blip_general_store', '1475879922'),
	(27, 'blip', 'cfg_blip_gunsmith', '-145868367'),
	(28, 'blip', 'cfg_blip_butcher', '-1665418949'),
	(29, 'blip', 'cfg_blip_saloon', '1879260108');

-- Copiando estrutura para tabela londres-s1.rsg_smelting_state
CREATE TABLE IF NOT EXISTS `rsg_smelting_state` (
  `id` tinyint(3) unsigned NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_smelting_state: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_smelting_state` (`id`, `data`) VALUES
	(1, '{"live":[],"owed":[]}');

-- Copiando estrutura para tabela londres-s1.rsg_stables_breeding
CREATE TABLE IF NOT EXISTS `rsg_stables_breeding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `stable` varchar(50) NOT NULL,
  `parent_a` int(11) NOT NULL,
  `parent_b` int(11) NOT NULL,
  `ready_at` bigint(20) NOT NULL,
  `collected` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `stable` (`stable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_stables_breeding: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_stables_horses
CREATE TABLE IF NOT EXISTS `rsg_stables_horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `stable` varchar(50) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `breed_label` varchar(100) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `breed_cooldown` bigint(20) NOT NULL DEFAULT 0,
  `died_of_age` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Unnamed Horse',
  `outfit` int(11) NOT NULL DEFAULT 0,
  `tack` text DEFAULT NULL,
  `coat` text DEFAULT NULL,
  `health` float NOT NULL DEFAULT 100,
  `stamina` float NOT NULL DEFAULT 100,
  `hunger` float NOT NULL DEFAULT 100,
  `thirst` float NOT NULL DEFAULT 100,
  `bonding` float NOT NULL DEFAULT 0,
  `speed` int(11) NOT NULL DEFAULT 50,
  `accel` int(11) NOT NULL DEFAULT 50,
  `handling` int(11) NOT NULL DEFAULT 50,
  `maxhealth` int(11) NOT NULL DEFAULT 50,
  `alive` tinyint(1) NOT NULL DEFAULT 1,
  `insured` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `pos_h` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `stable` (`stable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_stables_horses: ~1 rows (aproximadamente)
INSERT IGNORE INTO `rsg_stables_horses` (`id`, `citizenid`, `stable`, `model`, `breed_label`, `gender`, `breed_cooldown`, `died_of_age`, `name`, `outfit`, `tack`, `coat`, `health`, `stamina`, `hunger`, `thirst`, `bonding`, `speed`, `accel`, `handling`, `maxhealth`, `alive`, `insured`, `active`, `pos_x`, `pos_y`, `pos_z`, `pos_h`, `created_at`) VALUES
	(1, 'KPP16072', 'valentine', '-1963397600', 'American Paint (Grey Overo)', 'male', 0, 0, 'teste', 0, '{}', NULL, 87, 100, 0, 0, 0, 3, 3, 50, 3, 1, 0, 1, 2818.76, -1307.72, 46.4986, 143.853, '2026-10-26 06:26:13');

-- Copiando estrutura para tabela londres-s1.rsg_telegram_contacts
CREATE TABLE IF NOT EXISTS `rsg_telegram_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `contact_citizenid` varchar(50) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_contact` (`citizenid`,`contact_citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_telegram_contacts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_telegrams
CREATE TABLE IF NOT EXISTS `rsg_telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `sender_citizenid` varchar(50) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_telegrams: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_telephones
CREATE TABLE IF NOT EXISTS `rsg_telephones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(16) NOT NULL,
  `label` varchar(64) NOT NULL DEFAULT 'Telephone',
  `model` varchar(64) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `heading` double NOT NULL DEFAULT 0,
  `listed` tinyint(1) NOT NULL DEFAULT 1,
  `room` bigint(20) NOT NULL DEFAULT 0,
  `job` varchar(64) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela londres-s1.rsg_telephones: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_trader
CREATE TABLE IF NOT EXISTS `rsg_trader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traderid` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `lowstock` int(11) NOT NULL DEFAULT 0,
  `highstock` int(11) NOT NULL DEFAULT 0,
  `baseprice` decimal(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trader_item` (`traderid`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_trader: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_trader_npcs
CREATE TABLE IF NOT EXISTS `rsg_trader_npcs` (
  `traderid` varchar(50) NOT NULL,
  `tradername` varchar(50) NOT NULL,
  `npcmodel` varchar(60) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `showblip` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`traderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_trader_npcs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_trapdoors
CREATE TABLE IF NOT EXISTS `rsg_trapdoors` (
  `door_id` varchar(64) NOT NULL,
  `passcode` char(4) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`door_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_trapdoors: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_trapdoors_schema
CREATE TABLE IF NOT EXISTS `rsg_trapdoors_schema` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `version` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_trapdoors_schema: ~0 rows (aproximadamente)
INSERT IGNORE INTO `rsg_trapdoors_schema` (`id`, `version`) VALUES
	(1, 1);

-- Copiando estrutura para tabela londres-s1.rsg_wagons
CREATE TABLE IF NOT EXISTS `rsg_wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `wagon` varchar(50) NOT NULL DEFAULT '0',
  `custom` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom`)),
  `animals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`animals`)),
  `active` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_wagons: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.rsg_weather_state
CREATE TABLE IF NOT EXISTS `rsg_weather_state` (
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.rsg_weather_state: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela londres-s1.shop_stock
CREATE TABLE IF NOT EXISTS `shop_stock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `stock` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_name_item_name` (`shop_name`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela londres-s1.shop_stock: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
