/*
SQLyog Enterprise v10.51 
MySQL - 5.5.28-log : Database - dlayer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dlayer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `dlayer`;

/*Table structure for table `designer_color_palette_colors` */

DROP TABLE IF EXISTS `designer_color_palette_colors`;

CREATE TABLE `designer_color_palette_colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `palette_id` int(11) unsigned NOT NULL,
  `type` enum('Primary','Secondary','Tertiary') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `r` tinyint(3) NOT NULL DEFAULT '0',
  `g` tinyint(3) NOT NULL DEFAULT '0',
  `b` tinyint(3) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `palette_id` (`palette_id`),
  CONSTRAINT `designer_color_palette_colors_ibfk_1` FOREIGN KEY (`palette_id`) REFERENCES `designer_color_palettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palette_colors` */

insert  into `designer_color_palette_colors`(`id`,`palette_id`,`type`,`name`,`hex`,`r`,`g`,`b`,`enabled`) values (1,1,'Primary','Black','#000000',0,0,0,1),(2,1,'Secondary','Tan','#f3f1df',127,127,127,1),(3,1,'Tertiary','Dark grey','#666666',102,102,102,1),(4,2,'Primary','Blue','#336699',51,102,127,1),(5,2,'Secondary','Dark grey','#666666',102,102,102,1),(6,2,'Tertiary','Grey','#999999',127,127,127,1),(7,3,'Primary','Blue','#003366',0,51,102,1),(8,3,'Secondary','White','#FFFFFF',127,127,127,1),(9,3,'Tertiary','Orange','#FF6600',127,102,0,1);

/*Table structure for table `designer_color_palettes` */

DROP TABLE IF EXISTS `designer_color_palettes`;

CREATE TABLE `designer_color_palettes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palettes` */

insert  into `designer_color_palettes`(`id`,`name`,`enabled`) values (1,'Palette A',1),(2,'Palette B',1),(3,'Palette C',1);

/*Table structure for table `dlayer_module_tool_tabs` */

DROP TABLE IF EXISTS `dlayer_module_tool_tabs`;

CREATE TABLE `dlayer_module_tool_tabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(2) unsigned NOT NULL,
  `tool_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `script_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`),
  KEY `module_id` (`module_id`),
  KEY `tool_id` (`tool_id`),
  CONSTRAINT `dlayer_module_tool_tabs_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_modules` (`id`),
  CONSTRAINT `dlayer_module_tool_tabs_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `dlayer_module_tools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tool_tabs` */

insert  into `dlayer_module_tool_tabs`(`id`,`module_id`,`tool_id`,`name`,`script_name`,`default`,`sort_order`,`enabled`) values (1,1,2,'Quick split','quick',1,1,1),(2,1,2,'Advanced split','advanced',0,2,1),(3,1,2,'Help','help',0,3,1),(4,1,3,'Quick split','quick',1,1,1),(5,1,3,'Advanced split','advanced',0,2,1),(6,1,3,'Help','help',0,3,1),(7,1,7,'Palette 1','palette-1',1,1,1),(8,1,7,'Palette 2','palette-2',0,2,1),(9,1,7,'Palette 3','palette-3',0,3,1),(10,1,7,'Advanced','advanced',0,4,1),(11,1,7,'Help','help',0,5,1),(12,1,4,'Resize','advanced',1,1,1),(14,1,4,'Help','help',0,2,1);

/*Table structure for table `dlayer_module_tools` */

DROP TABLE IF EXISTS `dlayer_module_tools`;

CREATE TABLE `dlayer_module_tools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `process_model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `script` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Script name in ribbon view folder',
  `icon` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `auto` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Automatic tool, no user input?',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Group within toolbar',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Sort order within group',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `sort_order` (`sort_order`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `dlayer_module_tools_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tools` */

insert  into `dlayer_module_tools`(`id`,`module_id`,`name`,`process_model`,`script`,`icon`,`auto`,`group_id`,`sort_order`,`enabled`) values (1,1,'Cancel','','cancel','cancel.png',1,1,1,1),(2,1,'Split horizontal','SplitHorizontal','split-horizontal','split-horizontal.png',0,2,1,1),(3,1,'Split vertical','SplitVertical','split-vertical','split-vertical.png',0,2,2,1),(4,1,'Resize width','ResizeWidth','resize-width','resize-width.png',1,3,1,1),(5,1,'Resize height','','resize-height','resize-height.png',0,3,2,0),(6,1,'Resize','','resize','resize.png',0,3,3,0),(7,1,'Background color','BackgroundColor','background-color','background-color.png',0,4,1,1);

/*Table structure for table `dlayer_modules` */

DROP TABLE IF EXISTS `dlayer_modules`;

CREATE TABLE `dlayer_modules` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_modules` */

insert  into `dlayer_modules`(`id`,`name`,`enabled`) values (1,'Template designer',0);

/*Table structure for table `dlayer_sessions` */

DROP TABLE IF EXISTS `dlayer_sessions`;

CREATE TABLE `dlayer_sessions` (
  `session_id` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `save_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`,`save_path`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_sessions` */

