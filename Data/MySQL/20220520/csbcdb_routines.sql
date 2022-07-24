-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: csbcdb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `vt_csbc_log_form`
--

DROP TABLE IF EXISTS `vt_csbc_log_form`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_log_form`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_log_form` AS SELECT 
 1 AS `id`,
 1 AS `log_form_name`,
 1 AS `log_form_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_theme`
--

DROP TABLE IF EXISTS `vt_csbc_theme`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_theme`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_theme` AS SELECT 
 1 AS `id`,
 1 AS `theme_name`,
 1 AS `adr_path`,
 1 AS `theme_menu`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `theme_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_user_s`
--

DROP TABLE IF EXISTS `vt_csbc_user_s`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_user_s`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_user_s` AS SELECT 
 1 AS `id`,
 1 AS `user_name`,
 1 AS `user_code`,
 1 AS `user_psw`,
 1 AS `user_group`,
 1 AS `e_mail`,
 1 AS `rec_status`,
 1 AS `page_size`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_user`
--

DROP TABLE IF EXISTS `vt_csbc_user`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_user` AS SELECT 
 1 AS `id`,
 1 AS `user_name`,
 1 AS `user_code`,
 1 AS `user_psw`,
 1 AS `user_group`,
 1 AS `e_mail`,
 1 AS `rec_status`,
 1 AS `page_size`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_log_table`
--

DROP TABLE IF EXISTS `vt_csbc_log_table`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_log_table`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_log_table` AS SELECT 
 1 AS `id`,
 1 AS `log_table_name`,
 1 AS `log_table_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_page`
--

DROP TABLE IF EXISTS `vt_csbc_page`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_page`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_page` AS SELECT 
 1 AS `id`,
 1 AS `page_name`,
 1 AS `adr_path`,
 1 AS `page_type`,
 1 AS `rec_status`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `page_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_page_type`
--

DROP TABLE IF EXISTS `vt_csbc_page_type`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_page_type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_page_type` AS SELECT 
 1 AS `id`,
 1 AS `page_type_name`,
 1 AS `page_type_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_position`
--

DROP TABLE IF EXISTS `vt_csbc_position`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_position`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_position` AS SELECT 
 1 AS `id`,
 1 AS `pos_name`,
 1 AS `position_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_file_type`
--

DROP TABLE IF EXISTS `vt_csbc_file_type`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_file_type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_file_type` AS SELECT 
 1 AS `id`,
 1 AS `file_type_name`,
 1 AS `file_type_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_image`
--

DROP TABLE IF EXISTS `vt_csbc_image`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_image`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_image` AS SELECT 
 1 AS `id`,
 1 AS `image_name`,
 1 AS `adr_path`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `image_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_group_s`
--

DROP TABLE IF EXISTS `vt_csbc_group_s`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_group_s`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_group_s` AS SELECT 
 1 AS `id`,
 1 AS `group_name`,
 1 AS `group_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_view_message`
--

DROP TABLE IF EXISTS `vt_csbc_view_message`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_view_message`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_view_message` AS SELECT 
 1 AS `id`,
 1 AS `msg_name`,
 1 AS `message_type`,
 1 AS `rec_status`,
 1 AS `msg_data`,
 1 AS `user_group`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `message_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_code_map`
--

DROP TABLE IF EXISTS `vt_csbc_code_map`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_code_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_code_map` AS SELECT 
 1 AS `id`,
 1 AS `mapped_code`,
 1 AS `page_link`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `code_map_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_message`
--

DROP TABLE IF EXISTS `vt_csbc_message`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_message`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_message` AS SELECT 
 1 AS `id`,
 1 AS `msg_name`,
 1 AS `message_type`,
 1 AS `rec_status`,
 1 AS `msg_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `message_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_code`
--

DROP TABLE IF EXISTS `vt_csbc_code`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_code`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_code` AS SELECT 
 1 AS `id`,
 1 AS `code_name`,
 1 AS `adr_path`,
 1 AS `code_type`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_time`,
 1 AS `code_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_log_type`
--

DROP TABLE IF EXISTS `vt_csbc_log_type`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_log_type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_log_type` AS SELECT 
 1 AS `id`,
 1 AS `log_type_name`,
 1 AS `log_type_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_message_map`
--

DROP TABLE IF EXISTS `vt_csbc_message_map`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_message_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_message_map` AS SELECT 
 1 AS `id`,
 1 AS `mapped_msg`,
 1 AS `user_group`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `message_map_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_status`
