-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                5.7.21-log - MySQL Community Server (GPL)
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- csbcdb için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `csbcdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `csbcdb`;

-- tablo yapısı dökülüyor csbcdb.csbc_code
CREATE TABLE IF NOT EXISTS `csbc_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `code_data` mediumtext,
  `code_type` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_unique` (`code_name`),
  KEY `jbc_code_ibfk_1` (`adr_path`),
  KEY `jbc_code_ibfk_2` (`rec_user`),
  KEY `jbc_code_ibfk_3` (`code_type`),
  CONSTRAINT `csbc_code_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_code_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_code_ibfk_3` FOREIGN KEY (`code_type`) REFERENCES `csbc_code_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='	';

-- csbcdb.csbc_code: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_code` DISABLE KEYS */;
INSERT INTO `csbc_code` (`id`, `code_name`, `adr_path`, `code_data`, `code_type`, `rec_user`, `rec_date`) VALUES
	(6, 'back-warn', 2, 'history.pushState(null, null, location.href);\r\n    window.onpopstate = function () {\r\n        history.go(1);\r\n    };', 1, 25, '2020-10-28 17:02:00'),
	(7, 'modal-width-90', 2, '\r\n	.modal-dialog.modal-custom \r\n	{\r\n		max-width: 90%;\r\n	}\r\n	\r\n	\r\n\r\n', 2, 25, '2020-10-28 17:03:00');
/*!40000 ALTER TABLE `csbc_code` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_code_map
CREATE TABLE IF NOT EXISTS `csbc_code_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_code` int(11) NOT NULL,
  `page_link` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_map_unique` (`mapped_code`,`page_link`),
  KEY `jbc_code_map_ibfk_2` (`page_link`),
  CONSTRAINT `csbc_code_map_ibfk_1` FOREIGN KEY (`mapped_code`) REFERENCES `csbc_code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_code_map_ibfk_2` FOREIGN KEY (`page_link`) REFERENCES `csbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_code_map: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_code_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `csbc_code_map` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_code_type
CREATE TABLE IF NOT EXISTS `csbc_code_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_code_type: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_code_type` DISABLE KEYS */;
INSERT INTO `csbc_code_type` (`id`, `code_type_name`) VALUES
	(1, 'javascript'),
	(2, 'css'),
	(3, 'HTML'),
	(4, 'XML'),
	(5, 'other');
/*!40000 ALTER TABLE `csbc_code_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_contact
CREATE TABLE IF NOT EXISTS `csbc_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(150) NOT NULL,
  `e_mail` varchar(150) DEFAULT NULL,
  `web_site` varchar(100) DEFAULT NULL,
  `message_data` varchar(10000) NOT NULL,
  `rec_user` int(11) DEFAULT NULL,
  `rec_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jbc_contact_ibfk_1` (`rec_user`),
  CONSTRAINT `csbc_contact_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_contact: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `csbc_contact` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_file
CREATE TABLE IF NOT EXISTS `csbc_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `file_data` mediumblob,
  `file_type` int(11) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_unique` (`file_name`),
  KEY `jbc_file_ibfk_1` (`adr_path`),
  KEY `jbc_file_ibfk_2` (`file_type`),
  KEY `jbc_file_ibfk_3` (`rec_user`),
  CONSTRAINT `csbc_file_ibfk_1` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_file_ibfk_2` FOREIGN KEY (`file_type`) REFERENCES `csbc_file_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_file_ibfk_3` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_file: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `csbc_file` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_file_type
CREATE TABLE IF NOT EXISTS `csbc_file_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_type_unique` (`file_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_file_type: ~9 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_file_type` DISABLE KEYS */;
INSERT INTO `csbc_file_type` (`id`, `file_type_name`) VALUES
	(7, 'csv'),
	(8, 'dnm01'),
	(4, 'excel'),
	(1, 'image'),
	(6, 'json'),
	(5, 'other'),
	(2, 'pdf'),
	(3, 'word');
/*!40000 ALTER TABLE `csbc_file_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_group
CREATE TABLE IF NOT EXISTS `csbc_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_name_UNIQUE` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_group: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_group` DISABLE KEYS */;
INSERT INTO `csbc_group` (`id`, `group_name`) VALUES
	(14, 'Admin'),
	(16, 'dnm03'),
	(15, 'dnm05'),
	(26, 'Normal'),
	(25, 'Supervisor');
/*!40000 ALTER TABLE `csbc_group` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_image
CREATE TABLE IF NOT EXISTS `csbc_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `image_data` mediumblob,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_unique` (`image_name`),
  KEY `jbc_image_ibfk_1` (`rec_user`),
  KEY `jbc_image_ibfk_2` (`adr_path`),
  CONSTRAINT `csbc_image_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_image_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_image: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `csbc_image` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_log
CREATE TABLE IF NOT EXISTS `csbc_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) NOT NULL,
  `form_name` int(11) NOT NULL,
  `type_name` int(11) NOT NULL,
  `table_name` int(11) NOT NULL,
  `log_data` json NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `csbc_log_ibfk_1` (`rec_user`),
  KEY `csbc_log_ibfk_2` (`form_name`),
  KEY `csbc_log_ibfk_3` (`table_name`),
  KEY `csbc_log_ibfk_4` (`type_name`),
  CONSTRAINT `csbc_log_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_log_ibfk_2` FOREIGN KEY (`form_name`) REFERENCES `csbc_log_form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_log_ibfk_3` FOREIGN KEY (`table_name`) REFERENCES `csbc_log_table` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_log_ibfk_4` FOREIGN KEY (`type_name`) REFERENCES `csbc_log_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- csbcdb.csbc_log: ~109 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_log` DISABLE KEYS */;
INSERT INTO `csbc_log` (`id`, `rec_id`, `form_name`, `type_name`, `table_name`, `log_data`, `rec_user`, `rec_date`) VALUES
	(118, 8, 1, 2, 1, '{"id": "8", "adr_path": "/CSBCA/code/", "code_name": "deneme01", "code_type": "other"}', 25, '2020-11-04 11:31:00'),
	(119, 8, 1, 3, 1, '{"id": "8", "adr_path": "/CSBCA/code/", "code_name": "deneme_01", "code_type": "other"}', 25, '2020-11-04 11:35:00'),
	(120, 8, 1, 1, 1, '{"id": "8", "adr_path": "/CSBCA/code/", "code_name": "deneme_01", "code_type": "other"}', 25, '2020-11-04 11:35:00'),
	(121, 1, 1, 1, 1, '{"id": "1", "adr_path": "/CSBCA/code/", "code_name": "listing.js", "code_type": "javascript"}', 25, '2020-11-09 17:55:00'),
	(122, 3, 1, 1, 1, '{"id": "3", "adr_path": "/CSBCA/code/", "code_name": "login.css", "code_type": "css"}', 25, '2020-11-09 17:55:00'),
	(123, 2, 1, 1, 1, '{"id": "2", "adr_path": "/CSBCA/code/", "code_name": "pagination.js", "code_type": "javascript"}', 25, '2020-11-09 17:55:00'),
	(124, 4, 1, 1, 1, '{"id": "4", "adr_path": "/CSBCA/code/", "code_name": "print.min.css", "code_type": "css"}', 25, '2020-11-09 17:55:00'),
	(125, 5, 1, 1, 1, '{"id": "5", "adr_path": "/CSBCA/code/", "code_name": "JBCA GİRİŞ.html", "code_type": "HTML"}', 25, '2020-11-09 17:55:00'),
	(126, 28, 24, 3, 13, '{"id": "28", "e_mail": "tst@test.com", "page_size": "10", "user_code": "dnm003", "user_name": "deneme03", "rec_status": "Active", "user_group": "Normal"}', 25, '2022-05-23 17:43:00');
