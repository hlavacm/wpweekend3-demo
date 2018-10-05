# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.21-MariaDB)
# Database: wpweekend3-demo
# Generation Time: 2018-10-05 13:21:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table kt_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kt_logs`;

CREATE TABLE `kt_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(5) unsigned NOT NULL,
  `scope` varchar(30) DEFAULT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `logged_user_name` varchar(60) DEFAULT NULL,
  `file` varchar(300) DEFAULT NULL,
  `line` int(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table kt_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kt_termmeta`;

CREATE TABLE `kt_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ktterm_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `ktterm_id` (`ktterm_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table wpw_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_commentmeta`;

CREATE TABLE `wpw_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wpw_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_comments`;

CREATE TABLE `wpw_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_comments` WRITE;
/*!40000 ALTER TABLE `wpw_comments` DISABLE KEYS */;

INSERT INTO `wpw_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`)
VALUES
	(1,1,'WordPress komentátor','wapuu@wordpress.example','https://wordpress.org/','','2018-10-03 15:39:08','2018-10-03 13:39:08','Zdravím, tohle je komentář.\nChcete-li začít se schvalováním, úpravami a mazáním komentářů, pak si prohlédněte sekci Komentáře na nástěnce.\nProfilové obrázky komentujících vám přináší služba <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);

/*!40000 ALTER TABLE `wpw_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_links`;

CREATE TABLE `wpw_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wpw_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_options`;

CREATE TABLE `wpw_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_options` WRITE;
/*!40000 ALTER TABLE `wpw_options` DISABLE KEYS */;

INSERT INTO `wpw_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://localhost/test/wpweekend3-demo','yes'),
	(2,'home','http://localhost/test/wpweekend3-demo','yes'),
	(3,'blogname','WP Weekend #3 DEMO','yes'),
	(4,'blogdescription','Další web používající WordPress','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','admin@localhost','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','1','yes'),
	(14,'mailserver_url','','yes'),
	(15,'mailserver_login','','yes'),
	(16,'mailserver_pass','','yes'),
	(17,'mailserver_port','0','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','closed','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','j. n. Y','yes'),
	(24,'time_format','G:i','yes'),
	(25,'links_updated_date_format','j. n. Y, G:i','yes'),
	(26,'comment_moderation','1','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/%postname%/','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:3:{i:0;s:38:\"password-bcrypt/wp-password-bcrypt.php\";i:1;s:24:\"wordpress-seo/wp-seo.php\";i:2;s:18:\"wp-tracy/index.php\";}','yes'),
	(34,'category_base','/kategorie','yes'),
	(35,'ping_sites','','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','0','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','','no'),
	(40,'template','wpframework','yes'),
	(41,'stylesheet','wpframework','yes'),
	(42,'comment_whitelist','1','yes'),
	(43,'blacklist_keys','','no'),
	(44,'comment_registration','1','yes'),
	(45,'html_type','text/html','yes'),
	(46,'use_trackback','0','yes'),
	(47,'default_role','subscriber','yes'),
	(48,'db_version','38590','yes'),
	(49,'uploads_use_yearmonth_folders','1','yes'),
	(50,'upload_path','','yes'),
	(51,'blog_public','1','yes'),
	(52,'default_link_category','0','yes'),
	(53,'show_on_front','page','yes'),
	(54,'tag_base','/stitek','yes'),
	(55,'show_avatars','','yes'),
	(56,'avatar_rating','G','yes'),
	(57,'upload_url_path','','yes'),
	(58,'thumbnail_size_w','150','yes'),
	(59,'thumbnail_size_h','150','yes'),
	(60,'thumbnail_crop','1','yes'),
	(61,'medium_size_w','300','yes'),
	(62,'medium_size_h','300','yes'),
	(63,'avatar_default','mystery','yes'),
	(64,'large_size_w','1024','yes'),
	(65,'large_size_h','1024','yes'),
	(66,'image_default_link_type','none','yes'),
	(67,'image_default_size','','yes'),
	(68,'image_default_align','','yes'),
	(69,'close_comments_for_old_posts','','yes'),
	(70,'close_comments_days_old','14','yes'),
	(71,'thread_comments','1','yes'),
	(72,'thread_comments_depth','5','yes'),
	(73,'page_comments','','yes'),
	(74,'comments_per_page','50','yes'),
	(75,'default_comments_page','newest','yes'),
	(76,'comment_order','asc','yes'),
	(77,'sticky_posts','a:0:{}','yes'),
	(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'widget_text','a:0:{}','yes'),
	(80,'widget_rss','a:0:{}','yes'),
	(81,'uninstall_plugins','a:0:{}','no'),
	(82,'timezone_string','Europe/Prague','yes'),
	(83,'page_for_posts','8','yes'),
	(84,'page_on_front','6','yes'),
	(85,'default_post_format','0','yes'),
	(86,'link_manager_enabled','0','yes'),
	(87,'finished_splitting_shared_terms','1','yes'),
	(88,'site_icon','0','yes'),
	(89,'medium_large_size_w','768','yes'),
	(90,'medium_large_size_h','0','yes'),
	(91,'wp_page_for_privacy_policy','3','yes'),
	(92,'show_comments_cookies_opt_in','','yes'),
	(93,'initial_db_version','38590','yes'),
	(94,'wpw_user_roles','a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"wpseo_manager\";a:2:{s:4:\"name\";s:11:\"SEO Manager\";s:12:\"capabilities\";a:37:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;s:20:\"wpseo_manage_options\";b:1;}}s:12:\"wpseo_editor\";a:2:{s:4:\"name\";s:10:\"SEO Editor\";s:12:\"capabilities\";a:36:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:15:\"wpseo_bulk_edit\";b:1;s:28:\"wpseo_edit_advanced_metadata\";b:1;}}}','yes'),
	(95,'fresh_site','0','yes'),
	(96,'WPLANG','cs_CZ','yes'),
	(97,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(98,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(99,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(100,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(101,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(102,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:22:\"kt-wpw-sidebar-default\";a:0:{}s:13:\"array_version\";i:3;}','yes'),
	(103,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(104,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(105,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(106,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(107,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(108,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(109,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(110,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(111,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'cron','a:5:{i:1538746748;a:4:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1538747401;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1538747463;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1538747897;a:1:{s:19:\"wpseo-reindex-links\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),
	(113,'theme_mods_twentyseventeen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1538574605;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),
	(126,'_site_transient_timeout_browser_117d027bc63f9b54139565791a79400c','1539178756','no'),
	(127,'_site_transient_browser_117d027bc63f9b54139565791a79400c','a:10:{s:4:\"name\";s:5:\"Opera\";s:7:\"version\";s:12:\"55.0.2994.61\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:22:\"https://www.opera.com/\";s:7:\"img_src\";s:42:\"http://s.w.org/images/browsers/opera.png?1\";s:11:\"img_src_ssl\";s:43:\"https://s.w.org/images/browsers/opera.png?1\";s:15:\"current_version\";s:5:\"12.18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(130,'can_compress_scripts','1','no'),
	(142,'current_theme','WP Framework (Skeleton)','yes'),
	(143,'theme_mods_wpframework','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:27:\"kt-wpw-navigation-main-menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}','yes'),
	(144,'theme_switched','','yes'),
	(158,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),
	(161,'recently_activated','a:0:{}','yes'),
	(167,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/cs_CZ/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"cs_CZ\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/cs_CZ/wordpress-4.9.8.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1538745656;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}','no'),
	(169,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1538745658;s:7:\"checked\";a:1:{s:11:\"wpframework\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),
	(170,'wpseo','a:19:{s:15:\"ms_defaults_set\";b:0;s:7:\"version\";s:3:\"8.3\";s:20:\"disableadvanced_meta\";b:1;s:19:\"onpage_indexability\";b:1;s:11:\"baiduverify\";s:0:\"\";s:12:\"googleverify\";s:0:\"\";s:8:\"msverify\";s:0:\"\";s:12:\"yandexverify\";s:0:\"\";s:9:\"site_type\";s:0:\"\";s:20:\"has_multiple_authors\";s:0:\"\";s:16:\"environment_type\";s:0:\"\";s:23:\"content_analysis_active\";b:1;s:23:\"keyword_analysis_active\";b:1;s:21:\"enable_admin_bar_menu\";b:1;s:26:\"enable_cornerstone_content\";b:1;s:18:\"enable_xml_sitemap\";b:1;s:24:\"enable_text_link_counter\";b:1;s:22:\"show_onboarding_notice\";b:1;s:18:\"first_activated_on\";i:1538575096;}','yes'),
	(171,'wpseo_titles','a:75:{s:10:\"title_test\";i:0;s:17:\"forcerewritetitle\";b:0;s:9:\"separator\";s:7:\"sc-dash\";s:16:\"title-home-wpseo\";s:42:\"%%sitename%% %%page%% %%sep%% %%sitedesc%%\";s:18:\"title-author-wpseo\";s:41:\"%%name%%, Author at %%sitename%% %%page%%\";s:19:\"title-archive-wpseo\";s:38:\"%%date%% %%page%% %%sep%% %%sitename%%\";s:18:\"title-search-wpseo\";s:71:\"Výsledky vyhledávání %%searchphrase%% %%page%% %%sep%% %%sitename%%\";s:15:\"title-404-wpseo\";s:40:\"Stránka nenalezena %%sep%% %%sitename%%\";s:19:\"metadesc-home-wpseo\";s:0:\"\";s:21:\"metadesc-author-wpseo\";s:0:\"\";s:22:\"metadesc-archive-wpseo\";s:0:\"\";s:9:\"rssbefore\";s:0:\"\";s:8:\"rssafter\";s:53:\"The post %%POSTLINK%% appeared first on %%BLOGLINK%%.\";s:20:\"noindex-author-wpseo\";b:0;s:28:\"noindex-author-noposts-wpseo\";b:1;s:21:\"noindex-archive-wpseo\";b:1;s:14:\"disable-author\";b:0;s:12:\"disable-date\";b:0;s:19:\"disable-post_format\";b:0;s:18:\"disable-attachment\";b:1;s:23:\"is-media-purge-relevant\";b:0;s:20:\"breadcrumbs-404crumb\";s:35:\"Chyba 404: Stránka nebyla nalezena\";s:29:\"breadcrumbs-display-blog-page\";b:1;s:20:\"breadcrumbs-boldlast\";b:0;s:25:\"breadcrumbs-archiveprefix\";s:11:\"Archivy pro\";s:18:\"breadcrumbs-enable\";b:0;s:16:\"breadcrumbs-home\";s:5:\"Domů\";s:18:\"breadcrumbs-prefix\";s:0:\"\";s:24:\"breadcrumbs-searchprefix\";s:12:\"Hledali jste\";s:15:\"breadcrumbs-sep\";s:7:\"&raquo;\";s:12:\"website_name\";s:0:\"\";s:11:\"person_name\";s:0:\"\";s:22:\"alternate_website_name\";s:0:\"\";s:12:\"company_logo\";s:0:\"\";s:12:\"company_name\";s:0:\"\";s:17:\"company_or_person\";s:0:\"\";s:17:\"stripcategorybase\";b:0;s:10:\"title-post\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-post\";s:0:\"\";s:12:\"noindex-post\";b:0;s:13:\"showdate-post\";b:0;s:23:\"display-metabox-pt-post\";b:1;s:10:\"title-page\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:13:\"metadesc-page\";s:0:\"\";s:12:\"noindex-page\";b:0;s:13:\"showdate-page\";b:0;s:23:\"display-metabox-pt-page\";b:1;s:16:\"title-attachment\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:19:\"metadesc-attachment\";s:0:\"\";s:18:\"noindex-attachment\";b:0;s:19:\"showdate-attachment\";b:0;s:29:\"display-metabox-pt-attachment\";b:1;s:15:\"title-reference\";s:39:\"%%title%% %%page%% %%sep%% %%sitename%%\";s:18:\"metadesc-reference\";s:0:\"\";s:17:\"noindex-reference\";b:0;s:18:\"showdate-reference\";b:0;s:28:\"display-metabox-pt-reference\";b:1;s:25:\"title-ptarchive-reference\";s:51:\"%%pt_plural%% Archív %%page%% %%sep%% %%sitename%%\";s:28:\"metadesc-ptarchive-reference\";s:0:\"\";s:27:\"bctitle-ptarchive-reference\";s:0:\"\";s:27:\"noindex-ptarchive-reference\";b:0;s:18:\"title-tax-category\";s:52:\"%%term_title%% Archivy %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-category\";s:0:\"\";s:28:\"display-metabox-tax-category\";b:1;s:20:\"noindex-tax-category\";b:0;s:18:\"title-tax-post_tag\";s:52:\"%%term_title%% Archivy %%page%% %%sep%% %%sitename%%\";s:21:\"metadesc-tax-post_tag\";s:0:\"\";s:28:\"display-metabox-tax-post_tag\";b:1;s:20:\"noindex-tax-post_tag\";b:0;s:21:\"title-tax-post_format\";s:52:\"%%term_title%% Archivy %%page%% %%sep%% %%sitename%%\";s:24:\"metadesc-tax-post_format\";s:0:\"\";s:31:\"display-metabox-tax-post_format\";b:1;s:23:\"noindex-tax-post_format\";b:1;s:23:\"post_types-post-maintax\";i:0;s:28:\"post_types-reference-maintax\";i:0;}','yes'),
	(172,'wpseo_social','a:18:{s:13:\"facebook_site\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:11:\"myspace_url\";s:0:\"\";s:16:\"og_default_image\";s:0:\"\";s:18:\"og_frontpage_title\";s:0:\"\";s:17:\"og_frontpage_desc\";s:0:\"\";s:18:\"og_frontpage_image\";s:0:\"\";s:9:\"opengraph\";b:1;s:13:\"pinterest_url\";s:0:\"\";s:15:\"pinterestverify\";s:0:\"\";s:14:\"plus-publisher\";s:0:\"\";s:7:\"twitter\";b:1;s:12:\"twitter_site\";s:0:\"\";s:17:\"twitter_card_type\";s:19:\"summary_large_image\";s:11:\"youtube_url\";s:0:\"\";s:15:\"google_plus_url\";s:0:\"\";s:10:\"fbadminapp\";s:0:\"\";}','yes'),
	(173,'wpseo_flush_rewrite','1','yes'),
	(174,'_transient_timeout_wpseo_link_table_inaccessible','1570111097','no'),
	(175,'_transient_wpseo_link_table_inaccessible','0','no'),
	(176,'_transient_timeout_wpseo_meta_table_inaccessible','1570111097','no'),
	(177,'_transient_wpseo_meta_table_inaccessible','0','no'),
	(179,'rewrite_rules','a:136:{s:19:\"sitemap_index\\.xml$\";s:19:\"index.php?sitemap=1\";s:31:\"([^/]+?)-sitemap([0-9]+)?\\.xml$\";s:51:\"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]\";s:24:\"([a-z]+)?-?sitemap\\.xsl$\";s:25:\"index.php?xsl=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:7:\"blog/?$\";s:24:\"index.php?post_type=post\";s:12:\"reference/?$\";s:29:\"index.php?post_type=reference\";s:42:\"reference/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=reference&feed=$matches[1]\";s:37:\"reference/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?post_type=reference&feed=$matches[1]\";s:29:\"reference/page/([0-9]{1,})/?$\";s:47:\"index.php?post_type=reference&paged=$matches[1]\";s:48:\"kategorie/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:43:\"kategorie/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:24:\"kategorie/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:36:\"kategorie/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:18:\"kategorie/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:47:\"stitek/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:42:\"stitek/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:23:\"stitek/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:35:\"stitek/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:17:\"stitek/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:37:\"reference/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"reference/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"reference/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"reference/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"reference/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"reference/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"reference/([^/]+)/embed/?$\";s:42:\"index.php?reference=$matches[1]&embed=true\";s:30:\"reference/([^/]+)/trackback/?$\";s:36:\"index.php?reference=$matches[1]&tb=1\";s:50:\"reference/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?reference=$matches[1]&feed=$matches[2]\";s:45:\"reference/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?reference=$matches[1]&feed=$matches[2]\";s:38:\"reference/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?reference=$matches[1]&paged=$matches[2]\";s:45:\"reference/([^/]+)/comment-page-([0-9]{1,})/?$\";s:49:\"index.php?reference=$matches[1]&cpage=$matches[2]\";s:34:\"reference/([^/]+)(?:/([0-9]+))?/?$\";s:48:\"index.php?reference=$matches[1]&page=$matches[2]\";s:26:\"reference/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:36:\"reference/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:56:\"reference/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"reference/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:51:\"reference/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"reference/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:60:\"kategorie-referenci/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:70:\"index.php?taxonomy=referencecategory&term=$matches[1]&feed=$matches[2]\";s:55:\"kategorie-referenci/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:70:\"index.php?taxonomy=referencecategory&term=$matches[1]&feed=$matches[2]\";s:36:\"kategorie-referenci/([^/]+)/embed/?$\";s:64:\"index.php?taxonomy=referencecategory&term=$matches[1]&embed=true\";s:48:\"kategorie-referenci/([^/]+)/page/?([0-9]{1,})/?$\";s:71:\"index.php?taxonomy=referencecategory&term=$matches[1]&paged=$matches[2]\";s:30:\"kategorie-referenci/([^/]+)/?$\";s:53:\"index.php?taxonomy=referencecategory&term=$matches[1]\";s:34:\"slider/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"slider/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"slider/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"slider/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"slider/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"slider/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"slider/([^/]+)/embed/?$\";s:39:\"index.php?slider=$matches[1]&embed=true\";s:27:\"slider/([^/]+)/trackback/?$\";s:33:\"index.php?slider=$matches[1]&tb=1\";s:35:\"slider/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?slider=$matches[1]&paged=$matches[2]\";s:42:\"slider/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?slider=$matches[1]&cpage=$matches[2]\";s:31:\"slider/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?slider=$matches[1]&page=$matches[2]\";s:23:\"slider/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"slider/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"slider/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"slider/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"slider/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"slider/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=6&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),
	(185,'wpseo_sitemap_1_cache_validator','4rqv9','no'),
	(186,'wpseo_sitemap_category_cache_validator','4rqvc','no'),
	(187,'wpseo_sitemap_post_cache_validator','4rqve','no'),
	(194,'_transient_timeout_yoast_i18n_wordpress-seo_cs_CZ','1538742744','no'),
	(195,'_transient_yoast_i18n_wordpress-seo_cs_CZ','O:8:\"stdClass\":12:{s:2:\"id\";s:6:\"396132\";s:4:\"name\";s:5:\"Czech\";s:4:\"slug\";s:7:\"default\";s:10:\"project_id\";s:4:\"3158\";s:6:\"locale\";s:2:\"cs\";s:13:\"current_count\";i:1070;s:18:\"untranslated_count\";i:142;s:13:\"waiting_count\";i:5;s:11:\"fuzzy_count\";i:0;s:18:\"percent_translated\";i:88;s:9:\"wp_locale\";s:5:\"cs_CZ\";s:13:\"last_modified\";s:19:\"2018-09-25 10:46:22\";}','no'),
	(209,'_transient_timeout_plugin_slugs','1538832062','no'),
	(210,'_transient_plugin_slugs','a:3:{i:0;s:38:\"password-bcrypt/wp-password-bcrypt.php\";i:1;s:18:\"wp-tracy/index.php\";i:2;s:24:\"wordpress-seo/wp-seo.php\";}','no'),
	(211,'_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a','1538756446','no'),
	(212,'_site_transient_poptags_40cd750bba9870f18aada2478b24840a','O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4511;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:3039;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2593;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2450;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1884;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1681;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1675;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1462;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1404;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1403;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1403;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1335;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1285;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1248;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1116;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1076;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1047;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1041;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:929;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:893;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:836;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:818;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:809;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:736;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:705;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:696;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:691;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:689;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:686;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:668;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:662;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:659;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:649;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:645;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:620;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:619;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:616;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:607;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:601;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:600;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:573;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:555;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:548;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:544;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:533;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:528;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:524;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:518;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:515;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:512;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:505;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:497;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:492;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:489;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:483;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:480;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:460;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:459;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:454;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:451;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:445;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:437;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:424;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:422;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:421;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:419;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:417;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:416;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:409;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:392;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:388;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:378;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:374;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:372;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:367;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:366;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:364;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:363;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:355;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:352;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:349;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:349;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:343;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:340;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:339;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:335;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:330;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:329;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:312;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:310;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:309;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:309;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:305;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:304;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:303;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:302;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:301;}s:16:\"google-analytics\";a:3:{s:4:\"name\";s:16:\"google analytics\";s:4:\"slug\";s:16:\"google-analytics\";s:5:\"count\";i:301;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:299;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:293;}}','no'),
	(214,'_site_transient_timeout_theme_roots','1538747457','no'),
	(215,'_site_transient_theme_roots','a:1:{s:11:\"wpframework\";s:7:\"/themes\";}','no'),
	(216,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1538745661;s:7:\"checked\";a:3:{s:38:\"password-bcrypt/wp-password-bcrypt.php\";s:5:\"1.0.3\";s:18:\"wp-tracy/index.php\";s:5:\"2.0.1\";s:24:\"wordpress-seo/wp-seo.php\";s:3:\"8.3\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:38:\"password-bcrypt/wp-password-bcrypt.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/password-bcrypt\";s:4:\"slug\";s:15:\"password-bcrypt\";s:6:\"plugin\";s:38:\"password-bcrypt/wp-password-bcrypt.php\";s:11:\"new_version\";s:5:\"1.0.3\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/password-bcrypt/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/password-bcrypt.1.0.3.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:59:\"https://s.w.org/plugins/geopattern-icon/password-bcrypt.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:18:\"wp-tracy/index.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/wp-tracy\";s:4:\"slug\";s:8:\"wp-tracy\";s:6:\"plugin\";s:18:\"wp-tracy/index.php\";s:11:\"new_version\";s:5:\"2.0.1\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/wp-tracy/\";s:7:\"package\";s:51:\"https://downloads.wordpress.org/plugin/wp-tracy.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/wp-tracy/assets/icon-256x256.png?rev=1943241\";s:2:\"1x\";s:61:\"https://ps.w.org/wp-tracy/assets/icon-128x128.png?rev=1943241\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/wp-tracy/assets/banner-1544x500.png?rev=1943241\";s:2:\"1x\";s:63:\"https://ps.w.org/wp-tracy/assets/banner-772x250.png?rev=1943241\";}s:11:\"banners_rtl\";a:0:{}}s:24:\"wordpress-seo/wp-seo.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/wordpress-seo\";s:4:\"slug\";s:13:\"wordpress-seo\";s:6:\"plugin\";s:24:\"wordpress-seo/wp-seo.php\";s:11:\"new_version\";s:3:\"8.3\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wordpress-seo/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/wordpress-seo.8.3.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:66:\"https://ps.w.org/wordpress-seo/assets/icon-256x256.png?rev=1834347\";s:2:\"1x\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641\";s:3:\"svg\";s:58:\"https://ps.w.org/wordpress-seo/assets/icon.svg?rev=1946641\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500.png?rev=1843435\";s:2:\"1x\";s:68:\"https://ps.w.org/wordpress-seo/assets/banner-772x250.png?rev=1843435\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/wordpress-seo/assets/banner-1544x500-rtl.png?rev=1843435\";s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-seo/assets/banner-772x250-rtl.png?rev=1843435\";}}}}','no');

/*!40000 ALTER TABLE `wpw_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_postmeta`;

CREATE TABLE `wpw_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_postmeta` WRITE;
/*!40000 ALTER TABLE `wpw_postmeta` DISABLE KEYS */;

INSERT INTO `wpw_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(2,3,'_wp_page_template','default'),
	(3,3,'_edit_last','1'),
	(4,3,'_edit_lock','1538574661:1'),
	(5,6,'_edit_last','1'),
	(6,6,'_edit_lock','1538574533:1'),
	(7,6,'_wp_page_template','default'),
	(8,8,'_edit_last','1'),
	(9,8,'_wp_page_template','default'),
	(10,8,'_edit_lock','1538574541:1'),
	(11,10,'_menu_item_type','post_type'),
	(12,10,'_menu_item_menu_item_parent','0'),
	(13,10,'_menu_item_object_id','6'),
	(14,10,'_menu_item_object','page'),
	(15,10,'_menu_item_target',''),
	(16,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(17,10,'_menu_item_xfn',''),
	(18,10,'_menu_item_url',''),
	(20,11,'_menu_item_type','post_type'),
	(21,11,'_menu_item_menu_item_parent','0'),
	(22,11,'_menu_item_object_id','8'),
	(23,11,'_menu_item_object','page'),
	(24,11,'_menu_item_target',''),
	(25,11,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(26,11,'_menu_item_xfn',''),
	(27,11,'_menu_item_url',''),
	(29,12,'_menu_item_type','post_type'),
	(30,12,'_menu_item_menu_item_parent','0'),
	(31,12,'_menu_item_object_id','6'),
	(32,12,'_menu_item_object','page'),
	(33,12,'_menu_item_target',''),
	(34,12,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(35,12,'_menu_item_xfn',''),
	(36,12,'_menu_item_url',''),
	(37,12,'_menu_item_orphaned','1538574700'),
	(38,13,'_menu_item_type','post_type'),
	(39,13,'_menu_item_menu_item_parent','0'),
	(40,13,'_menu_item_object_id','3'),
	(41,13,'_menu_item_object','page'),
	(42,13,'_menu_item_target',''),
	(43,13,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(44,13,'_menu_item_xfn',''),
	(45,13,'_menu_item_url',''),
	(46,13,'_menu_item_orphaned','1538574700'),
	(47,14,'_menu_item_type','post_type'),
	(48,14,'_menu_item_menu_item_parent','0'),
	(49,14,'_menu_item_object_id','2'),
	(50,14,'_menu_item_object','page'),
	(51,14,'_menu_item_target',''),
	(52,14,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(53,14,'_menu_item_xfn',''),
	(54,14,'_menu_item_url','');

/*!40000 ALTER TABLE `wpw_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_posts`;

CREATE TABLE `wpw_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_posts` WRITE;
/*!40000 ALTER TABLE `wpw_posts` DISABLE KEYS */;

INSERT INTO `wpw_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2018-10-03 15:39:08','2018-10-03 13:39:08','Vítejte ve WordPressu. Toto je váš první testovací příspěvek. Můžete ho upravit, nebo smazat a postupně pak začít s tvorbou vlastního webu.','Ahoj všichni!','','publish','open','open','','ahoj-vsichni','','','2018-10-03 15:39:08','2018-10-03 13:39:08','',0,'http://localhost/test/wpweekend3-demo/?p=1',0,'post','',1),
	(2,1,'2018-10-03 15:39:08','2018-10-03 13:39:08','Právě si prohlížíte ukázkovou stránku, která byla vytvořena automaticky během instalace WordPressu. Stránky se liší od příspěvků zejména tím, že obsahují nějaký statický text a jsou zobrazovány na stále stejném místě webu (u většiny šablon jde o navigační menu). Lidé obvykle nejdříve vytvářejí základní informační stránky, kde se představují návštěvníkům webu a seznamují je se svými záměry. Může to být např. něco v následujícím stylu (osobní web):\n\n<blockquote>Vítejte! Jmenuju se Pavel a bydlím na venkově. Pracuju jako programátor a po nocích překládáme WordPress do češtiny. A tohle je můj web, kde se občas dozvíte nejen něco o programování, ale i o mé rodině a cestování. Rádi totiž jezdíme na výlety, a to bez ohledu na počasí, protože já zpívám v dešti rád...</blockquote>\n\n... a nebo něco podobného (firemní web):\n\n<blockquote>Firma XYZ byla založena v roce 1991 a již od počátku se zabývá výrobou kvalitního jablečného moštu. Soustředíme se na zpracování ovoce od drobných pěstitelů a naše výrobky neobsahují žádné další chemické přísady. Firma sídlí v Liberci a zaměstnává více než 200 kvalifikovaných lidí.</blockquote>\n\nPokud s WordPressem právě začínáte, měli byste se nejdříve přihlásit do <a href=\"http://localhost/test/wpweekend3-demo/wp-admin/\">administrace</a> a tuto stránku smazat (nebo upravit). A nic už vám také nebrání vytvářet další obsah webu v podobě nových stránek a příspěvků. Doufáme, že budete se správou webu v redakčním systému WordPress spokojeni!','Zkušební stránka','','publish','closed','open','','zkusebni-stranka','','','2018-10-03 15:39:08','2018-10-03 13:39:08','',0,'http://localhost/test/wpweekend3-demo/?page_id=2',0,'page','',0),
	(3,1,'2018-10-03 15:39:08','2018-10-03 13:39:08','<h2>Kdo jsme</h2><p>Naše webová adresa je: http://localhost/test/wpweekend3-demo.</p><h2>Jaké shromažďujeme osobní údaje a proč je shromažďujeme</h2><h3>Komentáře</h3><p>Když návštěvníci přidají komentář na tento web, jsou shromažďovány údaje zobrazené ve formuláři pro komentář, dále IP adresa návštěvníka a řetězec user agent definující prohlížeč, což pomáhá k detekci spamu.</p><p>Službě Gravatar může být poskytnut anonymní řetězec vytvořený z vaší emailové adresy (nazývaný také hash), díky kterému lze určit jestli tuto službu používáte. Zásady ochrany osobních údajů služby Gravatar jsou k dispozici zde: https://automattic.com/privacy/. Po schválení vašeho komentáře je váš profilový obrázek viditelný pro veřejnost v kontextu vašeho komentáře.</p><h3>Média</h3><p>Pokud nahráváte obrázky na tento web, měli byste se vyhnout nahrávání obrázků s vloženými údaji o poloze (EXIF GPS). Návštěvníci webu mohou stáhnout a zobrazit libovolné data o poloze z obrázků na webu.</p><h3>Kontaktní formuláře</h3><h3>Cookies</h3><p>Pokud na naše stránky přidáte komentář, můžete povolit uložení jména, emailové adresy a webové stránky do cookies. Tímto způsobem se snažíme zvýšit váš komfort, když budete psát nový komentář už pak nebudete muset tyto údaje znovu vyplňovat. Tyto soubory cookies budou mít životnost jeden rok.</p><p>Pokud máte účet a přihlašujete se k tomuto webu, nastavíme dočasné cookie pro ověření, zda váš prohlížeč přijímá soubory cookies. Tento soubor cookie neobsahuje žádné osobní data a při zavření prohlížeče se zruší.</p><p>Při přihlašování vám nastavíme také několik souborů cookies pro uložení vašich přihlašovacích údajů a pro nastavení zobrazení obrazovky. Přihlašovací soubory cookies mají životnost dva dny a cookies pro nastavení zobrazení mají životnost jeden rok. Pokud potvrdíte možnost „Zapamatovat si mě“, vaše přihlášení bude trvat dva týdny. Pokud se ze svého účtu odhlásíte, přihlašovací cookies budou odstraněny.</p><p>Pokud upravujete nebo publikujete článek, bude ve vašem prohlížeči uložen další cookie. Tento cookie neobsahuje žádné osobní data a jednoduše označuje ID příspěvku, který jste právě upravili. Jeho platnost vyprší po 1 dni.</p><h3>Vložený obsah z dalších webů</h3><p>Příspěvky na těchto stránkách mohou obsahovat vložený obsah (například videa, obrázky, články atd.). Vložený obsah z jiných webových stránek se chová stejným způsobem, jako kdyby návštěvník navštívil jiný web.</p><p>Tyto webové stránky mohou shromažďovat data o vás, používat soubory cookies, vkládat další sledování od třetích stran a sledovat vaši interakci s tímto vloženým obsahem, včetně sledování interakce s vloženým obsahem, pokud máte účet a jste přihlášeni na danou webovou stránku.</p><h3>Analytika</h3><h2>S kým sdílíme vaše údaje</h2><h2>Jak dlouho uchováváme vaše údaje</h2><p>Pokud přidáte komentář, komentář a jeho metadata budou uchovávána po dobu neurčitou. Údaje jsou uchovávány za účelem automatického rozpoznání a schválení všech následných komentářů, místo jejich držení ve frontě moderování.</p><p>Pro uživatele, kteří se registrují na tomto webu (pokud mají tuto možnost), ukládáme také osobní údaje, které uvádějí ve svém uživatelském profilu. Všichni uživatelé mohou kdykoliv vidět, upravovat nebo smazat své osobní údaje (s výjimkou toho, že nemohou změnit své uživatelské jméno). Administrátoři webu mohou také tyto informace zobrazit a upravovat.</p><h2>Jaké máte práva?</h2><p>Pokud máte na tomto webu účet nebo jste zde přidali komentáře, můžete požádat o obdržení souboru s exportem osobních údajů, které o vás uchováváme, včetně všech údajů, které jste nám poskytli. Můžete také požádat o odstranění veškerých osobních údajů, které o vás uchováváme. Tato možnost nezahrnuje údaje, které jsme povinni uchovávat z administrativních, právních nebo bezpečnostních důvodů.</p><h2>Kam posíláme vaše data?</h2><p>Komentáře návštěvníků mohou být kontrolovány prostřednictvím automatizované služby detekce spamu, která může být umístěna v zahraničí.</p><h2>Vaše kontaktní údaje</h2><h2>Dodatečné informace</h2><h3>Jak chráníme vaše osobní údaje</h3><h3>Jaké máme postupy při úniku informací</h3><h3>Od kterých třetích stran získáváme osobní údaje?</h3><h3>Jaké automatizované rozhodnutí provádíme a/nebo profilujeme uživatelská data</h3><h3>Informační povinnost regulovaného průmyslu</h3>','Zásady ochrany osobních údajů','','publish','closed','closed','','ochrana-osobnich-udaju','','','2018-10-03 15:51:01','2018-10-03 13:51:01','',0,'http://localhost/test/wpweekend3-demo/?page_id=3',0,'page','',0),
	(5,1,'2018-10-03 15:51:01','2018-10-03 13:51:01','<h2>Kdo jsme</h2><p>Naše webová adresa je: http://localhost/test/wpweekend3-demo.</p><h2>Jaké shromažďujeme osobní údaje a proč je shromažďujeme</h2><h3>Komentáře</h3><p>Když návštěvníci přidají komentář na tento web, jsou shromažďovány údaje zobrazené ve formuláři pro komentář, dále IP adresa návštěvníka a řetězec user agent definující prohlížeč, což pomáhá k detekci spamu.</p><p>Službě Gravatar může být poskytnut anonymní řetězec vytvořený z vaší emailové adresy (nazývaný také hash), díky kterému lze určit jestli tuto službu používáte. Zásady ochrany osobních údajů služby Gravatar jsou k dispozici zde: https://automattic.com/privacy/. Po schválení vašeho komentáře je váš profilový obrázek viditelný pro veřejnost v kontextu vašeho komentáře.</p><h3>Média</h3><p>Pokud nahráváte obrázky na tento web, měli byste se vyhnout nahrávání obrázků s vloženými údaji o poloze (EXIF GPS). Návštěvníci webu mohou stáhnout a zobrazit libovolné data o poloze z obrázků na webu.</p><h3>Kontaktní formuláře</h3><h3>Cookies</h3><p>Pokud na naše stránky přidáte komentář, můžete povolit uložení jména, emailové adresy a webové stránky do cookies. Tímto způsobem se snažíme zvýšit váš komfort, když budete psát nový komentář už pak nebudete muset tyto údaje znovu vyplňovat. Tyto soubory cookies budou mít životnost jeden rok.</p><p>Pokud máte účet a přihlašujete se k tomuto webu, nastavíme dočasné cookie pro ověření, zda váš prohlížeč přijímá soubory cookies. Tento soubor cookie neobsahuje žádné osobní data a při zavření prohlížeče se zruší.</p><p>Při přihlašování vám nastavíme také několik souborů cookies pro uložení vašich přihlašovacích údajů a pro nastavení zobrazení obrazovky. Přihlašovací soubory cookies mají životnost dva dny a cookies pro nastavení zobrazení mají životnost jeden rok. Pokud potvrdíte možnost „Zapamatovat si mě“, vaše přihlášení bude trvat dva týdny. Pokud se ze svého účtu odhlásíte, přihlašovací cookies budou odstraněny.</p><p>Pokud upravujete nebo publikujete článek, bude ve vašem prohlížeči uložen další cookie. Tento cookie neobsahuje žádné osobní data a jednoduše označuje ID příspěvku, který jste právě upravili. Jeho platnost vyprší po 1 dni.</p><h3>Vložený obsah z dalších webů</h3><p>Příspěvky na těchto stránkách mohou obsahovat vložený obsah (například videa, obrázky, články atd.). Vložený obsah z jiných webových stránek se chová stejným způsobem, jako kdyby návštěvník navštívil jiný web.</p><p>Tyto webové stránky mohou shromažďovat data o vás, používat soubory cookies, vkládat další sledování od třetích stran a sledovat vaši interakci s tímto vloženým obsahem, včetně sledování interakce s vloženým obsahem, pokud máte účet a jste přihlášeni na danou webovou stránku.</p><h3>Analytika</h3><h2>S kým sdílíme vaše údaje</h2><h2>Jak dlouho uchováváme vaše údaje</h2><p>Pokud přidáte komentář, komentář a jeho metadata budou uchovávána po dobu neurčitou. Údaje jsou uchovávány za účelem automatického rozpoznání a schválení všech následných komentářů, místo jejich držení ve frontě moderování.</p><p>Pro uživatele, kteří se registrují na tomto webu (pokud mají tuto možnost), ukládáme také osobní údaje, které uvádějí ve svém uživatelském profilu. Všichni uživatelé mohou kdykoliv vidět, upravovat nebo smazat své osobní údaje (s výjimkou toho, že nemohou změnit své uživatelské jméno). Administrátoři webu mohou také tyto informace zobrazit a upravovat.</p><h2>Jaké máte práva?</h2><p>Pokud máte na tomto webu účet nebo jste zde přidali komentáře, můžete požádat o obdržení souboru s exportem osobních údajů, které o vás uchováváme, včetně všech údajů, které jste nám poskytli. Můžete také požádat o odstranění veškerých osobních údajů, které o vás uchováváme. Tato možnost nezahrnuje údaje, které jsme povinni uchovávat z administrativních, právních nebo bezpečnostních důvodů.</p><h2>Kam posíláme vaše data?</h2><p>Komentáře návštěvníků mohou být kontrolovány prostřednictvím automatizované služby detekce spamu, která může být umístěna v zahraničí.</p><h2>Vaše kontaktní údaje</h2><h2>Dodatečné informace</h2><h3>Jak chráníme vaše osobní údaje</h3><h3>Jaké máme postupy při úniku informací</h3><h3>Od kterých třetích stran získáváme osobní údaje?</h3><h3>Jaké automatizované rozhodnutí provádíme a/nebo profilujeme uživatelská data</h3><h3>Informační povinnost regulovaného průmyslu</h3>','Zásady ochrany osobních údajů','','inherit','closed','closed','','3-revision-v1','','','2018-10-03 15:51:01','2018-10-03 13:51:01','',3,'http://localhost/test/wpweekend3-demo/3-revision-v1/',0,'revision','',0),
	(6,1,'2018-10-03 15:51:15','2018-10-03 13:51:15','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque accumsan lacus sagittis dignissim sollicitudin. Etiam in urna malesuada, sollicitudin tortor vel, sodales arcu. Curabitur ut feugiat sapien, sed tincidunt orci. Praesent lacinia erat id velit blandit faucibus. Aenean sed sapien ornare, condimentum purus non, imperdiet augue. Vivamus vehicula lobortis finibus. Phasellus leo magna, vulputate ac nisl eu, mattis finibus leo. Etiam pulvinar vehicula dignissim. Duis velit elit, commodo sit amet auctor nec, eleifend vitae risus. Sed tempus bibendum nulla at condimentum. Duis commodo ipsum eget dolor posuere varius.\r\n\r\nAenean nibh velit, pellentesque vitae libero nec, varius fermentum dolor. Pellentesque et dui sit amet nisl varius rutrum. Etiam id diam ligula. Fusce vel dapibus eros, eget vestibulum lacus. Phasellus malesuada porttitor volutpat. Nullam sit amet gravida tortor. Aenean dignissim nisi ipsum, molestie viverra arcu facilisis eu.\r\n\r\nEtiam elementum, nunc vitae varius vestibulum, ipsum tellus sodales enim, sed dignissim leo magna at purus. In hac habitasse platea dictumst. Etiam scelerisque quis mauris ac faucibus. Pellentesque eu metus condimentum, malesuada turpis eget, porttitor ante. Vivamus hendrerit ligula a eleifend molestie. Nullam cursus diam tellus, a pharetra nibh sagittis vel. Sed arcu sapien, ornare quis magna eget, molestie consequat metus. Ut nec lacus libero. Curabitur viverra sem sit amet velit placerat facilisis. In eget erat dui. Mauris condimentum, orci vitae fermentum laoreet, dui neque malesuada nibh, ac euismod nibh arcu vitae mauris. Nam elit nulla, ornare ut viverra eget, consectetur sit amet dui.','Úvod','','publish','closed','closed','','uvod','','','2018-10-03 15:51:15','2018-10-03 13:51:15','',0,'http://localhost/test/wpweekend3-demo/?page_id=6',0,'page','',0),
	(7,1,'2018-10-03 15:51:15','2018-10-03 13:51:15','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque accumsan lacus sagittis dignissim sollicitudin. Etiam in urna malesuada, sollicitudin tortor vel, sodales arcu. Curabitur ut feugiat sapien, sed tincidunt orci. Praesent lacinia erat id velit blandit faucibus. Aenean sed sapien ornare, condimentum purus non, imperdiet augue. Vivamus vehicula lobortis finibus. Phasellus leo magna, vulputate ac nisl eu, mattis finibus leo. Etiam pulvinar vehicula dignissim. Duis velit elit, commodo sit amet auctor nec, eleifend vitae risus. Sed tempus bibendum nulla at condimentum. Duis commodo ipsum eget dolor posuere varius.\r\n\r\nAenean nibh velit, pellentesque vitae libero nec, varius fermentum dolor. Pellentesque et dui sit amet nisl varius rutrum. Etiam id diam ligula. Fusce vel dapibus eros, eget vestibulum lacus. Phasellus malesuada porttitor volutpat. Nullam sit amet gravida tortor. Aenean dignissim nisi ipsum, molestie viverra arcu facilisis eu.\r\n\r\nEtiam elementum, nunc vitae varius vestibulum, ipsum tellus sodales enim, sed dignissim leo magna at purus. In hac habitasse platea dictumst. Etiam scelerisque quis mauris ac faucibus. Pellentesque eu metus condimentum, malesuada turpis eget, porttitor ante. Vivamus hendrerit ligula a eleifend molestie. Nullam cursus diam tellus, a pharetra nibh sagittis vel. Sed arcu sapien, ornare quis magna eget, molestie consequat metus. Ut nec lacus libero. Curabitur viverra sem sit amet velit placerat facilisis. In eget erat dui. Mauris condimentum, orci vitae fermentum laoreet, dui neque malesuada nibh, ac euismod nibh arcu vitae mauris. Nam elit nulla, ornare ut viverra eget, consectetur sit amet dui.','Úvod','','inherit','closed','closed','','6-revision-v1','','','2018-10-03 15:51:15','2018-10-03 13:51:15','',6,'http://localhost/test/wpweekend3-demo/6-revision-v1/',0,'revision','',0),
	(8,1,'2018-10-03 15:51:22','2018-10-03 13:51:22','','Příspěvky','','publish','closed','closed','','prispevky','','','2018-10-03 15:51:22','2018-10-03 13:51:22','',0,'http://localhost/test/wpweekend3-demo/?page_id=8',0,'page','',0),
	(9,1,'2018-10-03 15:51:22','2018-10-03 13:51:22','','Příspěvky','','inherit','closed','closed','','8-revision-v1','','','2018-10-03 15:51:22','2018-10-03 13:51:22','',8,'http://localhost/test/wpweekend3-demo/8-revision-v1/',0,'revision','',0),
	(10,1,'2018-10-03 15:51:53','2018-10-03 13:51:53',' ','','','publish','closed','closed','','10','','','2018-10-03 15:51:56','2018-10-03 13:51:56','',0,'http://localhost/test/wpweekend3-demo/?p=10',1,'nav_menu_item','',0),
	(11,1,'2018-10-03 15:51:53','2018-10-03 13:51:53',' ','','','publish','closed','closed','','11','','','2018-10-03 15:51:56','2018-10-03 13:51:56','',0,'http://localhost/test/wpweekend3-demo/?p=11',2,'nav_menu_item','',0),
	(12,1,'2018-10-03 15:51:40','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2018-10-03 15:51:40','0000-00-00 00:00:00','',0,'http://localhost/test/wpweekend3-demo/?p=12',1,'nav_menu_item','',0),
	(13,1,'2018-10-03 15:51:40','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2018-10-03 15:51:40','0000-00-00 00:00:00','',0,'http://localhost/test/wpweekend3-demo/?p=13',1,'nav_menu_item','',0),
	(14,1,'2018-10-03 15:51:53','2018-10-03 13:51:53',' ','','','publish','closed','closed','','14','','','2018-10-03 15:51:56','2018-10-03 13:51:56','',0,'http://localhost/test/wpweekend3-demo/?p=14',3,'nav_menu_item','',0);

/*!40000 ALTER TABLE `wpw_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_term_relationships`;

CREATE TABLE `wpw_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_term_relationships` WRITE;
/*!40000 ALTER TABLE `wpw_term_relationships` DISABLE KEYS */;

INSERT INTO `wpw_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,1,0),
	(10,2,0),
	(11,2,0),
	(14,2,0),
	(15,1,0),
	(16,1,0),
	(17,1,0),
	(18,1,0),
	(19,1,0),
	(20,1,0),
	(21,1,0),
	(22,1,0),
	(23,1,0),
	(24,1,0),
	(25,1,0),
	(26,1,0),
	(27,1,0),
	(28,1,0),
	(29,1,0),
	(30,1,0),
	(31,1,0),
	(32,1,0),
	(33,1,0),
	(34,1,0),
	(35,1,0),
	(36,1,0),
	(37,1,0),
	(38,1,0),
	(39,1,0),
	(40,1,0),
	(41,1,0),
	(42,1,0),
	(43,1,0),
	(44,1,0),
	(45,1,0),
	(46,1,0),
	(47,1,0),
	(48,1,0),
	(49,1,0),
	(50,1,0),
	(51,1,0),
	(52,1,0),
	(53,1,0),
	(54,1,0),
	(55,1,0),
	(56,1,0),
	(57,1,0),
	(58,1,0),
	(59,1,0),
	(60,1,0),
	(61,1,0),
	(62,1,0),
	(63,1,0),
	(64,1,0),
	(65,1,0),
	(66,1,0),
	(67,1,0),
	(68,1,0),
	(69,1,0),
	(70,1,0),
	(71,1,0),
	(72,1,0),
	(73,1,0),
	(74,1,0),
	(75,1,0),
	(76,1,0),
	(77,1,0),
	(78,1,0),
	(79,1,0),
	(80,1,0),
	(81,1,0),
	(82,1,0),
	(83,1,0),
	(84,1,0),
	(85,1,0),
	(86,1,0),
	(87,1,0),
	(88,1,0),
	(89,1,0),
	(90,1,0),
	(91,1,0),
	(92,1,0),
	(93,1,0),
	(94,1,0),
	(95,1,0),
	(96,1,0),
	(97,1,0),
	(98,1,0),
	(99,1,0),
	(100,1,0),
	(101,1,0),
	(102,1,0),
	(103,1,0),
	(104,1,0),
	(105,1,0),
	(106,1,0),
	(107,1,0),
	(108,1,0),
	(109,1,0),
	(110,1,0),
	(111,1,0),
	(112,1,0),
	(113,1,0),
	(114,1,0),
	(115,1,0),
	(116,1,0),
	(117,1,0),
	(118,1,0),
	(119,1,0),
	(120,1,0),
	(121,1,0),
	(122,1,0),
	(123,1,0),
	(124,1,0),
	(125,1,0),
	(126,1,0),
	(127,1,0),
	(128,1,0),
	(129,1,0),
	(130,1,0),
	(131,1,0),
	(132,1,0),
	(133,1,0),
	(134,1,0),
	(135,1,0),
	(136,1,0),
	(137,1,0),
	(138,1,0),
	(139,1,0),
	(140,1,0),
	(141,1,0),
	(142,1,0),
	(143,1,0),
	(144,1,0),
	(145,1,0),
	(146,1,0),
	(147,1,0),
	(148,1,0),
	(149,1,0),
	(150,1,0),
	(151,1,0),
	(152,1,0),
	(153,1,0),
	(154,1,0),
	(155,1,0),
	(156,1,0),
	(157,1,0),
	(158,1,0),
	(159,1,0),
	(160,1,0),
	(161,1,0),
	(162,1,0),
	(163,1,0),
	(164,1,0),
	(165,1,0),
	(166,1,0),
	(167,1,0),
	(168,1,0),
	(169,1,0),
	(170,1,0),
	(171,1,0),
	(172,1,0),
	(173,1,0),
	(174,1,0),
	(175,1,0),
	(176,1,0),
	(177,1,0),
	(178,1,0),
	(179,1,0),
	(180,1,0),
	(181,1,0),
	(182,1,0),
	(183,1,0),
	(184,1,0),
	(185,1,0),
	(186,1,0),
	(187,1,0),
	(188,1,0),
	(189,1,0),
	(190,1,0),
	(191,1,0),
	(192,1,0),
	(193,1,0),
	(194,1,0),
	(195,1,0),
	(196,1,0),
	(197,1,0),
	(198,1,0),
	(199,1,0),
	(200,1,0),
	(201,1,0),
	(202,1,0),
	(203,1,0),
	(204,1,0),
	(205,1,0),
	(206,1,0),
	(207,1,0),
	(208,1,0),
	(209,1,0),
	(210,1,0),
	(211,1,0),
	(212,1,0),
	(213,1,0),
	(214,1,0),
	(215,1,0),
	(216,1,0),
	(217,1,0),
	(218,1,0),
	(219,1,0),
	(220,1,0),
	(221,1,0),
	(222,1,0),
	(223,1,0),
	(224,1,0),
	(225,1,0),
	(226,1,0),
	(227,1,0),
	(228,1,0),
	(229,1,0),
	(230,1,0),
	(231,1,0),
	(232,1,0),
	(233,1,0),
	(234,1,0),
	(235,1,0),
	(236,1,0),
	(237,1,0),
	(238,1,0),
	(239,1,0),
	(240,1,0),
	(241,1,0),
	(242,1,0),
	(243,1,0),
	(244,1,0),
	(245,1,0),
	(246,1,0),
	(247,1,0),
	(248,1,0),
	(249,1,0),
	(250,1,0),
	(251,1,0),
	(252,1,0),
	(253,1,0),
	(254,1,0),
	(255,1,0),
	(256,1,0),
	(257,1,0),
	(258,1,0),
	(259,1,0),
	(260,1,0),
	(261,1,0),
	(262,1,0),
	(263,1,0),
	(264,1,0),
	(265,1,0),
	(266,1,0),
	(267,1,0),
	(268,1,0),
	(269,1,0),
	(270,1,0),
	(271,1,0),
	(272,1,0),
	(273,1,0),
	(274,1,0),
	(275,1,0),
	(276,1,0),
	(277,1,0),
	(278,1,0),
	(279,1,0),
	(280,1,0),
	(281,1,0),
	(282,1,0),
	(283,1,0),
	(284,1,0),
	(285,1,0),
	(286,1,0),
	(287,1,0),
	(288,1,0),
	(289,1,0),
	(290,1,0),
	(291,1,0),
	(292,1,0),
	(293,1,0),
	(294,1,0),
	(295,1,0),
	(296,1,0),
	(297,1,0),
	(298,1,0),
	(299,1,0),
	(300,1,0),
	(301,1,0),
	(302,1,0),
	(303,1,0),
	(304,1,0),
	(305,1,0),
	(306,1,0),
	(307,1,0),
	(308,1,0),
	(309,1,0),
	(310,1,0),
	(311,1,0),
	(312,1,0),
	(313,1,0),
	(314,1,0);

/*!40000 ALTER TABLE `wpw_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_term_taxonomy`;

CREATE TABLE `wpw_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wpw_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wpw_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,101),
	(2,2,'nav_menu','',0,3);

/*!40000 ALTER TABLE `wpw_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_termmeta`;

CREATE TABLE `wpw_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wpw_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_terms`;

CREATE TABLE `wpw_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_terms` WRITE;
/*!40000 ALTER TABLE `wpw_terms` DISABLE KEYS */;

INSERT INTO `wpw_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Nezařazené','nezarazene',0),
	(2,'Hlavní menu','hlavni-menu',0);

/*!40000 ALTER TABLE `wpw_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_usermeta`;

CREATE TABLE `wpw_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_usermeta` WRITE;
/*!40000 ALTER TABLE `wpw_usermeta` DISABLE KEYS */;

INSERT INTO `wpw_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','admin'),
	(2,1,'first_name',''),
	(3,1,'last_name',''),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'syntax_highlighting','true'),
	(7,1,'comment_shortcuts','false'),
	(8,1,'admin_color','fresh'),
	(9,1,'use_ssl','0'),
	(10,1,'show_admin_bar_front','true'),
	(11,1,'locale',''),
	(12,1,'wpw_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(13,1,'wpw_user_level','10'),
	(14,1,'dismissed_wp_pointers','wp496_privacy'),
	(15,1,'show_welcome_panel','0'),
	(17,1,'wpw_dashboard_quick_press_last_post_id','4'),
	(18,1,'show_try_gutenberg_panel','0'),
	(19,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
	(20,1,'metaboxhidden_nav-menus','a:3:{i:0;s:23:\"add-post-type-reference\";i:1;s:12:\"add-post_tag\";i:2;s:21:\"add-referencecategory\";}'),
	(21,1,'wpw_yoast_notifications','a:3:{i:0;a:2:{s:7:\"message\";s:655:\"<p>Jak vidíte, existuje překlad tohoto pluginu v Czech. Tento překlad je v současnosti 88% kompletní. Potřebujeme vaši pomoc k jeho dokončení a opravám chyb. Prosím, zaregistrujte se na <a href=\"https://translate.wordpress.org/projects/wp-plugins/wordpress-seo/\">Translating WordPress</a>, abyste pomohli dokončit překlad do Czech!</p><p><a href=\"https://translate.wordpress.org/projects/wp-plugins/wordpress-seo/\">Zaregistrovat se nyní &raquo;</a></p><a class=\"button\" href=\"/test/wpweekend3-demo/wp-admin/admin.php?page=wpseo_dashboard&#038;dismiss_get_started=1&#038;remove_i18n_promo=1\">Please don\'t show me this notification anymore</a>\";s:7:\"options\";a:9:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:31:\"i18nModuleTranslationAssistance\";s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";a:1:{i:0;s:20:\"wpseo_manage_options\";}s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}i:1;a:2:{s:7:\"message\";s:205:\"Nenechte si ujít vaše chyby při procházení: <a href=\"http://localhost/test/wpweekend3-demo/wp-admin/admin.php?page=wpseo_search_console&tab=settings\">spojit se z Vyhledávací konzolí Google zde</a>.\";s:7:\"options\";a:9:{s:4:\"type\";s:7:\"warning\";s:2:\"id\";s:17:\"wpseo-dismiss-gsc\";s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}i:2;a:2:{s:7:\"message\";s:299:\"Stále máte výchozí WordPress slogan, i žádný by byl asi lepší.<a href=\"http://localhost/test/wpweekend3-demo/wp-admin/customize.php?autofocus[control]=blogdescription&amp;url=http%3A%2F%2Flocalhost%2Ftest%2Fwpweekend3-demo%2Fwp-admin%2F\">Tento problém lze odstranit v personalizátoru</a>.\";s:7:\"options\";a:9:{s:4:\"type\";s:5:\"error\";s:2:\"id\";s:28:\"wpseo-dismiss-tagline-notice\";s:5:\"nonce\";N;s:8:\"priority\";d:0.5;s:9:\"data_json\";a:0:{}s:13:\"dismissal_key\";N;s:12:\"capabilities\";s:20:\"wpseo_manage_options\";s:16:\"capability_check\";s:3:\"all\";s:14:\"yoast_branding\";b:0;}}}'),
	(22,1,'wpseo-dismiss-configuration-notice','yes'),
	(23,1,'wpw_wpseo-dismiss-tagline-notice','seen'),
	(24,1,'wpw_i18nModuleTranslationAssistance','seen'),
	(25,1,'wpw_wpseo-dismiss-gsc','seen'),
	(26,1,'session_tokens','a:1:{s:64:\"77a80d12c61ab6b3dd1ed491a98aa11b14b0e4fe15eaa589899d3474cd9a99ca\";a:4:{s:10:\"expiration\";i:1538918473;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:138:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36 OPR/55.0.2994.61\";s:5:\"login\";i:1538745673;}}');

/*!40000 ALTER TABLE `wpw_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_users`;

CREATE TABLE `wpw_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_users` WRITE;
/*!40000 ALTER TABLE `wpw_users` DISABLE KEYS */;

INSERT INTO `wpw_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'admin','$2y$10$Ri6hl3gmj2CnGr4uMacwKuhjC/noPER/RxpvIl3LaF4tjCQFFo75i','admin','admin@localhost','','2018-10-03 13:39:08','',0,'admin');

/*!40000 ALTER TABLE `wpw_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wpw_yoast_seo_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_yoast_seo_links`;

CREATE TABLE `wpw_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `target_post_id` bigint(20) unsigned NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_direction` (`post_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wpw_yoast_seo_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wpw_yoast_seo_meta`;

CREATE TABLE `wpw_yoast_seo_meta` (
  `object_id` bigint(20) unsigned NOT NULL,
  `internal_link_count` int(10) unsigned DEFAULT NULL,
  `incoming_link_count` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wpw_yoast_seo_meta` WRITE;
/*!40000 ALTER TABLE `wpw_yoast_seo_meta` DISABLE KEYS */;

INSERT INTO `wpw_yoast_seo_meta` (`object_id`, `internal_link_count`, `incoming_link_count`)
VALUES
	(15,0,0),
	(16,0,0),
	(17,0,0),
	(18,0,0),
	(19,0,0),
	(20,0,0),
	(21,0,0),
	(22,0,0),
	(23,0,0),
	(24,0,0),
	(25,0,0),
	(26,0,0),
	(27,0,0),
	(28,0,0),
	(29,0,0),
	(30,0,0),
	(31,0,0),
	(32,0,0),
	(33,0,0),
	(34,0,0),
	(35,0,0),
	(36,0,0),
	(37,0,0),
	(38,0,0),
	(39,0,0),
	(40,0,0),
	(41,0,0),
	(42,0,0),
	(43,0,0),
	(44,0,0),
	(45,0,0),
	(46,0,0),
	(47,0,0),
	(48,0,0),
	(49,0,0),
	(50,0,0),
	(51,0,0),
	(52,0,0),
	(53,0,0),
	(54,0,0),
	(55,0,0),
	(56,0,0),
	(57,0,0),
	(58,0,0),
	(59,0,0),
	(60,0,0),
	(61,0,0),
	(62,0,0),
	(63,0,0),
	(64,0,0),
	(65,0,0),
	(66,0,0),
	(67,0,0),
	(68,0,0),
	(69,0,0),
	(70,0,0),
	(71,0,0),
	(72,0,0),
	(73,0,0),
	(74,0,0),
	(75,0,0),
	(76,0,0),
	(77,0,0),
	(78,0,0),
	(79,0,0),
	(80,0,0),
	(81,0,0),
	(82,0,0),
	(83,0,0),
	(84,0,0),
	(85,0,0),
	(86,0,0),
	(87,0,0),
	(88,0,0),
	(89,0,0),
	(90,0,0),
	(91,0,0),
	(92,0,0),
	(93,0,0),
	(94,0,0),
	(95,0,0),
	(96,0,0),
	(97,0,0),
	(98,0,0),
	(99,0,0),
	(100,0,0),
	(101,0,0),
	(102,0,0),
	(103,0,0),
	(104,0,0),
	(105,0,0),
	(106,0,0),
	(107,0,0),
	(108,0,0),
	(109,0,0),
	(110,0,0),
	(111,0,0),
	(112,0,0),
	(113,0,0),
	(114,0,0),
	(115,0,0),
	(116,0,0),
	(117,0,0),
	(118,0,0),
	(119,0,0),
	(120,0,0),
	(121,0,0),
	(122,0,0),
	(123,0,0),
	(124,0,0),
	(125,0,0),
	(126,0,0),
	(127,0,0),
	(128,0,0),
	(129,0,0),
	(130,0,0),
	(131,0,0),
	(132,0,0),
	(133,0,0),
	(134,0,0),
	(135,0,0),
	(136,0,0),
	(137,0,0),
	(138,0,0),
	(139,0,0),
	(140,0,0),
	(141,0,0),
	(142,0,0),
	(143,0,0),
	(144,0,0),
	(145,0,0),
	(146,0,0),
	(147,0,0),
	(148,0,0),
	(149,0,0),
	(150,0,0),
	(151,0,0),
	(152,0,0),
	(153,0,0),
	(154,0,0),
	(155,0,0),
	(156,0,0),
	(157,0,0),
	(158,0,0),
	(159,0,0),
	(160,0,0),
	(161,0,0),
	(162,0,0),
	(163,0,0),
	(164,0,0),
	(165,0,0),
	(166,0,0),
	(167,0,0),
	(168,0,0),
	(169,0,0),
	(170,0,0),
	(171,0,0),
	(172,0,0),
	(173,0,0),
	(174,0,0),
	(175,0,0),
	(176,0,0),
	(177,0,0),
	(178,0,0),
	(179,0,0),
	(180,0,0),
	(181,0,0),
	(182,0,0),
	(183,0,0),
	(184,0,0),
	(185,0,0),
	(186,0,0),
	(187,0,0),
	(188,0,0),
	(189,0,0),
	(190,0,0),
	(191,0,0),
	(192,0,0),
	(193,0,0),
	(194,0,0),
	(195,0,0),
	(196,0,0),
	(197,0,0),
	(198,0,0),
	(199,0,0),
	(200,0,0),
	(201,0,0),
	(202,0,0),
	(203,0,0),
	(204,0,0),
	(205,0,0),
	(206,0,0),
	(207,0,0),
	(208,0,0),
	(209,0,0),
	(210,0,0),
	(211,0,0),
	(212,0,0),
	(213,0,0),
	(214,0,0),
	(215,0,0),
	(216,0,0),
	(217,0,0),
	(218,0,0),
	(219,0,0),
	(220,0,0),
	(221,0,0),
	(222,0,0),
	(223,0,0),
	(224,0,0),
	(225,0,0),
	(226,0,0),
	(227,0,0),
	(228,0,0),
	(229,0,0),
	(230,0,0),
	(231,0,0),
	(232,0,0),
	(233,0,0),
	(234,0,0),
	(235,0,0),
	(236,0,0),
	(237,0,0),
	(238,0,0),
	(239,0,0),
	(240,0,0),
	(241,0,0),
	(242,0,0),
	(243,0,0),
	(244,0,0),
	(245,0,0),
	(246,0,0),
	(247,0,0),
	(248,0,0),
	(249,0,0),
	(250,0,0),
	(251,0,0),
	(252,0,0),
	(253,0,0),
	(254,0,0),
	(255,0,0),
	(256,0,0),
	(257,0,0),
	(258,0,0),
	(259,0,0),
	(260,0,0),
	(261,0,0),
	(262,0,0),
	(263,0,0),
	(264,0,0),
	(265,0,0),
	(266,0,0),
	(267,0,0),
	(268,0,0),
	(269,0,0),
	(270,0,0),
	(271,0,0),
	(272,0,0),
	(273,0,0),
	(274,0,0),
	(275,0,0),
	(276,0,0),
	(277,0,0),
	(278,0,0),
	(279,0,0),
	(280,0,0),
	(281,0,0),
	(282,0,0),
	(283,0,0),
	(284,0,0),
	(285,0,0),
	(286,0,0),
	(287,0,0),
	(288,0,0),
	(289,0,0),
	(290,0,0),
	(291,0,0),
	(292,0,0),
	(293,0,0),
	(294,0,0),
	(295,0,0),
	(296,0,0),
	(297,0,0),
	(298,0,0),
	(299,0,0),
	(300,0,0),
	(301,0,0),
	(302,0,0),
	(303,0,0),
	(304,0,0),
	(305,0,0),
	(306,0,0),
	(307,0,0),
	(308,0,0),
	(309,0,0),
	(310,0,0),
	(311,0,0),
	(312,0,0),
	(313,0,0),
	(314,0,0);

/*!40000 ALTER TABLE `wpw_yoast_seo_meta` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