--

DROP TABLE IF EXISTS `vt_csbc_status`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_status` AS SELECT 
 1 AS `id`,
 1 AS `status_name`,
 1 AS `status_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_page_map`
--

DROP TABLE IF EXISTS `vt_csbc_page_map`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_page_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_page_map` AS SELECT 
 1 AS `id`,
 1 AS `mapped_page`,
 1 AS `theme`,
 1 AS `position`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `page_map_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_page_link`
--

DROP TABLE IF EXISTS `vt_csbc_page_link`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_page_link`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_page_link` AS SELECT 
 1 AS `id`,
 1 AS `link_name`,
 1 AS `adr_path`,
 1 AS `linked_page`,
 1 AS `position`,
 1 AS `theme`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `page_link_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_code_type`
--

DROP TABLE IF EXISTS `vt_csbc_code_type`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_code_type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_code_type` AS SELECT 
 1 AS `id`,
 1 AS `code_type_name`,
 1 AS `code_type_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_contact`
--

DROP TABLE IF EXISTS `vt_csbc_contact`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_contact`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_contact` AS SELECT 
 1 AS `id`,
 1 AS `contact_name`,
 1 AS `e_mail`,
 1 AS `web_site`,
 1 AS `message_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `contact_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_message_type`
--

DROP TABLE IF EXISTS `vt_csbc_message_type`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_message_type`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_message_type` AS SELECT 
 1 AS `id`,
 1 AS `msg_type_name`,
 1 AS `message_type_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_log`
--