/*!40000 ALTER TABLE `csbc_log` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_log_form
CREATE TABLE IF NOT EXISTS `csbc_log_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_form_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_form_unique` (`log_form_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- csbcdb.csbc_log_form: ~21 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_log_form` DISABLE KEYS */;
INSERT INTO `csbc_log_form` (`id`, `log_form_name`) VALUES
	(1, 'Code'),
	(2, 'Code Map'),
	(3, 'Contact'),
	(4, 'Dosya'),
	(5, 'File'),
	(6, 'İletişim'),
	(7, 'Kod'),
	(8, 'Kod Map'),
	(9, 'Kullanıcı'),
	(10, 'Menu'),
	(12, 'Mesaj'),
	(13, 'Mesaj Map'),
	(14, 'Message'),
	(15, 'Message Map'),
	(16, 'Page'),
	(17, 'Page Link'),
	(18, 'Page Map'),
	(19, 'Sayfa'),
	(20, 'Sayfa Link'),
	(21, 'Sayfa Map'),
	(22, 'Tema'),
	(23, 'Theme'),
	(24, 'User');
/*!40000 ALTER TABLE `csbc_log_form` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_log_table
CREATE TABLE IF NOT EXISTS `csbc_log_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_table_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_table_unique` (`log_table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- csbcdb.csbc_log_table: ~11 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_log_table` DISABLE KEYS */;
INSERT INTO `csbc_log_table` (`id`, `log_table_name`) VALUES
	(1, 'csbc_code'),
	(2, 'csbc_code_map'),
	(3, 'csbc_contact'),
	(4, 'csbc_file'),
	(5, 'csbc_image'),
	(6, 'csbc_menu'),
	(7, 'csbc_message'),
	(8, 'csbc_message_map'),
	(9, 'csbc_page'),
	(10, 'csbc_page_link'),
	(11, 'csbc_page_map'),
	(12, 'csbc_theme'),
	(13, 'csbc_user');
/*!40000 ALTER TABLE `csbc_log_table` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_log_type
CREATE TABLE IF NOT EXISTS `csbc_log_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_type_unique` (`log_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- csbcdb.csbc_log_type: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_log_type` DISABLE KEYS */;
INSERT INTO `csbc_log_type` (`id`, `log_type_name`) VALUES
	(1, 'delete'),
	(2, 'insert'),
	(3, 'update');
/*!40000 ALTER TABLE `csbc_log_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_menu
CREATE TABLE IF NOT EXISTS `csbc_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `menu_data` varchar(16000) DEFAULT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_unique` (`menu_name`),
  KEY `jbc_menu_ibfk_1` (`rec_user`),
  KEY `jbc_menu_ibfk_2` (`adr_path`),
  CONSTRAINT `csbc_menu_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_menu_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_menu: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_menu` DISABLE KEYS */;
