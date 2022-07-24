CREATE TABLE `csbc_code` (
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

CREATE TABLE `csbc_code_map` (
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

CREATE TABLE `csbc_code_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_contact` (
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

CREATE TABLE `csbc_file` (
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

CREATE TABLE `csbc_file_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_type_unique` (`file_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_name_UNIQUE` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_image` (
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

CREATE TABLE `csbc_log` (
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

CREATE TABLE `csbc_log_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_form_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_form_unique` (`log_form_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `csbc_log_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_table_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_table_unique` (`log_table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `csbc_log_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_type_unique` (`log_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `csbc_menu` (
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

CREATE TABLE `csbc_message` (
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

CREATE TABLE `csbc_message_map` (
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

CREATE TABLE `csbc_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_type_unique` (`msg_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_page` (
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

CREATE TABLE `csbc_page_link` (
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

CREATE TABLE `csbc_page_map` (
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

CREATE TABLE `csbc_page_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_type_unique` (`page_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_unique` (`path_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position_unique` (`pos_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_unique` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `csbc_theme` (
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

CREATE TABLE `csbc_user` (
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