insert  into `dlayer_sessions`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('1e8il414o6mnbrk1t06jicoqa3','','PHPSESSID',1359947387,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";i:4;s:10:\"ribbon_tab\";s:2:\"12\";s:16:\"selected_element\";N;}'),('22k732bjem580c2cp7vjmnam33','','PHPSESSID',1359255271,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";s:2:\"60\";}'),('2kdjgjhfavnp1gqnqrkea407m1','','PHPSESSID',1359309661,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";N;}'),('9335q80me7lqs26hq2bup29c14','','PHPSESSID',1359331439,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";N;}'),('a0k8lvjrre6mvrfphl97mb2lr7','','PHPSESSID',1358647879,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";N;}'),('d72illpgilgtkvmubnci5ocni3','','PHPSESSID',1359337092,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";s:1:\"7\";s:10:\"ribbon_tab\";s:1:\"7\";s:16:\"selected_element\";s:2:\"63\";}'),('nbrs361v1an9v1dusiq540u6h3','','PHPSESSID',1359311310,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";N;}'),('psqfguqcm4j02hpn8oa35avih2','','PHPSESSID',1359597285,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";N;}'),('u0118n1nbgsm2lp7kohsi2d5h0','','PHPSESSID',1358732630,1440,'dlayer_session|a:2:{s:4:\"site\";i:1;s:8:\"template\";i:1;}dlayer_session_template|a:3:{s:4:\"tool\";N;s:10:\"ribbon_tab\";N;s:16:\"selected_element\";s:2:\"60\";}');

/*Table structure for table `user_site_template_div_background_colors` */

DROP TABLE IF EXISTS `user_site_template_div_background_colors`;

CREATE TABLE `user_site_template_div_background_colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `div_id` int(11) unsigned NOT NULL,
  `hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  CONSTRAINT `user_site_template_div_background_colors_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_div_background_colors_ibfk_2` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_background_colors` */

insert  into `user_site_template_div_background_colors`(`id`,`template_id`,`div_id`,`hex`) values (2,1,60,'#336699'),(3,1,62,'#999999'),(4,1,63,'#666666');

/*Table structure for table `user_site_template_div_sizes` */

DROP TABLE IF EXISTS `user_site_template_div_sizes`;

CREATE TABLE `user_site_template_div_sizes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `div_id` int(11) unsigned NOT NULL,
  `width` int(4) NOT NULL DEFAULT '1',
  `height` int(4) NOT NULL DEFAULT '0',
  `design_height` int(4) NOT NULL DEFAULT '0',
  `fixed_height` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  CONSTRAINT `user_site_template_div_sizes_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_div_sizes_ibfk_3` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_sizes` */

insert  into `user_site_template_div_sizes`(`id`,`template_id`,`div_id`,`width`,`height`,`design_height`,`fixed_height`) values (60,1,60,980,125,125,0),(61,1,61,980,0,375,0),(62,1,62,160,375,375,0),(63,1,63,820,375,375,0);

/*Table structure for table `user_site_template_divs` */

DROP TABLE IF EXISTS `user_site_template_divs`;

CREATE TABLE `user_site_template_divs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `template_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent, always set, base divs have a parent_id of 0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Sort order within grouping',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `sort_order` (`sort_order`),
  KEY `site_id` (`site_id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `user_site_template_divs_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_site_template_divs_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_divs` */

insert  into `user_site_template_divs`(`id`,`site_id`,`template_id`,`parent_id`,`sort_order`) values (60,1,1,0,1),(61,1,1,0,1),(62,1,1,61,1),(63,1,1,61,1);

/*Table structure for table `user_site_template_settings_color_palettes` */

DROP TABLE IF EXISTS `user_site_template_settings_color_palettes`;

CREATE TABLE `user_site_template_settings_color_palettes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `template_id` int(11) unsigned NOT NULL,
  `palette_id` int(11) unsigned NOT NULL,
  `sort_order` tinyint(2) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  KEY `template_id` (`template_id`),
  KEY `palette_id` (`palette_id`),
  CONSTRAINT `user_site_template_settings_color_palettes_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_site_template_settings_color_palettes_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_settings_color_palettes_ibfk_3` FOREIGN KEY (`palette_id`) REFERENCES `designer_color_palettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_settings_color_palettes` */

insert  into `user_site_template_settings_color_palettes`(`id`,`site_id`,`template_id`,`palette_id`,`sort_order`,`enabled`) values (1,1,1,1,1,1),(2,1,1,2,2,1),(3,1,1,3,3,1);

/*Table structure for table `user_site_templates` */

DROP TABLE IF EXISTS `user_site_templates`;

CREATE TABLE `user_site_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_site_templates_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_templates` */

insert  into `user_site_templates`(`id`,`site_id`,`name`,`enabled`) values (1,1,'Template 1 site 1',1),(2,1,'Template 2 site 1',1);

/*Table structure for table `user_sites` */

DROP TABLE IF EXISTS `user_sites`;

CREATE TABLE `user_sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_sites` */

insert  into `user_sites`(`id`,`name`,`enabled`) values (1,'Demo site 1',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