DROP TABLE IF EXISTS `vt_csbc_log`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_log` AS SELECT 
 1 AS `id`,
 1 AS `rec_id`,
 1 AS `form_name`,
 1 AS `type_name`,
 1 AS `table_name`,
 1 AS `log_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_time`,
 1 AS `log_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_file`
--

DROP TABLE IF EXISTS `vt_csbc_file`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_file`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_file` AS SELECT 
 1 AS `id`,
 1 AS `file_name`,
 1 AS `adr_path`,
 1 AS `file_type`,
 1 AS `file_size`,
 1 AS `mime_type`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `file_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_path`
--

DROP TABLE IF EXISTS `vt_csbc_path`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_path`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_path` AS SELECT 
 1 AS `id`,
 1 AS `path_name`,
 1 AS `path_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vt_csbc_menu`
--

DROP TABLE IF EXISTS `vt_csbc_menu`;
/*!50001 DROP VIEW IF EXISTS `vt_csbc_menu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vt_csbc_menu` AS SELECT 
 1 AS `id`,
 1 AS `menu_name`,
 1 AS `adr_path`,
 1 AS `menu_data`,
 1 AS `rec_user`,
 1 AS `rec_date`,
 1 AS `rec_date1`,
 1 AS `rec_date2`,
 1 AS `menu_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vt_csbc_log_form`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_log_form`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_log_form` AS select cast(`csbc_log_form`.`id` as char(10) charset utf8) AS `id`,`csbc_log_form`.`log_form_name` AS `log_form_name`,`csbc_log_form`.`id` AS `log_form_id` from `csbc_log_form` order by `csbc_log_form`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_theme`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_theme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_theme` AS select cast(`t`.`id` as char(10) charset utf8) AS `id`,`t`.`theme_name` AS `theme_name`,`pt`.`path_name` AS `adr_path`,`m`.`menu_name` AS `theme_menu`,`u`.`user_code` AS `rec_user`,date_format(`t`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`t`.`rec_date` AS `rec_date1`,`t`.`rec_date` AS `rec_date2`,`t`.`id` AS `theme_id` from (((`csbc_theme` `t` join `csbc_path` `pt`) join `csbc_menu` `m`) join `csbc_user` `u`) where ((`t`.`adr_path` = `pt`.`id`) and (`t`.`theme_menu` = `m`.`id`) and (`t`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_user_s`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_user_s`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_user_s` AS select cast(`u`.`id` as char(10) charset utf8) AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `csbc_user` `us` where (`u`.`rec_user` = `us`.`id`)) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2`,`u`.`id` AS `user_id` from ((`csbc_user` `u` join `csbc_group` `g`) join `csbc_status` `s`) where ((`u`.`user_group` = `g`.`id`) and (`u`.`rec_status` = `s`.`id`) and (`g`.`group_name` <> 'Admin')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_user`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_user` AS select cast(`u`.`id` as char(10) charset utf8) AS `id`,`u`.`user_name` AS `user_name`,`u`.`user_code` AS `user_code`,`u`.`user_psw` AS `user_psw`,`g`.`group_name` AS `user_group`,`u`.`e_mail` AS `e_mail`,`s`.`status_name` AS `rec_status`,`u`.`page_size` AS `page_size`,(select `us`.`user_code` from `csbc_user` `us` where (`u`.`rec_user` = `us`.`id`)) AS `rec_user`,date_format(`u`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`u`.`rec_date` AS `rec_date1`,`u`.`rec_date` AS `rec_date2`,`u`.`id` AS `user_id` from ((`csbc_user` `u` join `csbc_group` `g`) join `csbc_status` `s`) where ((`u`.`user_group` = `g`.`id`) and (`u`.`rec_status` = `s`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_log_table`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_log_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_log_table` AS select cast(`csbc_log_table`.`id` as char(10) charset utf8) AS `id`,`csbc_log_table`.`log_table_name` AS `log_table_name`,`csbc_log_table`.`id` AS `log_table_id` from `csbc_log_table` order by `csbc_log_table`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_page`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_page` AS select cast(`p`.`id` as char(10) charset utf8) AS `id`,`p`.`page_name` AS `page_name`,`pt`.`path_name` AS `adr_path`,`py`.`page_type_name` AS `page_type`,`s`.`status_name` AS `rec_status`,`u`.`user_code` AS `rec_user`,date_format(`p`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`p`.`rec_date` AS `rec_date1`,`p`.`rec_date` AS `rec_date2`,`p`.`id` AS `page_id` from ((((`csbc_page` `p` join `csbc_path` `pt`) join `csbc_page_type` `py`) join `csbc_status` `s`) join `csbc_user` `u`) where ((`p`.`adr_path` = `pt`.`id`) and (`p`.`page_type` = `py`.`id`) and (`p`.`rec_status` = `s`.`id`) and (`p`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_page_type`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_page_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_page_type` AS select cast(`csbc_page_type`.`id` as char(10) charset utf8) AS `id`,`csbc_page_type`.`page_type_name` AS `page_type_name`,`csbc_page_type`.`id` AS `page_type_id` from `csbc_page_type` order by `csbc_page_type`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_position`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_position`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_position` AS select cast(`csbc_position`.`id` as char(10) charset utf8) AS `id`,`csbc_position`.`pos_name` AS `pos_name`,`csbc_position`.`id` AS `position_id` from `csbc_position` order by `csbc_position`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_file_type`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_file_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_file_type` AS select cast(`csbc_file_type`.`id` as char(10) charset utf8) AS `id`,`csbc_file_type`.`file_type_name` AS `file_type_name`,`csbc_file_type`.`id` AS `file_type_id` from `csbc_file_type` order by `csbc_file_type`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_image`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_image`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_image` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`image_name` AS `image_name`,`p`.`path_name` AS `adr_path`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `image_id` from ((`csbc_image` `m` join `csbc_path` `p`) join `csbc_user` `u`) where ((`m`.`adr_path` = `p`.`id`) and (`m`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_group_s`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_group_s`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_group_s` AS select cast(`g`.`id` as char(10) charset utf8) AS `id`,`g`.`group_name` AS `group_name`,`g`.`id` AS `group_id` from `csbc_group` `g` where (`g`.`group_name` <> 'Admin') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_view_message`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_view_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_view_message` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `message_id` from (((((`csbc_message` `m` join `csbc_status` `s`) join `csbc_user` `u`) join `csbc_message_type` `mt`) join `csbc_message_map` `mm`) join `csbc_group` `g`) where ((`m`.`rec_status` = `s`.`id`) and (`m`.`rec_user` = `u`.`id`) and (`m`.`message_type` = `mt`.`id`) and (`m`.`id` = `mm`.`mapped_msg`) and (`mm`.`user_group` = `g`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_code_map`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_code_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_code_map` AS select cast(`c`.`id` as char(10) charset utf8) AS `id`,`c`.`code_name` AS `mapped_code`,`pl`.`link_name` AS `page_link`,`u`.`user_code` AS `rec_user`,date_format(`cm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`cm`.`rec_date` AS `rec_date1`,`cm`.`rec_date` AS `rec_date2`,`cm`.`id` AS `code_map_id` from ((((`csbc_code_map` `cm` join `csbc_code` `c`) join `csbc_page_link` `pl`) join `csbc_user` `u`) join `csbc_path` `pt`) where ((`cm`.`mapped_code` = `c`.`id`) and (`cm`.`page_link` = `pl`.`id`) and (`cm`.`rec_user` = `u`.`id`) and (`pl`.`adr_path` = `pt`.`id`)) order by `cm`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_message`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_message` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`msg_name` AS `msg_name`,`mt`.`msg_type_name` AS `message_type`,`s`.`status_name` AS `rec_status`,`m`.`msg_data` AS `msg_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `message_id` from (((`csbc_message` `m` join `csbc_status` `s`) join `csbc_user` `u`) join `csbc_message_type` `mt`) where ((`m`.`rec_status` = `s`.`id`) and (`m`.`rec_user` = `u`.`id`) and (`m`.`message_type` = `mt`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_code`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_code`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_code` AS select cast(`c`.`id` as char(10) charset utf8) AS `id`,`c`.`code_name` AS `code_name`,`p`.`path_name` AS `adr_path`,`t`.`code_type_name` AS `code_type`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`rec_date` AS `rec_time`,`c`.`id` AS `code_id` from (((`csbc_code` `c` join `csbc_path` `p`) join `csbc_code_type` `t`) join `csbc_user` `u`) where ((`c`.`adr_path` = `p`.`id`) and (`c`.`code_type` = `t`.`id`) and (`c`.`rec_user` = `u`.`id`)) order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_log_type`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_log_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_log_type` AS select cast(`csbc_log_type`.`id` as char(10) charset utf8) AS `id`,`csbc_log_type`.`log_type_name` AS `log_type_name`,`csbc_log_type`.`id` AS `log_type_id` from `csbc_log_type` order by `csbc_log_type`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_message_map`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_message_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_message_map` AS select cast(`mm`.`id` as char(10) charset utf8) AS `id`,`m`.`msg_name` AS `mapped_msg`,`g`.`group_name` AS `user_group`,`u`.`user_code` AS `rec_user`,date_format(`mm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`mm`.`rec_date` AS `rec_date1`,`mm`.`rec_date` AS `rec_date2`,`mm`.`id` AS `message_map_id` from (((`csbc_message_map` `mm` join `csbc_message` `m`) join `csbc_group` `g`) join `csbc_user` `u`) where ((`mm`.`mapped_msg` = `m`.`id`) and (`mm`.`user_group` = `g`.`id`) and (`mm`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_status`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_status` AS select cast(`csbc_status`.`id` as char(10) charset utf8) AS `id`,`csbc_status`.`status_name` AS `status_name`,`csbc_status`.`id` AS `status_id` from `csbc_status` order by `csbc_status`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_page_map`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_page_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_page_map` AS select cast(`pm`.`id` as char(10) charset utf8) AS `id`,`p`.`page_name` AS `mapped_page`,`t`.`theme_name` AS `theme`,`ps`.`pos_name` AS `position`,`u`.`user_code` AS `rec_user`,date_format(`pm`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pm`.`rec_date` AS `rec_date1`,`pm`.`rec_date` AS `rec_date2`,`pm`.`id` AS `page_map_id` from ((((`csbc_page_map` `pm` join `csbc_page` `p`) join `csbc_theme` `t`) join `csbc_position` `ps`) join `csbc_user` `u`) where ((`pm`.`mapped_page` = `p`.`id`) and (`pm`.`theme` = `t`.`id`) and (`pm`.`position` = `ps`.`id`) and (`pm`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_page_link`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_page_link`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_page_link` AS select cast(`pl`.`id` as char(10) charset utf8) AS `id`,`pl`.`link_name` AS `link_name`,`pt`.`path_name` AS `adr_path`,`p`.`page_name` AS `linked_page`,`ps`.`pos_name` AS `position`,`t`.`theme_name` AS `theme`,`u`.`user_code` AS `rec_user`,date_format(`pl`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`pl`.`rec_date` AS `rec_date1`,`pl`.`rec_date` AS `rec_date2`,`pl`.`id` AS `page_link_id` from (((((`csbc_page_link` `pl` join `csbc_path` `pt`) join `csbc_page` `p`) join `csbc_position` `ps`) join `csbc_theme` `t`) join `csbc_user` `u`) where ((`pl`.`adr_path` = `pt`.`id`) and (`pl`.`linked_page` = `p`.`id`) and (`pl`.`position` = `ps`.`id`) and (`pl`.`theme` = `t`.`id`) and (`pl`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_code_type`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_code_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_code_type` AS select cast(`csbc_code_type`.`id` as char(10) charset utf8) AS `id`,`csbc_code_type`.`code_type_name` AS `code_type_name`,`csbc_code_type`.`id` AS `code_type_id` from `csbc_code_type` order by `csbc_code_type`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_contact`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_contact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_contact` AS select cast(`c`.`id` as char(10) charset utf8) AS `id`,`c`.`contact_name` AS `contact_name`,`c`.`e_mail` AS `e_mail`,`c`.`web_site` AS `web_site`,`c`.`message_data` AS `message_data`,`u`.`user_code` AS `rec_user`,date_format(`c`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`c`.`id` AS `contact_id` from (`csbc_contact` `c` left join `csbc_user` `u` on((`c`.`rec_user` = `u`.`id`))) order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_message_type`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_message_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_message_type` AS select cast(`csbc_message_type`.`id` as char(10) charset utf8) AS `id`,`csbc_message_type`.`msg_type_name` AS `msg_type_name`,`csbc_message_type`.`id` AS `message_type_id` from `csbc_message_type` order by `csbc_message_type`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_log`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_log` AS select cast(`l`.`id` as char(10) charset utf8) AS `id`,`l`.`rec_id` AS `rec_id`,`f`.`log_form_name` AS `form_name`,`t`.`log_type_name` AS `type_name`,`b`.`log_table_name` AS `table_name`,`l`.`log_data` AS `log_data`,`u`.`user_code` AS `rec_user`,date_format(`l`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`l`.`rec_date` AS `rec_time`,`l`.`id` AS `log_id` from ((((`csbc_log` `l` join `csbc_log_table` `b`) join `csbc_log_type` `t`) join `csbc_log_form` `f`) join `csbc_user` `u`) where ((`l`.`form_name` = `f`.`id`) and (`l`.`type_name` = `t`.`id`) and (`l`.`table_name` = `b`.`id`) and (`l`.`rec_user` = `u`.`id`)) order by `l`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_file`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_file`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_file` AS select cast(`f`.`id` as char(10) charset utf8) AS `id`,`f`.`file_name` AS `file_name`,`p`.`path_name` AS `adr_path`,`ft`.`file_type_name` AS `file_type`,`f`.`file_size` AS `file_size`,`f`.`mime_type` AS `mime_type`,`u`.`user_code` AS `rec_user`,date_format(`f`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`f`.`rec_date` AS `rec_date1`,`f`.`rec_date` AS `rec_date2`,`f`.`id` AS `file_id` from (((`csbc_file` `f` join `csbc_path` `p`) join `csbc_file_type` `ft`) join `csbc_user` `u`) where ((`f`.`adr_path` = `p`.`id`) and (`f`.`file_type` = `ft`.`id`) and (`f`.`rec_user` = `u`.`id`)) order by `f`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_path`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_path`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_path` AS select cast(`csbc_path`.`id` as char(10) charset utf8) AS `id`,`csbc_path`.`path_name` AS `path_name`,`csbc_path`.`id` AS `path_id` from `csbc_path` order by `csbc_path`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vt_csbc_menu`
--

/*!50001 DROP VIEW IF EXISTS `vt_csbc_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vt_csbc_menu` AS select cast(`m`.`id` as char(10) charset utf8) AS `id`,`m`.`menu_name` AS `menu_name`,`p`.`path_name` AS `adr_path`,`m`.`menu_data` AS `menu_data`,`u`.`user_code` AS `rec_user`,date_format(`m`.`rec_date`,'%d.%m.%Y %H:%i') AS `rec_date`,`m`.`rec_date` AS `rec_date1`,`m`.`rec_date` AS `rec_date2`,`m`.`id` AS `menu_id` from ((`csbc_menu` `m` join `csbc_path` `p`) join `csbc_user` `u`) where ((`m`.`adr_path` = `p`.`id`) and (`m`.`rec_user` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-20 15:39:22