INSERT INTO `csbc_menu` (`id`, `menu_name`, `adr_path`, `menu_data`, `rec_user`, `rec_date`) VALUES
	(1, 'Admin-Menu', 4, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><a class=\'navbar-brand\' href=\'/admin/admin\'>CSBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Pages</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/page/page\'>Page</a><a class=\'dropdown-item\' href=\'/page/theme\'>Theme</a><a class=\'dropdown-item\' href=\'/page/page-link\'>Page Link</a><a class=\'dropdown-item\' href=\'/page/page-map\'>Page Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Codes</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/code/code\'>Code</a><a class=\'dropdown-item\' href=\'/code/code_map\'>Code Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/menu/menu\'>Menus</a></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/file/file\'>Files</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>References</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/reference/code-type\'>Code Type</a><a class=\'dropdown-item\' href=\'/reference/file_type\'>File Type</a><a class=\'dropdown-item\' href=\'/reference/message_type\'>Message Type</a><a class=\'dropdown-item\' href=\'/reference/page_type\'>Page Type</a><a class=\'dropdown-item\' href=\'/reference/path\'>Path</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Log Records</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/log/log_form\'>Log Form</a><a class=\'dropdown-item\' href=\'/log/log_table\'>Log Table</a><a class=\'dropdown-item\' href=\'/log/log_type\'>Log Type</a><a class=\'dropdown-item\' href=\'/log/log\'>View Log</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/admin/admin\'>Administration</a><a class=\'dropdown-item\' href=\'/admin/group\'>Group</a><a class=\'dropdown-item\' href=\'/user/message\'>Message Record</a><a class=\'dropdown-item\' href=\'/user/message_map\'>Message Delivery</a><a class=\'dropdown-item\' href=\'/user/message_rew\'>Message Review</a><a class=\'dropdown-item\' href=\'/user/password\'>Password</a><a class=\'dropdown-item\' href=\'/start/login\'>Login</a></div></li></ul><ul class=\'navbar-nav ml-auto\'><li><a href=\'/admin/adminRD\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/admin/yonetimRD\' style=\'color:#ffffff\'>TR</a></li></ul></nav>', 25, '2020-10-19 17:01:00'),
	(2, 'Gozetmen-Menu', 4, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><a class=\'navbar-brand\' href=\'/admin/yonetim\'>CSBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Sayfalar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/page/sayfa\'>Sayfa</a><a class=\'dropdown-item\' href=\'/page/tema\'>Tema</a><a class=\'dropdown-item\' href=\'/page/sayfa_link\'>Sayfa Link</a><a class=\'dropdown-item\' href=\'/page/sayfa_map\'>Sayfa Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Kodlar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/code/kod\'>Kod</a><a class=\'dropdown-item\' href=\'/code/kod_map\'>Kod Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/menu/menu_tr\'>Menüler</a></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/file/dosya\'>Dosyalar</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Referanslar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/reference/kod_tip\'>Kod Tipi</a><a class=\'dropdown-item\' href=\'/reference/dosya_tip\'>Dosya Tipi</a><a class=\'dropdown-item\' href=\'/reference/mesaj_tip\'>Mesaj Tipi</a><a class=\'dropdown-item\' href=\'/reference/pozisyon\'>Pozisyon</a><a class=\'dropdown-item\' href=\'/reference/sayfa_tip\'>Sayfa Tipi</a><a class=\'dropdown-item\' href=\'/reference/yol\'>Yol</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Log Kaydı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/log/log_formu\'>Log Formu</a><a class=\'dropdown-item\' href=\'/log/log_tablo\'>Log Tablo</a><a class=\'dropdown-item\' href=\'/log/log_tip\'>Log Tipi</a><a class=\'dropdown-item\' href=\'/log/log_tr\'>Log İzle</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Kullanıcı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/admin/kullanici\'>Kullanıcı</a><a class=\'dropdown-item\' href=\'/user/mesaj\'>Mesaj Kaydet</a><a class=\'dropdown-item\' href=\'/user/mesaj_map\'>Mesaj Dağıt</a><a class=\'dropdown-item\' href=\'/user/mesaj_bak\'>Mesaj Bak</a><a class=\'dropdown-item\' href=\'/user/sifre\'>Şifre</a><a class=\'dropdown-item\' href=\'/start/giris\'>Çıkış</a></div></li></ul><ul class=\'navbar-nav ml-auto\'><li><a href=\'/admin/adminRD\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/admin/yonetimRD\' style=\'color:#ffffff\'>TR</a></li></ul></nav>', 25, '2020-10-28 15:38:00'),
	(3, 'Normal-Kul-Menu', 4, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><a class=\'navbar-brand\' href=\'/user/kullanici\'>CSBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Sayfalar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/page/sayfa\'>Sayfa</a><a class=\'dropdown-item\' href=\'/page/tema\'>Tema</a><a class=\'dropdown-item\' href=\'/page/sayfa_link\'>Sayfa Link</a><a class=\'dropdown-item\' href=\'/page/sayfa_map\'>Sayfa Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Kodlar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/code/kod\'>Kod</a><a class=\'dropdown-item\' href=\'/code/kod_map\'>Kod Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/menu/menu_tr\'>Menüler</a></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/file/dosya\'>Dosyalar</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Referanslar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/reference/kod_tip\'>Kod Tipi</a><a class=\'dropdown-item\' href=\'/reference/dosya_tip\'>Dosya Tipi</a><a class=\'dropdown-item\' href=\'/reference/mesaj_tip\'>Mesaj Tipi</a><a class=\'dropdown-item\' href=\'/reference/pozisyon\'>Pozisyon</a><a class=\'dropdown-item\' href=\'/reference/sayfa_tip\'>Sayfa Tipi</a><a class=\'dropdown-item\' href=\'/reference/yol\'>Yol</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Kullanıcı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/admin/yonetim\'>Yönetim</a><a class=\'dropdown-item\' href=\'/admin/grup\'>Grup</a><a class=\'dropdown-item\' href=\'/user/mesaj\'>Mesaj</a><a class=dropdown-item href=\'/user/mesaj_map\'>Mesaj Dağıtım</a><a class=dropdown-item href=\'/user/mesaj_bak\'>Mesaj Bak</a><a class=\'dropdown-item\' href=\'/user/sifre\'>Şifre</a><a class=\'dropdown-item\' href=\'/start/giris\'>Çıkış</a></div></li></ul><ul class=\'navbar-nav ml-auto\'><li><a href=\'/admin/adminRD\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/admin/yonetimRD\'  style=\'color:#ffffff\'>TR</a></li></ul></nav>', 25, '2020-10-28 15:38:00'),
	(4, 'Normal-User-Menu', 4, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><a class=\'navbar-brand\' href=\'/user/message-rew\'>CSBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Pages</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/page/page\'>Page</a><a class=\'dropdown-item\' href=\'/page/theme\'>Theme</a><a class=\'dropdown-item\' href=\'/page/page-link\'>Page Link</a><a class=\'dropdown-item\' href=\'/page/page-map\'>Page Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Codes</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/code/code\'>Code</a><a class=\'dropdown-item\' href=\'/code/code_map\'>Code Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/file/file\'>Files</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/user/message_rew\'>Message Review</a><a class=\'dropdown-item\' href=\'/user/password\'>Password</a><a class=\'dropdown-item\' href=\'/start/login\'>Login</a></div></li></ul><ul class=\'navbar-nav ml-auto\'><li><a href=\'/user/message-rew\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/user/mesaj-bak\' style=\'color:#ffffff\'>TR</a></li></ul></nav>', 25, '2020-10-19 17:03:00'),
	(5, 'Supervisor-Menu', 4, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><a class=\'navbar-brand\' href=\'/user/user\'>CSBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Pages</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/page/page\'>Page</a><a class=\'dropdown-item\' href=\'/page/theme\'>Theme</a><a class=\'dropdown-item\' href=\'/page/page-link\'>Page Link</a><a class=\'dropdown-item\' href=\'/page/page-map\'>Page Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Codes</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/code/code\'>Code</a><a class=\'dropdown-item\' href=\'/code/code_map\'>Code Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/menu/menu\'>Menus</a></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/file/file\'>Files</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>References</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/reference/code-type\'>Code Type</a><a class=\'dropdown-item\' href=\'/reference/file_type\'>File Type</a><a class=\'dropdown-item\' href=\'/reference/message_type\'>Message Type</a><a class=\'dropdown-item\' href=\'/reference/page_type\'>Page Type</a><a class=\'dropdown-item\' href=\'/reference/path\'>Path</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Log Records</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/log/log_form\'>Log Form</a><a class=\'dropdown-item\' href=\'/log/log-table\'>Log Table</a><a class=\'dropdown-item\' href=\'/log/log_type\'>Log Type</a><a class=\'dropdown-item\' href=\'/log/log\'>View Log</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>User</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/user/user\'>Users</a><a class=\'dropdown-item\' href=\'/user/message\'>Message Record</a><a class=\'dropdown-item\' href=\'/user/message_map\'>Message Delivery</a><a class=\'dropdown-item\' href=\'/user/message_rew\'>Message Review</a><a class=\'dropdown-item\' href=\'/user/password\'>Password</a><a class=\'dropdown-item\' href=\'/start/login\'>Login</a></div></li></ul><ul class=\'navbar-nav ml-auto\'><li><a href=\'/user/user\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/user/kullanici\' style=\'color:#ffffff\'>TR</a></li></ul></nav>', 25, '2020-10-19 17:03:00'),
	(6, 'Yonetici-Menu', 4, '<nav class=\'navbar navbar-expand-sm bg-dark navbar-dark\'><a class=\'navbar-brand\' href=\'/admin/yonetim\'>CSBCA</a><ul class=\'navbar-nav\'><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Sayfalar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/page/sayfa\'>Sayfa</a><a class=\'dropdown-item\' href=\'/page/tema\'>Tema</a><a class=\'dropdown-item\' href=\'/page/sayfa-link\'>Sayfa Link</a><a class=\'dropdown-item\' href=\'/page/sayfa-map\'>Sayfa Map</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Kodlar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/code/kod\'>Kod</a><a class=\'dropdown-item\' href=\'/code/kod-map\'>Kod Map</a></div></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/menu/menu-tr\'>Menüler</a></li><li class=\'nav-item\'><a class=\'nav-link\' href=\'/file/dosya\'>Dosyalar</a></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Referanslar</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/reference/kod-tip\'>Kod Tipi</a><a class=\'dropdown-item\' href=\'/reference/dosya-tip\'>Dosya Tipi</a><a class=\'dropdown-item\' href=\'/reference/mesaj-tip\'>Mesaj Tipi</a><a class=\'dropdown-item\' href=\'/reference/pozisyon\'>Pozisyon</a><a class=\'dropdown-item\' href=\'/reference/sayfa-tip\'>Sayfa Tipi</a><a class=\'dropdown-item\' href=\'/reference/yol\'>Yol</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Log Kaydı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/log/log-formu\'>Log Formu</a><a class=\'dropdown-item\' href=\'/log/log-tablo\'>Log Tablo</a><a class=\'dropdown-item\' href=\'/log/log-tip\'>Log Tipi</a><a class=\'dropdown-item\' href=\'/log/log-tr\'>Log İzle</a></div></li><li class=\'nav-item dropdown\'><a class=\'nav-link dropdown-toggle\' data-toggle=\'dropdown\' href=\'/#\'>Kullanıcı</a><div class=\'dropdown-menu\'><a class=\'dropdown-item\' href=\'/admin/yonetim\'>Yönetim</a><a class=\'dropdown-item\' href=\'/admin/grup\'>Grup</a><a class=\'dropdown-item\' href=\'/user/mesaj\'>Mesaj Kaydet</a><a class=\'dropdown-item\' href=\'/user/mesaj-map\'>Mesaj Dağıt</a><a class=\'dropdown-item\' href=\'/user/mesaj-bak\'>Mesaj Bak</a><a class=\'dropdown-item\' href=\'/user/sifre\'>Şifre</a><a class=\'dropdown-item\' href=\'/start/giris\'>Çıkış</a></div></li></ul><ul class=\'navbar-nav ml-auto\'><li><a href=\'/admin/adminRD\' style=\'color:#ffffff\'>EN</a></li><li><span style=\'color:#ffffff\'>/</span></li><li><a href=\'/admin/yonetimRD\' style=\'color:#ffffff\'>TR</a></li></ul></nav>', 25, '2022-06-07 16:34:00');
/*!40000 ALTER TABLE `csbc_menu` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_message
CREATE TABLE IF NOT EXISTS `csbc_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_name` varchar(150) NOT NULL,
  `msg_data` varchar(16000) DEFAULT NULL,
  `message_type` int(11) NOT NULL,
  `rec_status` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_unique` (`msg_name`) COMMENT '																				',
  KEY `jbc_message_ibfk_1` (`rec_status`),
  KEY `jbc_message_ibfk_2` (`rec_user`),
  KEY `jbc_message_ibfk_3` (`message_type`),
  CONSTRAINT `csbc_message_ibfk_1` FOREIGN KEY (`rec_status`) REFERENCES `csbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_message_ibfk_2` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_message_ibfk_3` FOREIGN KEY (`message_type`) REFERENCES `csbc_message_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_message: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_message` DISABLE KEYS */;
INSERT INTO `csbc_message` (`id`, `msg_name`, `msg_data`, `message_type`, `rec_status`, `rec_user`, `rec_date`) VALUES
	(1, 'Deneme01', 'Merhaba.Bubirdenememesajıdır.İyigünlerdilerim.', 1, 3, 25, '2020-10-18 23:45:00');
/*!40000 ALTER TABLE `csbc_message` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_message_map
CREATE TABLE IF NOT EXISTS `csbc_message_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_msg` int(11) NOT NULL,
  `user_group` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_map_unique` (`mapped_msg`,`user_group`),
  KEY `fk_message_map_group` (`user_group`),
  KEY `jbc_message_map_ibfk_1` (`rec_user`),
  CONSTRAINT `csbc_message_map_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_message_map_ibfk_2` FOREIGN KEY (`user_group`) REFERENCES `csbc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_message_map_ibfk_3` FOREIGN KEY (`mapped_msg`) REFERENCES `csbc_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='					';

-- csbcdb.csbc_message_map: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_message_map` DISABLE KEYS */;
INSERT INTO `csbc_message_map` (`id`, `mapped_msg`, `user_group`, `rec_user`, `rec_date`) VALUES
	(1, 1, 25, 25, '2020-10-21 17:03:00'),
	(2, 1, 26, 25, '2020-10-21 17:03:00'),
	(3, 1, 14, 25, '2020-10-28 16:01:00');
/*!40000 ALTER TABLE `csbc_message_map` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_message_type
CREATE TABLE IF NOT EXISTS `csbc_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_type_unique` (`msg_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_message_type: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_message_type` DISABLE KEYS */;
INSERT INTO `csbc_message_type` (`id`, `msg_type_name`) VALUES
	(2, 'alert'),
	(4, 'error'),
	(1, 'info'),
	(3, 'warning');
/*!40000 ALTER TABLE `csbc_message_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_page
CREATE TABLE IF NOT EXISTS `csbc_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `page_data` mediumtext,
  `page_type` int(11) NOT NULL,
  `rec_status` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_unique` (`page_name`),
  KEY `jbc_page_ibfk_1` (`adr_path`),
  KEY `jbc_page_ibfk_2` (`page_type`),
  KEY `jbc_page_ibfk_3` (`rec_status`),
  KEY `jbc_page_ibfk_4` (`rec_user`),
  CONSTRAINT `csbc_page_ibfk_2` FOREIGN KEY (`page_type`) REFERENCES `csbc_page_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_ibfk_3` FOREIGN KEY (`rec_status`) REFERENCES `csbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_ibfk_4` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_page: ~54 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_page` DISABLE KEYS */;
INSERT INTO `csbc_page` (`id`, `page_name`, `adr_path`, `page_data`, `page_type`, `rec_status`, `rec_user`, `rec_date`) VALUES
	(1, 'Admin-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/admin">Administration</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/group">Group</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message">Message Record</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message_map">Message Map</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message_rew">Message Review</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/password">Password</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/login">Login</a></li>\n		 </ul>\n	  </nav>\n', 3, 3, 25, '2020-10-28 00:04:00'),
	(2, 'Codes-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/code/code">Code</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/code/code_map">Code Map</a></li>\n		 </ul>\n	  </nav>\n\n', 3, 3, 25, '2020-10-15 00:12:00'),
	(3, 'Dosyalar-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/yonetim">Yönetim</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/grup">Grup</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj">Mesaj</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/sifre">Şifre</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/giris">Çıkış</a></li>\n		 </ul>\n	  </nav>\n\n    <div class="container-fluid">\n      <div class="row">\n        <div class="col-sm-3 col-md-2 sidebar">\n          <ul class="nav nav-sidebar">\n            <li ><a href="#"> </a></li>\n			<li><a href="jsp/file/Gorsel">Görsel</a></li>\n			<li><a href="jsp/file/PDF-TR">PDF</a></li>\n			<li><a href="jsp/file/Word-TR">Word</a></li>\n			<li><a href="jsp/file/Excel-TR">Excell</a></li>\n			<li><a href="jsp/file/Diger">Diğer</a></li>\n		  </ul>\n       </div>\n', 3, 3, 25, '2020-10-15 00:12:00'),
	(4, 'Files-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/yonetim">Yönetim</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/grup">Grup</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj">Mesaj</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/sifre">Şifre</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/giris">Çıkış</a></li>\n		 </ul>\n	  </nav>\n', 3, 3, 25, '2020-10-19 15:30:00'),
	(5, 'Gözetim-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/kullanici">Kullanıcı</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj">Mesaj</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj_map">Mesaj Dağıtım</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj_bak">Mesaj Bak</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/sifre">Şifre</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/giris">Çıkış</a></li>\n		 </ul>\n	  </nav>\n', 3, 3, 25, '2020-10-28 00:04:00'),
	(6, 'Kodlar-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/code/kod">Kod</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/code/kod_map">Kod Map</a></li>\n		 </ul>\n	  </nav>\n\n', 3, 3, 25, '2020-10-15 00:12:00'),
	(7, 'Loglar-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_formu">Log Formu</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_tablo">Log Tablo</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_tip">Log Tipi</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_tr">Log İzle</a></li>\n		 </ul>\n	  </nav>\n\n', 3, 3, 25, '2020-10-15 00:12:00'),
	(8, 'Logs-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_form.jsp">Log Form</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_table.jsp">Log Table</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log_type.jsp">Log Type</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/log/log.jsp">View Log</a></li>\n		 </ul>\n	  </nav>\n\n', 3, 3, 25, '2020-10-19 12:42:00'),
	(9, 'Normal-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message_rew">Message Review</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/password">Password</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/login">Login</a></li>\n		 </ul>\n	  </nav>\n', 3, 3, 25, '2020-10-15 00:13:00'),
	(10, 'Normal-Sidebar-TR', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj_bak">Mesaj Bak</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/sifre">Şifre</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/giris">Çıkış</a></li>\n		 </ul>\n	  </nav>\n', 3, 3, 25, '2020-10-15 00:13:00'),
	(11, 'Pages-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/page">Page</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/theme">Theme</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/page-link">Page Link</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/page-map">Page Map</a></li>\n		 </ul>\n	  </nav>\n\n', 3, 3, 25, '2020-10-15 00:13:00'),
	(12, 'Referans-Sidebar.', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/kod_tip">Kod Tipi</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/dosya_tip">Dosya Tipi</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/mesaj_tip">Mesaj Tipi</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/pozisyon">Pozisyon</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/sayfa_tip">Sayfa Tipi</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/yol">Yol</a></li>\n		 </ul>\n	  </nav>\n', 2, 3, 25, '2020-10-15 00:13:00'),
	(13, 'Reference-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/code-type">Code Type</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/file_type">File Type</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/message_type">Message Type</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/position">Position</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/page_type">Page Type</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/reference/path">Path</a></li>\n		 </ul>\n	  </nav>\n', 2, 3, 25, '2020-10-15 00:14:00'),
	(14, 'Sayfalar-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/sayfa">Sayfa</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/tema">Tema</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/sayfa_link">Sayfa Link</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/page/sayfa_map">Sayfa Map</a></li>\n		 </ul>\n	  </nav>\n\n', 2, 3, 25, '2020-10-15 00:14:00'),
	(15, 'Supervisor-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/user">User</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message">Message Record</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message_map">Message Map</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/message_rew">Message Review</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/password">Password</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/login">Login</a></li>\n		 </ul>\n	  </nav>\n', 2, 3, 25, '2020-10-28 00:05:00'),
	(16, 'Yonetim-Sidebar', 5, '	  <nav class="navbar bg-light col-md-1 col-xl-2">\n		 <ul class="navbar-nav flex-column">\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/yonetim">Yönetim</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/admin/grup">Grup</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj">Mesaj</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj_map">Mesaj Dağıtım</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/mesaj_bak">Mesaj Bak</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/user/sifre">Şifre</a></li>\n			<li class="nav-item">\n			  <a class="nav-link" href="/start/giris">Çıkış</a></li>\n		 </ul>\n	  </nav>\n', 2, 3, 25, '2020-10-28 00:05:00');
/*!40000 ALTER TABLE `csbc_page` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_page_link
CREATE TABLE IF NOT EXISTS `csbc_page_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `linked_page` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_link_unique` (`link_name`),
  KEY `fk_page_link_user` (`rec_user`),
  KEY `fk_page_link_page` (`linked_page`),
  KEY `jbc_page_link_ibfk_4` (`position`),
  KEY `adr_path_index` (`adr_path`),
  KEY `fk_page_link_theme` (`theme`),
  CONSTRAINT `csbc_page_link_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_page_link: ~31 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_page_link` DISABLE KEYS */;
INSERT INTO `csbc_page_link` (`id`, `link_name`, `adr_path`, `linked_page`, `position`, `theme`, `rec_user`, `rec_date`) VALUES
	(1, 'deneme01', 5, 10, 1, 1, 25, '2020-10-29 10:31:00'),
	(2, 'deneme03', 5, 9, 1, 2, 25, '2020-10-29 10:32:00'),
	(3, 'about', 8, 24, 1, 6, 25, '2020-10-29 10:43:00'),
	(4, 'experience', 8, 25, 1, 6, 25, '2020-10-29 10:45:00'),
	(5, 'expertise', 8, 27, 1, 6, 25, '2020-10-29 10:46:00'),
	(6, 'hakkinda', 8, 28, 1, 5, 25, '2020-10-29 10:46:00'),
	(7, 'kimdir', 8, 29, 1, 5, 25, '2020-10-29 11:12:00'),
	(8, 'tecrubeler', 8, 30, 1, 5, 25, '2020-10-29 11:15:00'),
	(9, 'uzmanlik', 8, 31, 1, 5, 25, '2020-10-29 11:16:00'),
	(10, 'whois', 8, 32, 1, 6, 25, '2020-10-29 11:17:00'),
	(11, 'blog-tr', 9, 34, 1, 5, 25, '2020-10-29 11:19:00'),
	(12, 'blog', 9, 33, 1, 6, 25, '2020-10-29 11:19:00'),
	(13, 'frontside', 9, 35, 1, 6, 25, '2020-10-29 11:26:00'),
	(14, 'onyuz', 9, 40, 1, 5, 25, '2020-10-29 11:27:00'),
	(15, 'jbca-sablon', 9, 36, 1, 5, 25, '2020-10-29 11:29:00'),
	(16, 'jbca-template', 9, 37, 1, 6, 25, '2020-10-29 11:31:00'),
	(17, 'jbca-website-tr', 9, 39, 1, 5, 25, '2020-10-29 11:32:00'),
	(18, 'jbca-website-en', 9, 38, 1, 6, 25, '2020-10-29 11:32:00'),
	(19, 'contact', 10, 41, 1, 6, 25, '2020-10-29 11:34:00'),
	(20, 'iletisim', 10, 42, 1, 5, 25, '2020-10-29 11:39:00'),
	(21, 'consultancy', 12, 43, 1, 6, 25, '2020-10-29 11:40:00'),
	(22, 'danismanlik', 12, 44, 1, 5, 25, '2020-10-29 11:41:00'),
	(23, 'database', 12, 45, 1, 6, 25, '2020-10-29 11:41:00'),
	(24, 'entegrasyon', 12, 46, 1, 5, 25, '2020-10-29 11:42:00'),
	(25, 'hizmetler', 12, 47, 1, 5, 25, '2020-10-29 11:42:00'),
	(26, 'integration', 12, 48, 1, 6, 25, '2020-10-29 11:44:00'),
	(27, 'services', 12, 49, 1, 6, 25, '2020-10-29 11:45:00'),
	(28, 'sistem', 12, 50, 1, 5, 25, '2020-10-29 11:46:00'),
	(29, 'software', 12, 51, 1, 6, 25, '2020-10-29 11:46:00'),
	(30, 'system', 12, 52, 1, 6, 25, '2020-10-29 11:47:00'),
	(31, 'yazilim', 12, 54, 1, 5, 25, '2020-10-29 11:47:00'),
	(32, 'veritabani', 12, 53, 1, 5, 25, '2020-10-29 11:47:00');
/*!40000 ALTER TABLE `csbc_page_link` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_page_map
CREATE TABLE IF NOT EXISTS `csbc_page_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapped_page` int(11) NOT NULL,
  `theme` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_map_unique` (`mapped_page`,`theme`),
  KEY `jbc_page_map_ibfk_2` (`position`),
  KEY `jbc_page_map_ibfk_5` (`rec_user`),
  KEY `jbc_page_map_ibfk_1` (`theme`),
  CONSTRAINT `csbc_page_map_ibfk_1` FOREIGN KEY (`theme`) REFERENCES `csbc_theme` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_map_ibfk_2` FOREIGN KEY (`position`) REFERENCES `csbc_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_map_ibfk_3` FOREIGN KEY (`mapped_page`) REFERENCES `csbc_page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_page_map_ibfk_5` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_page_map: ~7 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_page_map` DISABLE KEYS */;
INSERT INTO `csbc_page_map` (`id`, `mapped_page`, `theme`, `position`, `rec_user`, `rec_date`) VALUES
	(1, 5, 1, 2, 25, '2020-10-29 11:48:00'),
	(3, 20, 5, 4, 25, '2020-10-29 11:49:00'),
	(4, 19, 6, 4, 25, '2020-10-29 11:50:00'),
	(5, 17, 6, 5, 25, '2020-10-29 11:50:00'),
	(6, 18, 5, 5, 25, '2020-10-29 11:51:00'),
	(7, 26, 5, 3, 25, '2020-10-29 11:51:00'),
	(8, 23, 6, 3, 25, '2020-10-29 11:51:00');
/*!40000 ALTER TABLE `csbc_page_map` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_page_type
CREATE TABLE IF NOT EXISTS `csbc_page_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_type_unique` (`page_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_page_type: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_page_type` DISABLE KEYS */;
INSERT INTO `csbc_page_type` (`id`, `page_type_name`) VALUES
	(2, 'info'),
	(1, 'main'),
	(4, 'menu'),
	(3, 'normal');
/*!40000 ALTER TABLE `csbc_page_type` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_path
CREATE TABLE IF NOT EXISTS `csbc_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_unique` (`path_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_path: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_path` DISABLE KEYS */;
INSERT INTO `csbc_path` (`id`, `path_name`) VALUES
	(1, '/CSBCA/admin/'),
	(2, '/CSBCA/code/'),
	(3, '/CSBCA/file/'),
	(4, '/CSBCA/menu/'),
	(5, '/CSBCA/page/'),
	(6, '/CSBCA/reference/'),
	(7, '/CSBCA/user/'),
	(8, '/website/about/'),
	(9, '/website/blog/'),
	(10, '/website/contact/'),
	(11, '/website/menu/'),
	(12, '/website/services/'),
	(13, '/website/theme/');
/*!40000 ALTER TABLE `csbc_path` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_position
CREATE TABLE IF NOT EXISTS `csbc_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_unique` (`pos_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_position: ~6 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_position` DISABLE KEYS */;
INSERT INTO `csbc_position` (`id`, `pos_name`) VALUES
	(5, 'buttom'),
	(1, 'center'),
	(6, 'dene01'),
	(2, 'left'),
	(3, 'right'),
	(4, 'top');
/*!40000 ALTER TABLE `csbc_position` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_status
CREATE TABLE IF NOT EXISTS `csbc_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_unique` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_status: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_status` DISABLE KEYS */;
INSERT INTO `csbc_status` (`id`, `status_name`) VALUES
	(3, 'Active'),
	(4, 'Passive');
/*!40000 ALTER TABLE `csbc_status` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_theme
CREATE TABLE IF NOT EXISTS `csbc_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(150) NOT NULL,
  `adr_path` int(11) NOT NULL,
  `theme_menu` int(11) NOT NULL,
  `rec_user` int(11) NOT NULL,
  `rec_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_unique` (`theme_name`),
  KEY `fk_theme_user` (`rec_user`),
  KEY `fk_theme_path` (`adr_path`),
  KEY `jbc_theme_ibfk_3` (`theme_menu`),
  CONSTRAINT `csbc_theme_ibfk_1` FOREIGN KEY (`rec_user`) REFERENCES `csbc_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_theme_ibfk_2` FOREIGN KEY (`adr_path`) REFERENCES `csbc_path` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_theme_ibfk_3` FOREIGN KEY (`theme_menu`) REFERENCES `csbc_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_theme: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_theme` DISABLE KEYS */;
INSERT INTO `csbc_theme` (`id`, `theme_name`, `adr_path`, `theme_menu`, `rec_user`, `rec_date`) VALUES
	(1, 'Deneme01', 4, 3, 25, '2020-10-29 10:14:00'),
	(5, 'Websitesi-Tema1', 13, 7, 25, '2020-10-29 10:25:00'),
	(6, 'Website-Theme1', 13, 8, 25, '2020-10-29 10:43:00');
/*!40000 ALTER TABLE `csbc_theme` ENABLE KEYS */;

-- tablo yapısı dökülüyor csbcdb.csbc_user
CREATE TABLE IF NOT EXISTS `csbc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(150) NOT NULL,
  `user_code` varchar(30) NOT NULL,
  `user_psw` varchar(300) DEFAULT NULL,
  `user_group` int(11) NOT NULL DEFAULT '15',
  `e_mail` varchar(150) DEFAULT NULL,
  `rec_status` int(11) NOT NULL DEFAULT '3',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `rec_user` int(11) DEFAULT NULL,
  `rec_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`user_code`),
  KEY `jbc_user_ibfk_2` (`rec_status`),
  KEY `jbc_user_ibfk_1` (`user_group`),
  CONSTRAINT `csbc_user_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `csbc_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `csbc_user_ibfk_2` FOREIGN KEY (`rec_status`) REFERENCES `csbc_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- csbcdb.csbc_user: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `csbc_user` DISABLE KEYS */;
INSERT INTO `csbc_user` (`id`, `user_name`, `user_code`, `user_psw`, `user_group`, `e_mail`, `rec_status`, `page_size`, `rec_user`, `rec_date`) VALUES
	(25, 'Hayati KINAŞ', 'hayati', 'C6qaMA6z1GtgXZnW/N+oN3fo8O9OzOnN+9oM8VHmVNE=', 14, 'tst@test.com', 3, 100, 26, '2020-09-24 16:27:00'),
	(26, 'deneme01', 'dnm01', '+KXDxt6hVCnXDzh/MW8KE60ZUSSdbvj5Ne5r2ds9SPo=', 25, 'tst@test.com', 3, 50, 25, '2020-10-17 23:09:00'),
	(27, 'deneme02', 'dnm02', '5b0Rdv/v8k5wFGoDZdCHEE73f7GKT1wjIXH8VY+vj2M=', 14, 'tst@test.com', 3, 50, 25, '2020-09-25 17:22:00'),
	(28, 'deneme03', 'dnm003', '/Wa1mnZY5uBgPnwZLz806vcsRBOxvMA4aQvOMcOZdAk=', 26, 'tst@test.com', 3, 10, 25, '2022-05-23 17:43:00');
/*!40000 ALTER TABLE `csbc_user` ENABLE KEYS */;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_code
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_code` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`code_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`code_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_time` DATETIME NOT NULL,
	`code_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_code_map
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_code_map` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`mapped_code` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_link` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`code_map_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_code_type
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_code_type` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`code_type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`code_type_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_contact
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_contact` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`contact_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`e_mail` VARCHAR(150) NULL COLLATE 'utf8mb4_general_ci',
	`web_site` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`message_data` VARCHAR(10000) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`contact_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_file
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_file` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`file_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`file_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`file_size` INT(11) NULL,
	`mime_type` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`file_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_file_type
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_file_type` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`file_type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`file_type_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_group
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_group` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`group_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`group_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_group_s
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_group_s` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`group_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`group_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_image
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_image` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`image_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`image_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_log` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`rec_id` INT(11) NOT NULL,
	`form_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`table_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`log_data` JSON NOT NULL,
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_time` DATETIME NOT NULL,
	`log_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log_form
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_log_form` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`log_form_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`log_form_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log_table
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_log_table` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`log_table_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`log_table_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log_type
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_log_type` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`log_type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`log_type_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_menu
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_menu` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`menu_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`menu_data` VARCHAR(16000) NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`menu_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_message
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_message` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`msg_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`message_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`msg_data` VARCHAR(16000) NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`message_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_message_map
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_message_map` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`mapped_msg` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`message_map_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_message_type
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_message_type` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`msg_type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`message_type_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_page` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`page_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`page_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page_link
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_page_link` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`link_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`linked_page` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`position` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`theme` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`page_link_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page_map
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_page_map` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`mapped_page` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`theme` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`position` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`page_map_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page_type
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_page_type` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`page_type_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_type_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_path
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_path` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`path_name` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`path_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_position
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_position` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`pos_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`position_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_status
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_status` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`status_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`status_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_theme
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_theme` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`theme_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`adr_path` VARCHAR(300) NOT NULL COLLATE 'utf8mb4_general_ci',
	`theme_menu` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`theme_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_user
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_user` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`user_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_code` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_psw` VARCHAR(300) NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`e_mail` VARCHAR(150) NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_size` INT(11) NOT NULL,
	`rec_user` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NULL,
	`rec_date2` DATETIME NULL,
	`user_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_user_s
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_user_s` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`user_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_code` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`user_psw` VARCHAR(300) NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`e_mail` VARCHAR(150) NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`page_size` INT(11) NOT NULL,
	`rec_user` VARCHAR(30) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NULL,
	`rec_date2` DATETIME NULL,
	`user_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_view_message
-- VIEW bağımlılık sorunlarını çözmek için geçici tablolar oluşturuluyor
CREATE TABLE `vt_csbc_view_message` (
	`id` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`msg_name` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`message_type` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_status` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`msg_data` VARCHAR(16000) NULL COLLATE 'utf8mb4_general_ci',
	`user_group` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_user` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`rec_date` VARCHAR(21) NULL COLLATE 'utf8mb4_general_ci',
	`rec_date1` DATETIME NOT NULL,
	`rec_date2` DATETIME NOT NULL,
	`message_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_code
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_code`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_code` AS select cast(`c`.`id` as char(10) charset utf8) AS `id`,`c`.`code_name` AS `code_name`,`p`.`path_name` AS `adr_path`,`t`.`code_type_name` AS `code_type`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`rec_date` AS `rec_time`,`c`.`id` AS `code_id` from (((`csbc_code` `c` join `csbc_path` `p`) join `csbc_code_type` `t`) join `csbc_user` `u`) where ((`c`.`adr_path` = `p`.`id`) and (`c`.`code_type` = `t`.`id`) and (`c`.`rec_user` = `u`.`id`)) order by `c`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_code_map
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_code_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_code_map` AS select cast(`c`.`id` as char(10) charset utf8) AS `id`,`c`.`code_name` AS `mapped_code`,`pl`.`link_name` AS `page_link`,`u`.`user_code` AS `rec_user`,date_format(`cm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`cm`.`rec_date` AS `rec_date1`,`cm`.`rec_date` AS `rec_date2`,`cm`.`id` AS `code_map_id` from ((((`csbc_code_map` `cm` join `csbc_code` `c`) join `csbc_page_link` `pl`) join `csbc_user` `u`) join `csbc_path` `pt`) where ((`cm`.`mapped_code` = `c`.`id`) and (`cm`.`page_link` = `pl`.`id`) and (`cm`.`rec_user` = `u`.`id`) and (`pl`.`adr_path` = `pt`.`id`)) order by `cm`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_code_type
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_code_type`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_code_type` AS select cast(`csbc_code_type`.`id` as char(10) charset utf8) AS `id`,`csbc_code_type`.`code_type_name` AS `code_type_name`,`csbc_code_type`.`id` AS `code_type_id` from `csbc_code_type` order by `csbc_code_type`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_contact
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_contact`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_contact` AS select cast(`c`.`id` as char(10) charset utf8) AS `id`,`c`.`contact_name` AS `contact_name`,`c`.`e_mail` AS `e_mail`,`c`.`web_site` AS `web_site`,`c`.`message_data` AS `message_data`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`id` AS `contact_id` from (`csbc_contact` `c` left join `csbc_user` `u` on((`c`.`rec_user` = `u`.`id`))) order by `c`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_file
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_file`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_file` AS select cast(`f`.`id` as char(10) charset utf8) AS `id`,`f`.`file_name` AS `file_name`,`p`.`path_name` AS `adr_path`,`ft`.`file_type_name` AS `file_type`,`f`.`file_size` AS `file_size`,`f`.`mime_type` AS `mime_type`,`u`.`user_code` AS `rec_user`,date_format(`f`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`f`.`rec_date` AS `rec_date1`,`f`.`rec_date` AS `rec_date2`,`f`.`id` AS `file_id` from (((`csbc_file` `f` join `csbc_path` `p`) join `csbc_file_type` `ft`) join `csbc_user` `u`) where ((`f`.`adr_path` = `p`.`id`) and (`f`.`file_type` = `ft`.`id`) and (`f`.`rec_user` = `u`.`id`)) order by `f`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_file_type
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_file_type`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_file_type` AS select cast(`csbc_file_type`.`id` as char(10) charset utf8) AS `id`,`csbc_file_type`.`file_type_name` AS `file_type_name`,`csbc_file_type`.`id` AS `file_type_id` from `csbc_file_type` order by `csbc_file_type`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_group
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_group`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_group` AS select cast(`g`.`id` as char(10) charset utf8) AS `id`,`g`.`group_name` AS `group_name`,`g`.`id` AS `group_id` from `csbc_group` `g`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_group_s
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_group_s`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_group_s` AS select cast(`g`.`id` as char(10) charset utf8) AS `id`,`g`.`group_name` AS `group_name`,`g`.`id` AS `group_id` from `csbc_group` `g` where (`g`.`group_name` <> 'Admin');

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_image
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_image`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_image` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`image_name` AS `image_name`,`p`.`path_name` AS `adr_path`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `image_id` from ((`csbc_image` `m` join `csbc_path` `p`) join `csbc_user` `u`) where ((`m`.`adr_path` = `p`.`id`) and (`m`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_log`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_log` AS select cast(`l`.`id` as char(10) charset utf8) AS `id`,`l`.`rec_id` AS `rec_id`,`f`.`log_form_name` AS `form_name`,`t`.`log_type_name` AS `type_name`,`b`.`log_table_name` AS `table_name`,`l`.`log_data` AS `log_data`,`u`.`user_code` AS `rec_user`,date_format(`l`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`l`.`rec_date` AS `rec_time`,`l`.`id` AS `log_id` from ((((`csbc_log` `l` join `csbc_log_table` `b`) join `csbc_log_type` `t`) join `csbc_log_form` `f`) join `csbc_user` `u`) where ((`l`.`form_name` = `f`.`id`) and (`l`.`type_name` = `t`.`id`) and (`l`.`table_name` = `b`.`id`) and (`l`.`rec_user` = `u`.`id`)) order by `l`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log_form
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_log_form`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_log_form` AS select cast(`csbc_log_form`.`id` as char(10) charset utf8) AS `id`,`csbc_log_form`.`log_form_name` AS `log_form_name`,`csbc_log_form`.`id` AS `log_form_id` from `csbc_log_form` order by `csbc_log_form`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log_table
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_log_table`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_log_table` AS select cast(`csbc_log_table`.`id` as char(10) charset utf8) AS `id`,`csbc_log_table`.`log_table_name` AS `log_table_name`,`csbc_log_table`.`id` AS `log_table_id` from `csbc_log_table` order by `csbc_log_table`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_log_type
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_log_type`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_log_type` AS select cast(`csbc_log_type`.`id` as char(10) charset utf8) AS `id`,`csbc_log_type`.`log_type_name` AS `log_type_name`,`csbc_log_type`.`id` AS `log_type_id` from `csbc_log_type` order by `csbc_log_type`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_menu
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_menu`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_menu` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`menu_name` AS `menu_name`,`p`.`path_name` AS `adr_path`,`m`.`menu_data` AS `menu_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `menu_id` from ((`csbc_menu` `m` join `csbc_path` `p`) join `csbc_user` `u`) where ((`m`.`adr_path` = `p`.`id`) and (`m`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_message
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_message`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_message` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `message_id` from (((`csbc_message` `m` join `csbc_status` `s`) join `csbc_user` `u`) join `csbc_message_type` `mt`) where ((`m`.`rec_status` = `s`.`id`) and (`m`.`rec_user` = `u`.`id`) and (`m`.`message_type` = `mt`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_message_map
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_message_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_message_map` AS select cast(`mm`.`id` as char(10) charset utf8) AS `id`,`m`.`msg_name` AS `mapped_msg`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`mm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`mm`.`rec_date` AS `rec_date1`,`mm`.`rec_date` AS `rec_date2`,`mm`.`id` AS `message_map_id` from (((`csbc_message_map` `mm` join `csbc_message` `m`) join `csbc_group` `g`) join `csbc_user` `u`) where ((`mm`.`mapped_msg` = `m`.`id`) and (`mm`.`user_group` = `g`.`id`) and (`mm`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_message_type
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_message_type`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_message_type` AS select cast(`csbc_message_type`.`id` as char(10) charset utf8) AS `id`,`csbc_message_type`.`msg_type_name` AS `msg_type_name`,`csbc_message_type`.`id` AS `message_type_id` from `csbc_message_type` order by `csbc_message_type`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_page`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_page` AS select cast(`p`.`id` as char(10) charset utf8) AS `id`,`p`.`page_name` AS `page_name`,`pt`.`path_name` AS `adr_path`,`py`.`page_type_name` AS `page_type`,`s`.`status_name` AS `rec_status`,`u`.`user_code` AS `rec_user`,date_format(`p`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`p`.`rec_date` AS `rec_date1`,`p`.`rec_date` AS `rec_date2`,`p`.`id` AS `page_id` from ((((`csbc_page` `p` join `csbc_path` `pt`) join `csbc_page_type` `py`) join `csbc_status` `s`) join `csbc_user` `u`) where ((`p`.`adr_path` = `pt`.`id`) and (`p`.`page_type` = `py`.`id`) and (`p`.`rec_status` = `s`.`id`) and (`p`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page_link
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_page_link`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_page_link` AS select cast(`pl`.`id` as char(10) charset utf8) AS `id`,`pl`.`link_name` AS `link_name`,`pt`.`path_name` AS `adr_path`,`p`.`page_name` AS `linked_page`,`ps`.`pos_name` AS `position`,`t`.`theme_name` AS `theme`,`u`.`user_code` AS `rec_user`,date_format(`pl`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pl`.`rec_date` AS `rec_date1`,`pl`.`rec_date` AS `rec_date2`,`pl`.`id` AS `page_link_id` from (((((`csbc_page_link` `pl` join `csbc_path` `pt`) join `csbc_page` `p`) join `csbc_position` `ps`) join `csbc_theme` `t`) join `csbc_user` `u`) where ((`pl`.`adr_path` = `pt`.`id`) and (`pl`.`linked_page` = `p`.`id`) and (`pl`.`position` = `ps`.`id`) and (`pl`.`theme` = `t`.`id`) and (`pl`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page_map
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_page_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_page_map` AS select cast(`pm`.`id` as char(10) charset utf8) AS `id`,`p`.`page_name` AS `mapped_page`,`t`.`theme_name` AS `theme`,`ps`.`pos_name` AS `position`,`u`.`user_code` AS `rec_user`,date_format(`pm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pm`.`rec_date` AS `rec_date1`,`pm`.`rec_date` AS `rec_date2`,`pm`.`id` AS `page_map_id` from ((((`csbc_page_map` `pm` join `csbc_page` `p`) join `csbc_theme` `t`) join `csbc_position` `ps`) join `csbc_user` `u`) where ((`pm`.`mapped_page` = `p`.`id`) and (`pm`.`theme` = `t`.`id`) and (`pm`.`position` = `ps`.`id`) and (`pm`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_page_type
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_page_type`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_page_type` AS select cast(`csbc_page_type`.`id` as char(10) charset utf8) AS `id`,`csbc_page_type`.`page_type_name` AS `page_type_name`,`csbc_page_type`.`id` AS `page_type_id` from `csbc_page_type` order by `csbc_page_type`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_path
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_path`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_path` AS select cast(`csbc_path`.`id` as char(10) charset utf8) AS `id`,`csbc_path`.`path_name` AS `path_name`,`csbc_path`.`id` AS `path_id` from `csbc_path` order by `csbc_path`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_position
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_position`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_position` AS select cast(`csbc_position`.`id` as char(10) charset utf8) AS `id`,`csbc_position`.`pos_name` AS `pos_name`,`csbc_position`.`id` AS `position_id` from `csbc_position` order by `csbc_position`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_status
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_status`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_status` AS select cast(`csbc_status`.`id` as char(10) charset utf8) AS `id`,`csbc_status`.`status_name` AS `status_name`,`csbc_status`.`id` AS `status_id` from `csbc_status` order by `csbc_status`.`id`;

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_theme
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_theme`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_theme` AS select cast(`t`.`id` as char(10) charset utf8) AS `id`,`t`.`theme_name` AS `theme_name`,`pt`.`path_name` AS `adr_path`,`m`.`menu_name` AS `theme_menu`,`u`.`user_code` AS `rec_user`,date_format(`t`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`t`.`rec_date` AS `rec_date1`,`t`.`rec_date` AS `rec_date2`,`t`.`id` AS `theme_id` from (((`csbc_theme` `t` join `csbc_path` `pt`) join `csbc_menu` `m`) join `csbc_user` `u`) where ((`t`.`adr_path` = `pt`.`id`) and (`t`.`theme_menu` = `m`.`id`) and (`t`.`rec_user` = `u`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_user
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_user`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_user` AS select cast(`u`.`id` as char(10) charset utf8) AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `csbc_user` `us` where (`u`.`rec_user` = `us`.`id`)) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2`,`u`.`id` AS `user_id` from ((`csbc_user` `u` join `csbc_group` `g`) join `csbc_status` `s`) where ((`u`.`user_group` = `g`.`id`) and (`u`.`rec_status` = `s`.`id`));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_user_s
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_user_s`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_user_s` AS select cast(`u`.`id` as char(10) charset utf8) AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `csbc_user` `us` where (`u`.`rec_user` = `us`.`id`)) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2`,`u`.`id` AS `user_id` from ((`csbc_user` `u` join `csbc_group` `g`) join `csbc_status` `s`) where ((`u`.`user_group` = `g`.`id`) and (`u`.`rec_status` = `s`.`id`) and (`g`.`group_name` <> 'Admin'));

-- görünüm yapısı dökülüyor csbcdb.vt_csbc_view_message
-- Geçici tablolar temizlenerek final VIEW oluşturuluyor
DROP TABLE IF EXISTS `vt_csbc_view_message`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vt_csbc_view_message` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `message_id` from (((((`csbc_message` `m` join `csbc_status` `s`) join `csbc_user` `u`) join `csbc_message_type` `mt`) join `csbc_message_map` `mm`) join `csbc_group` `g`) where ((`m`.`rec_status` = `s`.`id`) and (`m`.`rec_user` = `u`.`id`) and (`m`.`message_type` = `mt`.`id`) and (`m`.`id` = `mm`.`mapped_msg`) and (`mm`.`user_group` = `g`.`id`));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
