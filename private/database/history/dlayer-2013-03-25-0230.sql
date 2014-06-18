/*
SQLyog Enterprise v11.01 (32 bit)
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
  `color_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `r` smallint(3) NOT NULL DEFAULT '0',
  `g` smallint(3) NOT NULL DEFAULT '0',
  `b` smallint(3) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `palette_id` (`palette_id`),
  KEY `color_type_id` (`color_type_id`),
  CONSTRAINT `designer_color_palette_colors_ibfk_1` FOREIGN KEY (`palette_id`) REFERENCES `designer_color_palettes` (`id`),
  CONSTRAINT `designer_color_palette_colors_ibfk_2` FOREIGN KEY (`color_type_id`) REFERENCES `designer_color_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palette_colors` */

insert  into `designer_color_palette_colors`(`id`,`palette_id`,`color_type_id`,`name`,`hex`,`r`,`g`,`b`,`enabled`) values (1,1,1,'Black','#000000',0,0,0,1),(2,1,2,'Tan','#f3f1df',127,127,127,1),(3,1,3,'Dark grey','#666666',102,102,102,1),(4,2,1,'Blue','#336699',51,102,127,1),(5,2,2,'Dark grey','#666666',102,102,102,1),(6,2,3,'Grey','#999999',127,127,127,1),(7,3,1,'Blue','#003366',0,51,102,1),(8,3,2,'White','#FFFFFF',127,127,127,1),(9,3,3,'Orange','#FF6600',255,255,255,1);

/*Table structure for table `designer_color_palettes` */

DROP TABLE IF EXISTS `designer_color_palettes`;

CREATE TABLE `designer_color_palettes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_script` char(9) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palettes` */

insert  into `designer_color_palettes`(`id`,`name`,`view_script`,`enabled`) values (1,'Palette 1','palette-1',1),(2,'Palette 2','palette-2',1),(3,'Palette 3','palette-3',1);

/*Table structure for table `designer_color_types` */

DROP TABLE IF EXISTS `designer_color_types`;

CREATE TABLE `designer_color_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_types` */

insert  into `designer_color_types`(`id`,`type`) values (1,'Primary'),(2,'Secondary'),(3,'Tertiary');

/*Table structure for table `designer_content_types` */

DROP TABLE IF EXISTS `designer_content_types`;

CREATE TABLE `designer_content_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_content_types` */

insert  into `designer_content_types`(`id`,`name`,`description`,`enabled`) values (1,'text','Text block',1);

/*Table structure for table `designer_css_border_styles` */

DROP TABLE IF EXISTS `designer_css_border_styles`;

CREATE TABLE `designer_css_border_styles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `style` (`style`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Border styles that can be used within the designers';

/*Data for the table `designer_css_border_styles` */

insert  into `designer_css_border_styles`(`id`,`name`,`style`,`sort_order`,`enabled`) values (1,'Solid','solid',1,1),(2,'Dashed','dashed',2,1),(3,'No border','none',9,1);

/*Table structure for table `designer_css_text_decorations` */

DROP TABLE IF EXISTS `designer_css_text_decorations`;

CREATE TABLE `designer_css_text_decorations` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_decorations` */

insert  into `designer_css_text_decorations`(`id`,`name`,`css`,`sort_order`,`enabled`) values (1,'None','none',1,1),(2,'Underline','underline',2,1),(3,'Strike-through','line-through',3,1);

/*Table structure for table `designer_css_text_styles` */

DROP TABLE IF EXISTS `designer_css_text_styles`;

CREATE TABLE `designer_css_text_styles` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_styles` */

insert  into `designer_css_text_styles`(`id`,`name`,`css`,`sort_order`,`enabled`) values (1,'Normal','normal',1,1),(2,'Italic','italic',2,1),(3,'Oblique','oblique',3,1);

/*Table structure for table `designer_css_text_weights` */

DROP TABLE IF EXISTS `designer_css_text_weights`;

CREATE TABLE `designer_css_text_weights` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_weights` */

insert  into `designer_css_text_weights`(`id`,`name`,`css`,`sort_order`,`enabled`) values (1,'Normal','400',1,1),(2,'Bold','700',2,1),(3,'Light','100',3,1);

/*Table structure for table `designer_html_headings` */

DROP TABLE IF EXISTS `designer_html_headings`;

CREATE TABLE `designer_html_headings` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_html_headings` */

insert  into `designer_html_headings`(`id`,`name`,`tag`,`sort_order`,`enabled`) values (1,'Page title','h1',1,1),(2,'Heading 1','h2',2,1),(3,'Heading 2','h3',3,1),(4,'Heading 3','h4',4,1),(5,'Heading 4','h5',5,1),(6,'Heading 5','h6',6,1),(7,'Heading 6','h7',7,1);

/*Table structure for table `dlayer_module_tool_tabs` */

DROP TABLE IF EXISTS `dlayer_module_tool_tabs`;

CREATE TABLE `dlayer_module_tool_tabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(2) unsigned NOT NULL,
  `tool_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_script` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'View script for tool tab',
  `multi_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tool_tab` (`tool_id`,`view_script`),
  KEY `name` (`name`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `dlayer_module_tool_tabs_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_modules` (`id`),
  CONSTRAINT `dlayer_module_tool_tabs_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `dlayer_module_tools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tool_tabs` */

insert  into `dlayer_module_tool_tabs`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`multi_use`,`default`,`sort_order`,`enabled`) values (1,1,2,'Quick split','quick',0,1,1,1),(2,1,2,'Split with mouse','advanced',0,0,2,1),(3,1,2,'Help','help',0,0,3,1),(4,1,3,'Quick split','quick',0,1,1,1),(5,1,3,'Split with mouse','advanced',0,0,2,1),(6,1,3,'Help','help',0,0,3,1),(7,1,7,'Palette 1','palette-1',0,1,1,1),(8,1,7,'Palette 2','palette-2',0,0,2,1),(9,1,7,'Palette 3','palette-3',0,0,3,1),(10,1,7,'Set custom color','advanced',0,0,4,1),(11,1,7,'Help','help',0,0,5,1),(12,1,6,'Set custom size','advanced',1,0,4,1),(14,1,6,'Help','help',0,0,5,1),(15,1,6,'Expand','expand',1,1,1,1),(16,1,6,'Contract','contract',1,0,2,1),(17,1,6,'Adjust height','height',1,0,3,1),(20,1,8,'Set custom border','advanced',1,1,2,1),(21,1,8,'Help','help',0,0,3,1),(22,1,8,'Full border','full',0,0,1,1),(23,4,10,'Text','text',1,1,1,1),(24,4,11,'Header','header',1,1,1,1),(25,4,10,'Help','help',0,0,2,1),(26,4,11,'Help','help',0,0,2,1),(27,3,12,'Text field','text',0,1,1,1),(28,3,12,'Help','help',0,0,2,1);

/*Table structure for table `dlayer_module_tools` */

DROP TABLE IF EXISTS `dlayer_module_tools`;

CREATE TABLE `dlayer_module_tools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tool` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tool name to use through code',
  `tool_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tool process model',
  `folder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folder for tool tab ciew scripts',
  `icon` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `base` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Can tool run on base div',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Group within toolbar',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Sort order within group',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tool` (`module_id`,`tool`),
  KEY `group_id` (`group_id`),
  KEY `sort_order` (`sort_order`),
  CONSTRAINT `dlayer_module_tools_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tools` */

insert  into `dlayer_module_tools`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`icon`,`base`,`group_id`,`sort_order`,`enabled`) values (1,1,'Cancel','cancel',NULL,'cancel','cancel.png',1,1,1,1),(2,1,'Split horizontal','split-horizontal','SplitHorizontal','split-horizontal','split-horizontal.png',1,2,1,1),(3,1,'Split vertical','split-vertical','SplitVertical','split-vertical','split-vertical.png',1,2,2,1),(6,1,'Resize','resize','Resize','resize','resize.png',0,3,3,1),(7,1,'Background color','background-color','BackgroundColor','background-color','background-color.png',1,4,1,1),(8,1,'Border','border','Border','border','border.png',0,4,2,1),(9,4,'Cancel','cancel',NULL,'cancel','cancel.png',1,1,1,1),(10,4,'Text','text','Text','text','text.png',0,2,1,1),(11,4,'Header','header','Header','header','header.png',0,2,2,1),(12,3,'Text','text','Text','text','text.png',0,2,1,1),(13,3,'Text area','textarea','TextArea','textarea','textarea.png',0,2,2,1),(14,3,'Cancel','cancel',NULL,'cancel','cancel.png',1,1,1,1);

/*Table structure for table `dlayer_modules` */

DROP TABLE IF EXISTS `dlayer_modules`;

CREATE TABLE `dlayer_modules` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_modules` */

insert  into `dlayer_modules`(`id`,`name`,`title`,`description`,`icon`,`sort_order`,`enabled`) values (1,'template','Template designer','Design templates define the basic structure for a webpage.','template.png',1,1),(2,'widget','Widget designer','Widgets are reusable fragments, if you have something that needs to appear on multiple pages it should probably be a widget.','widget.png',4,1),(3,'form','Forms builder','Create a form to capture user input.','form.png',3,1),(4,'content','Content manager','Create pages and add content to them, content can be anything, text, images, forms, widgets.','content.png',2,1),(5,'website','Website manager','Define the structure of your website by setting the relationship between web pages.','website.png',5,1);

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

insert  into `dlayer_sessions`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('001ob53qr2chh2ccstjqjepa00','','PHPSESSID',1363797464,1440,''),('09i5lsgrvrj08884oeg0v5som6','','PHPSESSID',1364178363,1440,''),('09obkurklpqb4fqkt4cevejrl4','','PHPSESSID',1363724415,1440,''),('0i3m9tetgu7100mrr66tip6fn1','','PHPSESSID',1364164428,1440,''),('0p9l3hg64hsif5knd2g41kcg24','','PHPSESSID',1364094204,1440,''),('0ttuoqifkerng7od1ticaj8jl4','','PHPSESSID',1364094221,1440,''),('0vpjbq6vp9sjd0ltr6d6hgpmf7','','PHPSESSID',1363490151,1440,''),('129n9l4do3lcrbt60t5h5ojjr7','','PHPSESSID',1364164506,1440,''),('135m63dguja62ukha3gi3t08b3','','PHPSESSID',1363914738,1440,''),('13q88ug6fp4bmd522o8ifomod4','','PHPSESSID',1363793710,1440,''),('152d2rnb5cksebn6jm8kgjvds0','','PHPSESSID',1363793324,1440,''),('15lr8bkeibobckbmbs1jh35hu7','','PHPSESSID',1363489776,1440,''),('1793o6lhtnognqeditlmhput06','','PHPSESSID',1363792950,1440,''),('1a2fmelf97r4ji5pqbl8u1g4u4','','PHPSESSID',1363657476,1440,''),('1bbkc9c2o2i5st5566pogudg91','','PHPSESSID',1364094736,1440,''),('1e09tsnl1849r1hemecavtvu83','','PHPSESSID',1363946567,1440,''),('1esnoahejlqsbsio4tgh11krb7','','PHPSESSID',1363914062,1440,''),('1faan5r6agi6hbenqk37uejkg7','','PHPSESSID',1363571691,1440,''),('1ibg5v68s4igct2fico8p0d4j3','','PHPSESSID',1364177654,1440,''),('1lgsm40sl3ogajbbv69hg31e76','','PHPSESSID',1363489746,1440,''),('1ogghqk1e7o5mevqb2pfjhpnm5','','PHPSESSID',1363946606,1440,'dlayer_session|a:2:{s:7:\"site_id\";i:1;s:9:\"module_id\";s:1:\"1\";}dlayer_session_template|a:5:{s:11:\"template_id\";i:1;s:4:\"tool\";N;s:15:\"selected_div_id\";N;s:10:\"tool_model\";s:15:\"BackgroundColor\";s:3:\"tab\";N;}dlayer_session_content|a:5:{s:11:\"template_id\";i:1;s:7:\"page_id\";i:1;s:15:\"selected_div_id\";s:3:\"161\";s:19:\"selected_content_id\";N;s:7:\"tool_id\";N;}'),('1os05c21u606i7is3husj3f4e5','','PHPSESSID',1363916350,1440,''),('1ru92k6mdf16m3k1i1kl1mjcg0','','PHPSESSID',1363793766,1440,''),('1ufm9t4hbbhk1vsqcidgs0uri0','','PHPSESSID',1363916646,1440,''),('21sdq7gv7k1d0a5dvth746d3i4','','PHPSESSID',1363724239,1440,''),('22ua7g8bp9u5pajs4subfnqqr0','','PHPSESSID',1363916230,1440,''),('24lr4nr0hvj2eq0m678cf9qqa1','','PHPSESSID',1364094812,1440,''),('29edigpd1i5fgpmsaa8c2je482','','PHPSESSID',1363797453,1440,''),('2aq0euf7vhm9u1miiecdphknq2','','PHPSESSID',1363911715,1440,''),('2ieo0kmjp45c3fr51amq69r1q0','','PHPSESSID',1363792824,1440,''),('2k8g18hp6rr192i657rls2mcr4','','PHPSESSID',1364094519,1440,''),('2nfpcvh0pcvkv5p02q9luv89f2','','PHPSESSID',1363571689,1440,''),('2ro3maqch19jn27tb5oajpuiu5','','PHPSESSID',1363489536,1440,''),('2shn2o7ohkjj3cn1hvtmo0dtc3','','PHPSESSID',1363724237,1440,''),('2uslm8oi7rgkqn92bvar1qtop0','','PHPSESSID',1363797368,1440,''),('2vmp9786qh2l60t21ha8uudck5','','PHPSESSID',1364095739,1440,''),('35h7f43mb8kl9o9l6e2hql7dg1','','PHPSESSID',1363914694,1440,''),('3en262a8hugeib78udkbc6qu50','','PHPSESSID',1364177773,1440,''),('3g01kna7el9cjms846mm73niv1','','PHPSESSID',1364094907,1440,''),('3gh7plonh3gf8qnkl38mq00ng0','','PHPSESSID',1363914042,1440,''),('3jjb001o4ll0gtd3nljke483t2','','PHPSESSID',1364177584,1440,''),('3ljg3ilpiavvbs8tsgcfvo3el3','','PHPSESSID',1364165136,1440,''),('3qrt8d51h009258ugp0jb53130','','PHPSESSID',1363916252,1440,''),('3r6sfqg7hbmnvo9g4j5bbactc6','','PHPSESSID',1363911717,1440,''),('3sj6h556dl85jbheedeenjn2n0','','PHPSESSID',1363489622,1440,''),('3ss1uek282dve6h0t9f5brnqh2','','PHPSESSID',1363724227,1440,''),('3tvj8vcps745cga6vrf6nb99s0','','PHPSESSID',1363946606,1440,''),('3ur0a8qsq9thbmji4rveho5915','','PHPSESSID',1363916635,1440,''),('40gfkt3qkhgdl69sa65drvscn7','','PHPSESSID',1363490152,1440,''),('41ncm3lin917n4ua8gfbfcjba5','','PHPSESSID',1363724228,1440,''),('43ikba3e4hfe9dtcic15k2vjr3','','PHPSESSID',1363724157,1440,''),('45vuq3q1e0d7dbg8au76k2d365','','PHPSESSID',1364177584,1440,''),('4g8jq95d04lfmg739i412mcst3','','PHPSESSID',1364094943,1440,''),('4grmbed0dl0cvm6qgahbms17c4','','PHPSESSID',1363725545,1440,''),('4h53o3h200o46sa37q3nqk4cd6','','PHPSESSID',1363797369,1440,''),('4i6joai3g0eot932hi489re891','','PHPSESSID',1363913664,1440,''),('4im1ep6msrevdevghl5cpl2055','','PHPSESSID',1364178249,1440,''),('4nagvfsun7gpejei2dd9hf3gu4','','PHPSESSID',1364094952,1440,''),('4tfhbvtbrr5ak7bujkptr3pvi0','','PHPSESSID',1364164577,1440,''),('4tkcc7j8gc2p1r4malpl9f5j17','','PHPSESSID',1363946548,1440,''),('4trhenvq2glddn7jp366um1ia3','','PHPSESSID',1364178372,1440,'dlayer_session|a:2:{s:7:\"site_id\";i:1;s:9:\"module_id\";s:1:\"1\";}dlayer_session_template|a:5:{s:11:\"template_id\";i:1;s:4:\"tool\";N;s:15:\"selected_div_id\";N;s:10:\"tool_model\";s:6:\"Border\";s:3:\"tab\";N;}dlayer_session_content|a:7:{s:11:\"template_id\";i:1;s:7:\"page_id\";i:1;s:15:\"selected_div_id\";s:3:\"160\";s:19:\"selected_content_id\";N;s:4:\"tool\";s:6:\"header\";s:3:\"tab\";s:6:\"header\";s:10:\"tool_model\";s:6:\"Header\";}dlayer_session_form|a:6:{s:7:\"form_id\";i:1;s:7:\"tool_id\";N;s:4:\"tool\";s:4:\"text\";s:10:\"tool_model\";s:4:\"Text\";s:3:\"tab\";s:4:\"text\";s:11:\"selected_id\";N;}'),('51l25t60j14taqc2hferv1c9b7','','PHPSESSID',1363946550,1440,''),('52qslbtajf537v6jt6pect2ge5','','PHPSESSID',1363657474,1440,''),('57ejq0dtbotqcbds108b7645d0','','PHPSESSID',1363795500,1440,''),('59e8phkubi9qk14s1thfncisq1','','PHPSESSID',1363946350,1440,''),('5btc8a17b9umi4bv0g4061e9g7','','PHPSESSID',1363793765,1440,''),('5c1p798u7jp5e238he6pq6vb11','','PHPSESSID',1363795498,1440,''),('5clvu96gs1d6fb4d6ovhd4lk37','','PHPSESSID',1364164954,1440,''),('5efpbtbni0f4v41tdjjfut0sl3','','PHPSESSID',1364094951,1440,''),('5gk8m1vdbm26shkc2clnl3rqc4','','PHPSESSID',1364164762,1440,''),('5hukijmjujqbbqsv3v632cue13','','PHPSESSID',1364094927,1440,''),('5i55mfvah9lnp9mhb08f9ptlm1','','PHPSESSID',1364094911,1440,''),('5lt66gm11e2m06oklhijvqt6q3','','PHPSESSID',1364165149,1440,''),('5oi07atutjg3juvaohesb02jj4','','PHPSESSID',1363913568,1440,''),('5suuejpc940ibd3r2mhr0crr30','','PHPSESSID',1363724363,1440,''),('614r9b8rrgfpskneg40jno4ic0','','PHPSESSID',1363946348,1440,''),('62hbj2n1idl1mfu5na5nmi0ao0','','PHPSESSID',1363913569,1440,''),('62mvi7uksnrnmqs0bso9g55iv4','','PHPSESSID',1363793325,1440,''),('63fs830m1lb5bj4f1ia79mo884','','PHPSESSID',1364094929,1440,''),('64m8v2e47jbn4vuqj51nsp0aa0','','PHPSESSID',1363946574,1440,''),('64uefihec7431c5daskoucvoq0','','PHPSESSID',1363724503,1440,''),('69kbp95jbr5f7a0a0u3ubndri6','','PHPSESSID',1363493939,1440,''),('6ajm31284ijj6puacuf89k2cn3','','PHPSESSID',1363914400,1440,''),('6ep0hh9dslhmu73ncls75hpr75','','PHPSESSID',1363793711,1440,''),('6h82q99uo2k9mt02mg6a93ooq6','','PHPSESSID',1364164576,1440,''),('6lca0paraan40lpbeosr8o6qs4','','PHPSESSID',1363656201,1440,''),('6rlhprdua3qolt955hkjlfi3m4','','PHPSESSID',1363724174,1440,''),('6t54tdvucartrr3rflaofq9702','','PHPSESSID',1363723386,1440,''),('6u4gmfttquindmgjeggr1bbka0','','PHPSESSID',1363916620,1440,''),('6uimu4k7ghq3boq6sf6fid2hp3','','PHPSESSID',1364177779,1440,''),('73u1ajd75n8liehlecu2ut6ha5','','PHPSESSID',1363916206,1440,''),('75k0efr3jv6qlb01sjqfk3ieh5','','PHPSESSID',1363946569,1440,''),('7a5f4nviea6dd9bfjvp7684237','','PHPSESSID',1364164144,1440,''),('7aoduhuvbg7apb0e31apa6r7j3','','PHPSESSID',1363916649,1440,'dlayer_session|a:2:{s:9:\"module_id\";s:1:\"1\";s:7:\"site_id\";i:1;}dlayer_session_template|a:5:{s:11:\"template_id\";i:1;s:4:\"tool\";N;s:15:\"selected_div_id\";N;s:3:\"tab\";N;s:10:\"tool_model\";s:6:\"Resize\";}dlayer_session_content|a:2:{s:11:\"template_id\";i:1;s:7:\"page_id\";i:1;}'),('7f2tmdjc0422g10tsseo941tq0','','PHPSESSID',1364164923,1440,''),('7n6qq7d9qpcof64n4lto80ihc4','','PHPSESSID',1363797453,1440,''),('7osspnfi5dpei4eltnrt5922o4','','PHPSESSID',1364094944,1440,''),('816tj8rasibp6nnomt07nmvkn3','','PHPSESSID',1363656353,1440,''),('83ko73kriop1sl3vah76tibm70','','PHPSESSID',1363916225,1440,''),('84ja74gatjesmk84s8qqdtr007','','PHPSESSID',1364094934,1440,''),('85ouj0bkcurhkcs4phi8ts7ah4','','PHPSESSID',1363916357,1440,''),('86e7rt82n4enio1a3gcf78h9d2','','PHPSESSID',1363914225,1440,''),('87ggj8ege1qt5tklqvrq8i9dq3','','PHPSESSID',1363914190,1440,''),('881jrbin17o35i9bcfctp95i64','','PHPSESSID',1364094963,1440,''),('88969b9alqmh09710cso56euj7','','PHPSESSID',1363916291,1440,''),('8au22vmitghk9estedvo2skoe3','','PHPSESSID',1363729146,1440,''),('8cgedn91b9m08b9t0regkm5f25','','PHPSESSID',1363724218,1440,''),('8hffb72t6odb32f62s8u1hcbp3','','PHPSESSID',1363946551,1440,''),('8iqphvoppqrm6i4gbq7391dod1','','PHPSESSID',1364094941,1440,''),('8k7alr01k97smohohsb6b9sp46','','PHPSESSID',1363724365,1440,''),('8m1stqfkldq3ih4gn1hkmerpl7','','PHPSESSID',1363724157,1440,''),('8odd70fge44sjalrpq0nfccp63','','PHPSESSID',1364164952,1440,''),('8psbntr5akauktbd5t1955k556','','PHPSESSID',1363914126,1440,''),('95ljrad92v3jr6v1rjruiedlp7','','PHPSESSID',1363913634,1440,''),('964agmea7q669q8crf1ibgvf05','','PHPSESSID',1363797494,1440,''),('98jjeeii08eojak95oaf7esmh5','','PHPSESSID',1363489748,1440,''),('9c0ns4mhaqkcnqli7eos62tgt5','','PHPSESSID',1363720150,1440,''),('9cjhaii5drrmhoonhblqamju10','','PHPSESSID',1363489806,1440,''),('9efbim78712ogtai39kr2gur24','','PHPSESSID',1363724304,1440,''),('9ernb0gt0pc7sj0lubnhd9bcv0','','PHPSESSID',1363946559,1440,''),('9fciii9gjqfvuh59289lqbugr3','','PHPSESSID',1364094239,1440,''),('9hcv4krqtqqjq9j9nloio424c3','','PHPSESSID',1363793331,1440,''),('9l13nd9095om5foo4mogd2co10','','PHPSESSID',1364164926,1440,''),('9mqkd4lq0a6chgis2elj7q6282','','PHPSESSID',1363916594,1440,''),('9n71ofj28fb5ng07bgfr66jrp6','','PHPSESSID',1363946555,1440,''),('9ndhhvpfr67mk0dt2j8cq3cnc6','','PHPSESSID',1363489540,1440,''),('9oqb90ucf4ru7bnp24ip9sk4o3','','PHPSESSID',1364164140,1440,''),('9r6h31e4kb0ikn250fp1vsdm66','','PHPSESSID',1364177119,1440,''),('9tj4tdb1aj2q97pf82t5k3hcs6','','PHPSESSID',1364177101,1440,''),('a1u2e0nqe868dfecpudq93bb63','','PHPSESSID',1363489532,1440,''),('a22a74c7qeg19gjf5e3kcemch1','','PHPSESSID',1363724507,1440,''),('a9sk3renvt10rcs2hujgj50ia6','','PHPSESSID',1364163728,1440,''),('aahh9vvonj19nrb9re1vjlp4e4','','PHPSESSID',1364094945,1440,''),('ace421q7f26u99cj08rvqqdhj3','','PHPSESSID',1363489690,1440,''),('ag50l64iu4an4ppd5frrckbj91','','PHPSESSID',1363490215,1440,''),('ak5numt79s7pj3v8sojsrhnr23','','PHPSESSID',1364177654,1440,''),('aliho4nd9j9ne3imuina4chkj6','','PHPSESSID',1363914039,1440,''),('an72u77h5oup9gacq55ftpusq0','','PHPSESSID',1364094831,1440,''),('ap7426isoif11ceab7eo3t1lr1','','PHPSESSID',1363914064,1440,''),('apep4k8km0m3vp48p0rbq2s2o3','','PHPSESSID',1363916616,1440,''),('aqri6i34ee9sn69ecvgeed2d20','','PHPSESSID',1363490338,1440,''),('arue6b5da3kj2m7900m53le2j0','','PHPSESSID',1363724222,1440,''),('b17gmvmkqu2bnd78pt27tggti1','','PHPSESSID',1364177772,1440,''),('b2ndn6smgie1mp2160073agkl6','','PHPSESSID',1364164145,1440,''),('b3vdppbkmp7v73cob73h603vc3','','PHPSESSID',1364164842,1440,''),('b5q3a5tvllonhj3lirhvprg2c3','','PHPSESSID',1363914223,1440,''),('b8bh66qrh0auj2mbgfokjub8j5','','PHPSESSID',1363914695,1440,''),('b9bna649vr8m2jgt41hgtrl7a4','','PHPSESSID',1364177668,1440,''),('b9p1e7lhcrru282mbg339rs791','','PHPSESSID',1364094914,1440,''),('bajcoc5a1t3ahvdii23bv0inq6','','PHPSESSID',1364094935,1440,''),('bbagosk6iass4m8r6597l553h6','','PHPSESSID',1363489669,1440,''),('bbde7vspe9mr9hcgbmefamp4o1','','PHPSESSID',1363596650,1440,''),('bd36bsktl6tmlnhsmi3j7p6ft2','','PHPSESSID',1364177095,1440,''),('bd6c7v9tb9ujt5jafel8r8hql0','','PHPSESSID',1364164145,1440,''),('bd87uc06cbkuvdrb9pthbhdst2','','PHPSESSID',1363916624,1440,''),('bfqmpt8paqp1q0gpilhhprcsd3','','PHPSESSID',1363946598,1440,''),('bke4epv509vv7bb34ap9ajtcp2','','PHPSESSID',1363916241,1440,''),('bmpin03p7l60v6b1l1s414qhm7','','PHPSESSID',1363797594,1440,''),('bo7ei7tl3gqqt15mhjrhuu30h6','','PHPSESSID',1364094932,1440,''),('bpfrlvl1cru5qegjvbqbhcr3k0','','PHPSESSID',1363489804,1440,''),('bqi7spfdm6fqbom1kicioo9bs0','','PHPSESSID',1363914037,1440,''),('bqpk7v4ir1kbc69nc6vm5i7nb0','','PHPSESSID',1363797543,1440,''),('btj5ubma9qj3ilks95224bael7','','PHPSESSID',1363946412,1440,''),('c0lbmmvuhcs3i3co4uavc1io84','','PHPSESSID',1364094946,1440,''),('c1u7hktv1qok7gi0e19o3u5uc5','','PHPSESSID',1364094220,1440,''),('c21i9c8cl7m3h9db1vflt5pto5','','PHPSESSID',1363489745,1440,''),('c423kjpgafqqs25qb39bj4h175','','PHPSESSID',1363797907,1440,''),('c94btjrn0ahfpl9ba6n1ave6k5','','PHPSESSID',1363914188,1440,''),('ccmjl65fte5o9913m4m8enlte5','','PHPSESSID',1363916349,1440,''),('ce6dm9vvg27lte9497kd47ilr0','','PHPSESSID',1364168754,1440,''),('cepfe9pagl4rdsvi6o0p1e9ic6','','PHPSESSID',1363914157,1440,''),('cfdru7o8tl8rfsl1t6qo1fcvv5','','PHPSESSID',1364177544,1440,''),('chs8mpt8h9nuec2nb2ojt3v6n7','','PHPSESSID',1364094964,1440,''),('cihi4agsj439803sdksehck3j0','','PHPSESSID',1364178366,1440,''),('clp5nf4nnda6u96lna1roog544','','PHPSESSID',1363489880,1440,''),('clpfsmcegfd5vrgnmngui98b42','','PHPSESSID',1363793764,1440,''),('cq0pr2o8if5mrfnvl9sifdn5l4','','PHPSESSID',1363912416,1440,''),('crr9jba0nnjebr7n241ud83lj0','','PHPSESSID',1363724419,1440,''),('cvv0ce42gq98jkoevt9cn050n3','','PHPSESSID',1364177075,1440,''),('d0n2heurjh4fjnoj21ll3vlnc1','','PHPSESSID',1364094925,1440,''),('d1aqqe064heltgmocoa0eljrt0','','PHPSESSID',1364178367,1440,''),('d234kemt74lpes70nt30efrgo0','','PHPSESSID',1363571697,1440,''),('d28je3ulju90pva6q4tgp6gj26','','PHPSESSID',1364094954,1440,''),('d2suts62n5a1v7kdrfg3pcpu67','','PHPSESSID',1363914139,1440,''),('d4db52btgllm96lmurfdaandu1','','PHPSESSID',1363946353,1440,''),('d4vnc2r6qdkiali2da58hu9ks2','','PHPSESSID',1363946409,1440,''),('d710t5mf6erbmmnijg52ho11a6','','PHPSESSID',1364178250,1440,''),('d7vtv9ik7gi7np2a83ji8qi0k4','','PHPSESSID',1363656202,1440,''),('dc091pd0hs6qhn19ue1u000im0','','PHPSESSID',1364094936,1440,''),('dgg72edl87mfuorup65ipii1h0','','PHPSESSID',1364094941,1440,''),('di4a5ko9p4qcdbodhl9orkm941','','PHPSESSID',1364094946,1440,''),('dirb1skhdunjgq3cvm3p730ne4','','PHPSESSID',1363913434,1440,''),('djd38q3ofpeb4piqf46q77dfm1','','PHPSESSID',1363793325,1440,''),('dktjiemi76sdaagam2srplfkq2','','PHPSESSID',1364094928,1440,''),('dls52ll4755p6se9jervek6931','','PHPSESSID',1363724499,1440,''),('dmilar16am0mavlufsf2el75n0','','PHPSESSID',1363797504,1440,''),('dncuulm48o5chejmoqi5jl3h83','','PHPSESSID',1363792949,1440,''),('dpij373or5ef61i0ks73j7l3h0','','PHPSESSID',1363916289,1440,''),('dpom8k8k9pjujriuussbgbuut4','','PHPSESSID',1363916288,1440,''),('ds79i5h99q3s9kbtjg4idcljd6','','PHPSESSID',1363571694,1440,''),('dsfeq70tkkhn1iipsn3usgv351','','PHPSESSID',1364177586,1440,''),('dum2ahnqk4ehtmkkn229h34sk1','','PHPSESSID',1364178251,1440,''),('duroope5cfp68qpti0tnmed3p7','','PHPSESSID',1363489533,1440,''),('dv5u0hpa7gftcgvi551d4lunq6','','PHPSESSID',1364164679,1440,''),('e2qcuanb3ncknr8csjuqujogg3','','PHPSESSID',1363946553,1440,''),('e4j4qkk103h16o69h3u7r41tt2','','PHPSESSID',1364164174,1440,''),('e990isg7ejdlllmjpsavn16l66','','PHPSESSID',1363914141,1440,''),('ech3all12d3ce245hatr4h5t44','','PHPSESSID',1363912367,1440,''),('ecqrkmiu7rhveh0tr9mnerpml4','','PHPSESSID',1364165147,1440,''),('ehu39d0cgm6j1s6ucrcc8febc3','','PHPSESSID',1363724498,1440,''),('eijr8l0l78mvc3cikt4r3q16b1','','PHPSESSID',1363916582,1440,''),('eki0a61a7934hr80mc2jj9gvo7','','PHPSESSID',1364165150,1440,''),('ena9tbbhdu69fu9cn6d9c4pr57','','PHPSESSID',1363914191,1440,''),('epj94jisi3nijv33fqd3edqeq6','','PHPSESSID',1363914195,1440,''),('eq7c2su642bssqcead94chcjs0','','PHPSESSID',1363490158,1440,''),('evbd023u76qboarevg2cjh9lr1','','PHPSESSID',1364094924,1440,''),('evi5j8t8l1fcf2qp0ngs9ciqt3','','PHPSESSID',1364094249,1440,''),('evigbgovo3q7sm1dhs9sbhn6l5','','PHPSESSID',1364094938,1440,''),('evjbfm8g41gneftam5osha1ks0','','PHPSESSID',1364164428,1440,''),('f12a4t23ej6pn1gft2vs9jn9s0','','PHPSESSID',1364177675,1440,''),('f4g3ef2uq5o0bkjq9k73ra73b2','','PHPSESSID',1364165137,1440,''),('f5qia9fe93tokrvbct2krrnsj6','','PHPSESSID',1363797093,1440,''),('f85bubmdlh3ad0jtta0mbt3j02','','PHPSESSID',1364094940,1440,''),('f8o1lin5qv8ui53fhce1sjhl74','','PHPSESSID',1364164681,1440,''),('fac9qnm7eg6vu2pp10jhjbphu5','','PHPSESSID',1364165153,1440,''),('fc75ddkq3j9njcp64raufval36','','PHPSESSID',1363946570,1440,''),('ffam4pqkj4dqsv38f28ltuv0h1','','PHPSESSID',1363914737,1440,''),('ffel9hqmaj3orhqf70oitn81l5','','PHPSESSID',1363723389,1440,''),('fgqfdr3gdsb5tso0rt8bi1qb77','','PHPSESSID',1363793323,1440,''),('fn5tnv2r4441tafr4bth7tqur0','','PHPSESSID',1363490156,1440,''),('focupha98ateu3ukrodqtukrc2','','PHPSESSID',1363720147,1440,''),('foq09gh1c78nff885197om9e72','','PHPSESSID',1364094931,1440,''),('g0qfjr1nushnq6paul172k0i85','','PHPSESSID',1363797493,1440,''),('g2io4i96qgn8mg2u42m9qp9m03','','PHPSESSID',1364094206,1440,''),('g2mqcu3umqvmjl0e0pfmap4pv7','','PHPSESSID',1363946406,1440,''),('g5266ok4vrkro6ius79cdt3770','','PHPSESSID',1363916629,1440,''),('g61886k39rt771b7m2pe6o66a1','','PHPSESSID',1363946597,1440,''),('g6qk01gmd7tru0e7v9a5vaa9l5','','PHPSESSID',1363913535,1440,''),('g8s0kvcp64tk1p23ssdqm90f82','','PHPSESSID',1363916608,1440,''),('g9led94ro7oq91bti0otgivbh7','','PHPSESSID',1363656235,1440,''),('g9pqgcvgi9mab0rakgcjveike4','','PHPSESSID',1363916600,1440,''),('ga79vm3tsotbu61d5re0u33oe6','','PHPSESSID',1363914063,1440,''),('gar2vi0kkieg83jv9ngk04fpu7','','PHPSESSID',1364094926,1440,''),('gc3616kjrjp01erdg8i0sa2ru2','','PHPSESSID',1364164676,1440,''),('gd3o42pe63ob7mc1ls9tvr88g2','','PHPSESSID',1364094202,1440,''),('gg421b5as5uu9lvr3ite90h6d5','','PHPSESSID',1363914401,1440,''),('gt07dh76fj2mi110plao2l1ku7','','PHPSESSID',1364177122,1440,''),('gv30vfe8fnmm81j5dr728tf4q3','','PHPSESSID',1363916229,1440,''),('h0o2n7d96ntq3al1etrutfblm7','','PHPSESSID',1364094245,1440,''),('h1a4inq7feogfkm1r9ot6r9vh6','','PHPSESSID',1363724460,1440,''),('h28dbkbrnu5fpqibfbkcnbgfp4','','PHPSESSID',1364094219,1440,''),('h6vf3e2vevhpievm3akvdtr124','','PHPSESSID',1363914136,1440,''),('h8nh05jmsv9pm0egqbu97psdb4','','PHPSESSID',1363946584,1440,''),('hau1hmldtj6s94bp6bhqca1na0','','PHPSESSID',1364164958,1440,''),('helv04899fhcsh2q3jbkln96o1','','PHPSESSID',1364164927,1440,''),('hkqt3oku2n4gst7tkkv3gb0631','','PHPSESSID',1363489606,1440,''),('hpch0h4cod7ta59jvr953te6l3','','PHPSESSID',1363914128,1440,''),('hv9o9gm3khkglsq9lslcqfpmn2','','PHPSESSID',1364094897,1440,''),('hvkjne7ljpt8jodf4i9o22i970','','PHPSESSID',1363913445,1440,''),('i75b6cn87pfb9corst3rjtn3r1','','PHPSESSID',1363914401,1440,''),('i9u6ac0cu8gh1bp4k7re8386b1','','PHPSESSID',1363916280,1440,''),('ia56ttr5boi9oh5ds0rfeh2ps4','','PHPSESSID',1363914458,1440,''),('ibl18lc4i9cncbb3drji3l6la5','','PHPSESSID',1364177775,1440,''),('ic2d5fsju5dinkrhv6h8du2j72','','PHPSESSID',1364163726,1440,''),('ieu1nhco0rrub010lqcp3djvg0','','PHPSESSID',1363916647,1440,''),('ifnfussmpsna7t8orej3393di1','','PHPSESSID',1363911716,1440,''),('ik1vtrb478luvuj4u8987flrn5','','PHPSESSID',1364094933,1440,''),('ik7cbkl2gmel1kilglto45pbp6','','PHPSESSID',1363724154,1440,''),('imphenq45hnb9obor71lr2q8j7','','PHPSESSID',1364094901,1440,''),('iodac9puqneauokm13h89sj2j2','','PHPSESSID',1364164441,1440,''),('iookhl3m8064bmncsju76gec26','','PHPSESSID',1364094761,1440,''),('isvgu7tt9q791705sbu0uq96f1','','PHPSESSID',1363797509,1440,''),('it514apitg1otrb9nhfrv9uj43','','PHPSESSID',1364177669,1440,''),('itb3hguhss79n30uav01qa3h07','','PHPSESSID',1363795504,1440,''),('j0v1k6rvbqou6ifnsrh4r2mn11','','PHPSESSID',1363915831,1440,''),('j11vsfcsr2mg4oq5prcipfr1c5','','PHPSESSID',1363792826,1440,''),('j1fv0k9me8foi5ofmco5g4uig1','','PHPSESSID',1363913636,1440,''),('j1gmskfkossh8hb9omg29ebji1','','PHPSESSID',1364094942,1440,''),('j4lpsupd09m0elkrl3vich48p5','','PHPSESSID',1363946554,1440,''),('j8s3rd9l50lfm7frd49lr8s2d3','','PHPSESSID',1363724232,1440,''),('j99imgi2bchfuleh03uh2v03k4','','PHPSESSID',1364094229,1440,''),('jb6a7dogpunq8h88g1m4hbag71','','PHPSESSID',1364094916,1440,''),('jcle806jm57ipka87lj0daqe25','','PHPSESSID',1364163686,1440,''),('jd0afgdjb01990pvbc3pp2i5t4','','PHPSESSID',1364164427,1440,''),('jgfdt19cpkijk2mbbj4hvmp767','','PHPSESSID',1363914134,1440,''),('jkui07551rqs680nhvjj1at2i3','','PHPSESSID',1364094762,1440,''),('jmr55jf10vtm100rp0kelbaok1','','PHPSESSID',1363914285,1440,''),('jp7uvb9qvagn4us81q6vkut0q0','','PHPSESSID',1364164439,1440,''),('jvhlrqdpp0u1il2dutdk1fh4u0','','PHPSESSID',1363797416,1440,''),('k0od861t35dlje0b3aucu7cus1','','PHPSESSID',1364094923,1440,''),('k66nkpnia1rgasrbqfv4a8hrj2','','PHPSESSID',1363489670,1440,''),('k6nfmk57n9jafiq8arik6e65c4','','PHPSESSID',1363914129,1440,''),('kcfqdf4cg5n1b2op7c7tu1laa0','','PHPSESSID',1363916356,1440,''),('ke4rv6mlprgjg6rue9mfpddu04','','PHPSESSID',1363793766,1440,''),('kfn3958cglplrtk3qh4alab3d5','','PHPSESSID',1364164686,1440,''),('kgkpqg0m1t60282lasecgg0np4','','PHPSESSID',1363797087,1440,''),('kk8tad1liabqlohuec8cdq9mk4','','PHPSESSID',1364177072,1440,''),('kmab7k4efvkk0ahcperh5a1292','','PHPSESSID',1363792821,1440,''),('krdccpgg5c3alg5k1124332jr4','','PHPSESSID',1363797370,1440,''),('ks3jhhbdvra0tlboj1geujf7b6','','PHPSESSID',1364094201,1440,''),('kuh3umpt292o0d6j2fra2pv6m2','','PHPSESSID',1363795505,1440,''),('l22k85rk30s3gfvn6lrms3rpt5','','PHPSESSID',1363914440,1440,''),('l5a1dgvs4qr1sa0ueadgnge602','','PHPSESSID',1363946269,1440,''),('l5ocf25g8sgggdif2h3jnjpev4','','PHPSESSID',1363916607,1440,''),('l8b206rqbhfpgi98a4svffgs84','','PHPSESSID',1363490158,1440,''),('l8dq9o0c6vcr0svo569mmg3tc6','','PHPSESSID',1363916354,1440,''),('l8ef09gert8nird7ni5s9uf8n1','','PHPSESSID',1364094936,1440,''),('l908pkt7u275e00fk0349khk17','','PHPSESSID',1364094908,1440,''),('lahttm0gn3m1nqoblkpdm9q743','','PHPSESSID',1364177585,1440,''),('ld46kul9npaqdin1brfj4hljv2','','PHPSESSID',1363916285,1440,''),('lf26cvrned5bfar9f9juf9a3c5','','PHPSESSID',1364178252,1440,''),('lf9qhovr3kl19utu2l51mv8hq3','','PHPSESSID',1364094830,1440,''),('lhh1cgadrt7tca52dunfl0pqc5','','PHPSESSID',1363489620,1440,''),('lls774dk9tb6h6eaflfm02v6c0','','PHPSESSID',1363657476,1440,''),('lovolkaj29hidj4jlcvghq4kf4','','PHPSESSID',1363724220,1440,''),('lp0oa8te2lh4b1p2mjidvcc480','','PHPSESSID',1363914137,1440,''),('lq4b5nngsd23naeqci7pho7527','','PHPSESSID',1364094771,1440,''),('lsd5s7rj38ou7lbot79g2qblr2','','PHPSESSID',1363916604,1440,''),('lt6m34lsfa527dt1hsse1fgjt7','','PHPSESSID',1363793711,1440,''),('ltsj6b02mppej740pshn8732n7','','PHPSESSID',1363720149,1440,''),('lv04laq55v29h9ap833to5l3p7','','PHPSESSID',1363797505,1440,''),('lvhapiduhs6n7dpocikfc9mv42','','PHPSESSID',1364094214,1440,''),('m4sgl6bet3mft1hon033801bs4','','PHPSESSID',1363489618,1440,''),('m6nlrg7sl9ahf1r1np0sget6g7','','PHPSESSID',1363946547,1440,''),('m83jcmn0fejcfuvtb0tc3885g1','','PHPSESSID',1364164844,1440,''),('m8g889ffrhjdkfvgq993ojgr37','','PHPSESSID',1364164684,1440,''),('manek5pa00dtrmj1mnmui5ig11','','PHPSESSID',1363793333,1440,''),('mevd20392ogaosgkqsaiq8fif3','','PHPSESSID',1363571699,1440,''),('mg95r4ihcj0um478hvkf5bq0p1','','PHPSESSID',1363914127,1440,''),('mh8bh7b7n8gmet5bkl9bhc4l52','','PHPSESSID',1363656354,1440,''),('mi60csknqtq3rsn3nc59u0s592','','PHPSESSID',1363916611,1440,''),('mov782d98afk7s0ogm9bt97a93','','PHPSESSID',1363489689,1440,''),('mqplkjrjqlcv5q7cg2j7a5rlk6','','PHPSESSID',1363946562,1440,''),('mqv2kq1jlnlgmn0uhslrcs7fc1','','PHPSESSID',1363490311,1440,''),('mu9abcrr8c1idduqkthvq9vkk6','','PHPSESSID',1363916243,1440,''),('n3ggr1bu170m0vr43oce10s615','','PHPSESSID',1363946267,1440,''),('n50k6sk34jdpdp4fptbbvblcs5','','PHPSESSID',1363916227,1440,''),('n5anv64c1b1a7dmjsp79v98rj2','','PHPSESSID',1364094518,1440,''),('n756mqkfmdfsn8mm8s3oeqkoj7','','PHPSESSID',1363724219,1440,''),('n8qovf2r9srjekuugnn65osvr0','','PHPSESSID',1364094929,1440,''),('n8t6efo7q113ukecc9cnla2dm0','','PHPSESSID',1364094737,1440,''),('n9vnpopagcn7v2tjjlg051f616','','PHPSESSID',1363946546,1440,''),('naskl6gs4bdf4gfg26sdgmdla3','','PHPSESSID',1363912366,1440,''),('nbb7gig48jk2bblaefg1coa6g1','','PHPSESSID',1364177072,1440,''),('nc2cqthl6ugl4lep5qostvaed5','','PHPSESSID',1364163685,1440,''),('nfq0hc5tjuujbfg490dv9ku7i3','','PHPSESSID',1363795502,1440,''),('ng8m05thf7hn8db351ne529nv6','','PHPSESSID',1364163713,1440,''),('nghs821ej2487dqbes615kglo7','','PHPSESSID',1364177655,1440,''),('nisbh02bg5k9mut6k7e98p1as4','','PHPSESSID',1364177118,1440,''),('njl5inppife2lllvgtk7rrn3a1','','PHPSESSID',1364177076,1440,''),('nk822g1uohj019kr578og1dtd3','','PHPSESSID',1363946591,1440,''),('npatgepihcpsjp5qhhi89tcpj5','','PHPSESSID',1363801508,1440,''),('nru5i6iqolmsqh3u9gotspnkt7','','PHPSESSID',1363916591,1440,''),('nskqtgpe96q9iu0ev3q25ueg44','','PHPSESSID',1363571693,1440,''),('nt57qtk4ep70gcfbmppc5jm7f0','','PHPSESSID',1363946265,1440,''),('ntuv2e2rd7ru139ksg7h3dvns0','','PHPSESSID',1363946268,1440,''),('nvcnvjefef5k8nkj9qi3b2i4f5','','PHPSESSID',1363797451,1440,''),('o1g0su7kuo666ttv0vcfshome1','','PHPSESSID',1363914696,1440,''),('o9ag87mq6iv24v7331pd0an6g4','','PHPSESSID',1364094875,1440,''),('oabltgr79tgih860bua0icuo40','','PHPSESSID',1364094937,1440,''),('ob0d6e8fa0geanhe1qi8bct031','','PHPSESSID',1364094927,1440,''),('ogcpj71tjah6db4g583poiki63','','PHPSESSID',1364094898,1440,''),('okgb2vh1su5t19vgr6eejr29t5','','PHPSESSID',1363916353,1440,''),('oledhl4hjto2lbjmqvmlcelrf4','','PHPSESSID',1363946564,1440,''),('onfgjrrcj1ut40pn78929ar1v7','','PHPSESSID',1364094240,1440,''),('oq2ut17d03haulquc8lhtbtpf7','','PHPSESSID',1363946581,1440,''),('oqfakip592dakhfe1v31p9ha70','','PHPSESSID',1363916625,1440,''),('or63aci4g77i5ut02imhp8n9i3','','PHPSESSID',1364177670,1440,''),('osem1pa8qgl2l5ctf62erlt5g5','','PHPSESSID',1364167742,1440,''),('osl6sdt3tnl76je1qa8v17vco1','','PHPSESSID',1363489744,1440,''),('otn7cpk6mrj13spomgrgf3kth7','','PHPSESSID',1363489807,1440,''),('otp46065o8b0jvc5ofmmhn4e03','','PHPSESSID',1363946567,1440,''),('ovgrd1hplft276nsosodufrl37','','PHPSESSID',1363946600,1440,''),('p0vv9smnu4isk6lopesu1pajg4','','PHPSESSID',1363912369,1440,''),('p1kafh5ul154nnud89880mm857','','PHPSESSID',1364165136,1440,''),('p4thnn8h6f21o296hso9qeivh0','','PHPSESSID',1363490154,1440,''),('p5ud22kcmv03stor6ko7i95hn0','','PHPSESSID',1364094906,1440,''),('p6h1mbpkbp73c3rqjaea6rqft2','','PHPSESSID',1363793776,1440,''),('p8vjp9igharnk6v8umabreim91','','PHPSESSID',1364094925,1440,''),('pasjpnk8f3bh0q4qa66hkah4b7','','PHPSESSID',1363724228,1440,''),('pdj01vuoq1psaqicrvjbsdgti1','','PHPSESSID',1363797091,1440,''),('pf20qqcrr901qa588mqhrtg057','','PHPSESSID',1364094947,1440,''),('ph8f3mgul3in6gh3ea3b4c0dh0','','PHPSESSID',1363914224,1440,''),('phoeuoruqsv8gj6b6megom6dt0','','PHPSESSID',1364177069,1440,''),('pj554dlk5dlev3inhrdun1l9u2','','PHPSESSID',1364177103,1440,''),('pk395rv3s18pccbptssqeu2rj6','','PHPSESSID',1363946561,1440,''),('pkat5oaqaml7jssg79krmrk176','','PHPSESSID',1364178372,1440,''),('pogm0ghm2optoq049u0fokv2p5','','PHPSESSID',1364094874,1440,''),('prq0hu8s5q7865js1l9hkjee02','','PHPSESSID',1364177735,1440,''),('ptvrqh26bikv1gbtm529ks7m97','','PHPSESSID',1364177543,1440,''),('pv39is220fs859v0o2no8c4vk6','','PHPSESSID',1364164880,1440,''),('q2n954qp9friocn61clr3psba3','','PHPSESSID',1363946566,1440,''),('q4usfe7lhs8ubg17gtkunvn4d6','','PHPSESSID',1363916256,1440,''),('qbgp6ruk88dmah1rb9a4a7iop5','','PHPSESSID',1364163725,1440,''),('qfo9sf33aqrhn5houd3hbs0q30','','PHPSESSID',1363656207,1440,''),('qm0498c395dj0rdkekb7h5ogv1','','PHPSESSID',1363489623,1440,''),('qpm9pubjsc5973lqncgj1g4rd7','','PHPSESSID',1364164677,1440,''),('qprl5gjeepbgdagprgjjps2uf4','','PHPSESSID',1363946583,1440,''),('qrtcn4rsp68a7r2oeerqpj2af5','','PHPSESSID',1363914198,1440,''),('qua896ajnca5ca1c24ccqcq1m2','','PHPSESSID',1363489602,1440,''),('r1aj38m5fcfueu9979a73ikm34','','PHPSESSID',1363489619,1440,''),('r5p72s4tueog2volpla85dif17','','PHPSESSID',1364094236,1440,''),('r6m93ij3nkrufcar7oi2i1p4u2','','PHPSESSID',1363914023,1440,''),('r9b9bqotcgluf5a28chphoh9u3','','PHPSESSID',1363596650,1440,'dlayer_session|a:1:{s:7:\"site_id\";i:1;}'),('rbic3sfh86d2so1qf33jvo4vi3','','PHPSESSID',1364177096,1440,''),('rccqr7jad4grn2oslj4jsnmhg1','','PHPSESSID',1363914295,1440,''),('rcmvjhp7bjvt7uei9atsi13o86','','PHPSESSID',1363914452,1440,''),('rdpagl7ulrjmd0v92athtb88g7','','PHPSESSID',1363916603,1440,''),('rea6tpmei6ttj60cirregu1ug6','','PHPSESSID',1364094934,1440,''),('rn8ljseeu7l1q57jfdvo4lgqk3','','PHPSESSID',1363946549,1440,''),('rnk5ecsdi0i7u795l8dm6h9vq1','','PHPSESSID',1363797086,1440,''),('rpmmk5l19bdd6a314vktft5eh7','','PHPSESSID',1364094217,1440,''),('rqkb1dfm9qoli3flp1m1tkr1j0','','PHPSESSID',1364094932,1440,''),('rvetp3p3m1plea6nfh39dknsl4','','PHPSESSID',1363913666,1440,''),('s3ntt0s8rigc92c7eelhgmn893','','PHPSESSID',1363490155,1440,''),('s3v13m13cm0m45hblj176kfds0','','PHPSESSID',1363916284,1440,''),('s579mr162q7vs3rep8b53hg2t1','','PHPSESSID',1364164677,1440,''),('s907vq5sr87ggdcvcdeera1i10','','PHPSESSID',1363724156,1440,''),('sa3kh4oe4mr8d8eu9fnbpn1ja6','','PHPSESSID',1363914046,1440,''),('sb35cduh13n42ht8t43fmjl2v1','','PHPSESSID',1363793709,1440,''),('sbfn680d6fn5rfchssndicm271','','PHPSESSID',1364164912,1440,''),('sbp6gulcno68ap28vnbgbgvsc7','','PHPSESSID',1363914145,1440,''),('sbvn9sbkp25ei07h65dtam83l6','','PHPSESSID',1363489774,1440,''),('sev9a39k63chtiujcclv7kkvq0','','PHPSESSID',1363797499,1440,''),('sfm53lq4hsufqttakof8jp3vf7','','PHPSESSID',1364164440,1440,''),('siik9obvnp9t1hf627np4g6og6','','PHPSESSID',1364164764,1440,''),('sjveps94f6vhnep83j42p7p4p1','','PHPSESSID',1363656204,1440,''),('sl0fl7f9vvkq7qir92dl8fhm66','','PHPSESSID',1363913433,1440,''),('smqcq8170331rr74h0eld7do20','','PHPSESSID',1364094943,1440,''),('soh36eua7gmes1eiddngsb28u2','','PHPSESSID',1364094905,1440,''),('src6pgs43lsbrdqcbqg7clsu55','','PHPSESSID',1364094939,1440,''),('sst4v4blq7b7l127bc9emk68t4','','PHPSESSID',1363916287,1440,''),('stmljfv23ep999tj2v4le5sb07','','PHPSESSID',1364177666,1440,''),('sufdlrk9plb94jcb8obsp7vj84','','PHPSESSID',1363793326,1440,''),('sv8coh8251d08cpgbvmeorhob1','','PHPSESSID',1364177778,1440,''),('t0rqoklfhq8r92pmo08hkl7660','','PHPSESSID',1364094199,1440,''),('t130700osbf5fkf43eajhu90e0','','PHPSESSID',1364178365,1440,''),('t2aqd8n7s9sdks5mb0jbfmjn90','','PHPSESSID',1364177737,1440,''),('t5b61m1cb8nr66avnoi3ja0085','','PHPSESSID',1363793327,1440,''),('t5fikf30qtnp0kufuvkckih7o1','','PHPSESSID',1363946573,1440,''),('t76e0bjm5f0ijrfipjotku2ih4','','PHPSESSID',1364164447,1440,''),('t7k6jomt4j74ve0o6a182t3d26','','PHPSESSID',1364164427,1440,''),('tdccc3erprit7k3jubm1fittj3','','PHPSESSID',1364094948,1440,''),('tg60h1peoqqd5gq879dl02fi23','','PHPSESSID',1363946303,1440,''),('tipo86qfr0s707oep2i4qcqk93','','PHPSESSID',1363915522,1440,''),('tkk90g0fp5hjakpeo2jjohkr83','','PHPSESSID',1364164576,1440,''),('tkm8l91eadigv0nn3hgne75ni1','','PHPSESSID',1363724409,1440,''),('tp0qrf8r0uemobmb70hqc5ok22','','PHPSESSID',1364177740,1440,''),('tr1hgeeuee313u2n2tu2o3cpg2','','PHPSESSID',1363489686,1440,''),('trglrvd4g48l2u632p7h63ibl1','','PHPSESSID',1363490196,1440,''),('ttm1nn0odrseuod72uor1dca02','','PHPSESSID',1363913570,1440,''),('tukm6s1fiihcp0g6pl58ln4sj1','','PHPSESSID',1363915758,1440,''),('tvg2c0l3vs754dl1c3ql551qd4','','PHPSESSID',1363723390,1440,''),('u3in929kdd1uu492vh4kcmqcp3','','PHPSESSID',1363913439,1440,''),('u4o2f5qdrvu8hcggt0qv1f3903','','PHPSESSID',1363489685,1440,''),('u83q07efv3p37u4kqso1v5nti6','','PHPSESSID',1363914187,1440,''),('uah0aurjbo9og28oc387danek3','','PHPSESSID',1363793775,1440,''),('uakaatb3ihocvqm3cao46hqob3','','PHPSESSID',1363489604,1440,''),('uas820pesrjf8687dtmuojp505','','PHPSESSID',1363793776,1440,''),('ugatp3sa7hm979sjc9mc7b9ot4','','PHPSESSID',1363724155,1440,''),('umgrtsfe037123krihvvrc4e97','','PHPSESSID',1364094215,1440,''),('undt5app09o752trqcglrh0lg2','','PHPSESSID',1363916586,1440,''),('uoq7l4ib74d493khcg7f1r2s96','','PHPSESSID',1363946271,1440,''),('ur3475a2c21ukh1j4i2dik0796','','PHPSESSID',1363911713,1440,''),('ur9bnh5qngv23euuck2h2k06s0','','PHPSESSID',1363946411,1440,''),('urvupnatqit127fbg2vi9r2t51','','PHPSESSID',1363724302,1440,''),('uslv5qrefrshjl7hl7pn68r0r3','','PHPSESSID',1363656205,1440,''),('uu9f534k0969bkkpe0ao9kshg0','','PHPSESSID',1364094242,1440,''),('uueugekoc772859b6vcn9pbjh6','','PHPSESSID',1363916649,1440,''),('v2ugb5qsb3kckhq1i0vu1885s7','','PHPSESSID',1363724445,1440,''),('v6on1n47hoq45q8rmisjs1fbr1','','PHPSESSID',1363489687,1440,''),('vce1qiasd5hbu9hmasvob7s2q3','','PHPSESSID',1364094930,1440,''),('vdb58hddk2ks5t8fg7gq8ok3n0','','PHPSESSID',1363946575,1440,''),('ved5bbpov1ap8o6o2bkpe61jg0','','PHPSESSID',1364164878,1440,''),('veiun2gpdjognilgfp4mg3eab6','','PHPSESSID',1364094917,1440,''),('vg5u94ec1k5lvogmffh3923b92','','PHPSESSID',1364094738,1440,''),('vgdpjlcsv3meundr4n8umt1l34','','PHPSESSID',1363946355,1440,''),('vl3kjgfo2fnilupui8nsh1moo1','','PHPSESSID',1363797088,1440,''),('vlu941qrin4cmp3d4fng1rbn05','','PHPSESSID',1363916632,1440,''),('vmtk1f308dsaevnu4613a1id31','','PHPSESSID',1363489617,1440,''),('vos31k1j8f47rm85qq1dugas20','','PHPSESSID',1364177770,1440,''),('vt2sdfnfbjfl0ephnvpuepbvg0','','PHPSESSID',1363489530,1440,''),('vvcn2fo7sm8ua0fcg2vdla02j0','','PHPSESSID',1363946351,1440,''),('vvpvovia0f1i9te2unhd4lmrg3','','PHPSESSID',1363914840,1440,'');

/*Table structure for table `form_field_types` */

DROP TABLE IF EXISTS `form_field_types`;

CREATE TABLE `form_field_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `form_field_types` */

insert  into `form_field_types`(`id`,`name`,`description`,`enabled`) values (1,'Text','Allows a user to enter a single line, for example their name or email.',1),(2,'Textarea','Allows a user to enter multiple lines of text.',1);

/*Table structure for table `user_forms` */

DROP TABLE IF EXISTS `user_forms`;

CREATE TABLE `user_forms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_forms_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_forms` */

/*Table structure for table `user_settings_color_palette_colors` */

DROP TABLE IF EXISTS `user_settings_color_palette_colors`;

CREATE TABLE `user_settings_color_palette_colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `palette_id` int(11) unsigned NOT NULL,
  `color_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `r` smallint(3) NOT NULL DEFAULT '0',
  `g` smallint(3) NOT NULL DEFAULT '0',
  `b` smallint(3) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  KEY `palette_id` (`palette_id`),
  KEY `color_type_id` (`color_type_id`),
  CONSTRAINT `user_settings_color_palette_colors_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_settings_color_palette_colors_ibfk_2` FOREIGN KEY (`palette_id`) REFERENCES `designer_color_palettes` (`id`),
  CONSTRAINT `user_settings_color_palette_colors_ibfk_3` FOREIGN KEY (`color_type_id`) REFERENCES `designer_color_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_settings_color_palette_colors` */

insert  into `user_settings_color_palette_colors`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`hex`,`r`,`g`,`b`,`enabled`) values (10,1,1,1,'Black','#000000',0,0,0,1),(11,1,1,2,'Tan','#f3f1df',127,127,127,1),(12,1,1,3,'Dark grey','#666666',102,102,102,1),(13,1,2,1,'Blue','#336699',51,102,127,1),(14,1,2,2,'Dark grey','#666666',102,102,102,1),(15,1,2,3,'Grey','#999999',127,127,127,1),(16,1,3,1,'Blue','#003366',0,51,102,1),(17,1,3,2,'White','#FFFFFF',127,127,127,1),(18,1,3,3,'Green','#000000',127,127,255,1);

/*Table structure for table `user_settings_color_palettes` */

DROP TABLE IF EXISTS `user_settings_color_palettes`;

CREATE TABLE `user_settings_color_palettes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_script` char(9) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(2) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  KEY `view_script` (`view_script`),
  CONSTRAINT `user_settings_color_palettes_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_settings_color_palettes` */

insert  into `user_settings_color_palettes`(`id`,`site_id`,`name`,`view_script`,`sort_order`,`enabled`) values (1,1,'Palette 1','palette-1',1,1),(2,1,'Palette 2','palette-2',2,1),(3,1,'Palette 3','palette-3',3,1);

/*Table structure for table `user_settings_headings` */

DROP TABLE IF EXISTS `user_settings_headings`;

CREATE TABLE `user_settings_headings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `heading_id` tinyint(3) unsigned NOT NULL,
  `style_id` tinyint(3) unsigned NOT NULL,
  `weight_id` tinyint(3) unsigned NOT NULL,
  `decoration_id` tinyint(3) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `hex` char(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  KEY `style_id` (`style_id`),
  KEY `weight_id` (`weight_id`),
  KEY `decoration_id` (`decoration_id`),
  KEY `heading_id` (`heading_id`),
  CONSTRAINT `user_settings_headings_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_settings_headings_ibfk_3` FOREIGN KEY (`style_id`) REFERENCES `designer_css_text_styles` (`id`),
  CONSTRAINT `user_settings_headings_ibfk_4` FOREIGN KEY (`weight_id`) REFERENCES `designer_css_text_weights` (`id`),
  CONSTRAINT `user_settings_headings_ibfk_5` FOREIGN KEY (`decoration_id`) REFERENCES `designer_css_text_decorations` (`id`),
  CONSTRAINT `user_settings_headings_ibfk_6` FOREIGN KEY (`heading_id`) REFERENCES `designer_html_headings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_settings_headings` */

insert  into `user_settings_headings`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`hex`,`sort_order`,`enabled`) values (1,1,1,1,2,1,20,'#17365d',1,1),(2,1,2,1,2,1,18,'#366092',2,1),(3,1,3,1,2,1,16,'#366092',3,1),(4,1,4,1,2,1,14,'#366092',4,1),(5,1,5,2,2,1,14,'#366092',5,1),(6,1,6,1,1,1,12,'#366092',6,1),(7,1,7,2,1,1,12,'#366092',7,1);

/*Table structure for table `user_site_page_content` */

DROP TABLE IF EXISTS `user_site_page_content`;

CREATE TABLE `user_site_page_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `template_id` int(11) unsigned NOT NULL,
  `div_id` int(11) unsigned NOT NULL,
  `content_type` int(11) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `content_type` (`content_type`),
  KEY `sort_order` (`sort_order`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  CONSTRAINT `user_site_page_content_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `user_site_pages` (`id`),
  CONSTRAINT `user_site_page_content_ibfk_3` FOREIGN KEY (`content_type`) REFERENCES `designer_content_types` (`id`),
  CONSTRAINT `user_site_page_content_ibfk_4` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_page_content_ibfk_5` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content` */

insert  into `user_site_page_content`(`id`,`page_id`,`template_id`,`div_id`,`content_type`,`sort_order`) values (1,1,1,159,1,1),(2,1,1,159,1,2);

/*Table structure for table `user_site_page_content_text` */

DROP TABLE IF EXISTS `user_site_page_content_text`;

CREATE TABLE `user_site_page_content_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `width` int(4) unsigned NOT NULL DEFAULT '0',
  `padding` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '0',
  `title_style_id` int(11) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  KEY `title_style_id` (`title_style_id`),
  CONSTRAINT `user_site_page_content_text_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `user_site_pages` (`id`),
  CONSTRAINT `user_site_page_content_text_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_content` (`id`),
  CONSTRAINT `user_site_page_content_text_ibfk_3` FOREIGN KEY (`title_style_id`) REFERENCES `user_settings_headings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_text` */

insert  into `user_site_page_content_text`(`id`,`page_id`,`content_id`,`width`,`padding`,`title`,`show_title`,`title_style_id`,`content`) values (1,1,1,970,5,'Test content',1,1,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>'),(2,1,2,970,5,'Test content 2',1,5,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>');

/*Table structure for table `user_site_pages` */

DROP TABLE IF EXISTS `user_site_pages`;

CREATE TABLE `user_site_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `template_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  KEY `user_site_pages_ibfk_2` (`template_id`),
  CONSTRAINT `user_site_pages_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_site_pages_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_pages` */

insert  into `user_site_pages`(`id`,`site_id`,`template_id`,`name`,`title`,`enabled`) values (1,1,2,'Home page','G3D Development Limited',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_background_colors` */

insert  into `user_site_template_div_background_colors`(`id`,`template_id`,`div_id`,`hex`) values (17,1,160,'#999999'),(19,1,159,'#f3f1df'),(20,1,162,'#336699');

/*Table structure for table `user_site_template_div_borders` */

DROP TABLE IF EXISTS `user_site_template_div_borders`;

CREATE TABLE `user_site_template_div_borders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `div_id` int(11) unsigned NOT NULL,
  `position` enum('top','right','bottom','left') COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(3) unsigned NOT NULL DEFAULT '1',
  `hex` char(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  KEY `style` (`style`),
  CONSTRAINT `user_site_template_div_borders_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_div_borders_ibfk_2` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`),
  CONSTRAINT `user_site_template_div_borders_ibfk_3` FOREIGN KEY (`style`) REFERENCES `designer_css_border_styles` (`style`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_borders` */

insert  into `user_site_template_div_borders`(`id`,`template_id`,`div_id`,`position`,`style`,`width`,`hex`) values (1,1,161,'top','dashed',5,'#000000'),(2,1,161,'right','dashed',5,'#000000'),(3,1,161,'bottom','dashed',5,'#000000'),(4,1,161,'left','dashed',5,'#000000'),(5,1,163,'top','solid',1,'#000000'),(6,1,163,'right','solid',1,'#000000'),(7,1,163,'bottom','solid',1,'#000000'),(8,1,163,'left','solid',1,'#000000');

/*Table structure for table `user_site_template_div_sizes` */

DROP TABLE IF EXISTS `user_site_template_div_sizes`;

CREATE TABLE `user_site_template_div_sizes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `div_id` int(11) unsigned NOT NULL,
  `width` int(4) NOT NULL DEFAULT '0',
  `height` int(4) NOT NULL DEFAULT '0',
  `design_height` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  CONSTRAINT `user_site_template_div_sizes_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_div_sizes_ibfk_3` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_sizes` */

insert  into `user_site_template_div_sizes`(`id`,`template_id`,`div_id`,`width`,`height`,`design_height`) values (158,1,158,980,0,190),(159,1,159,980,0,380),(160,1,160,140,0,190),(161,1,161,830,0,180),(162,1,162,140,0,380),(163,1,163,838,0,378);

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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_divs` */

insert  into `user_site_template_divs`(`id`,`site_id`,`template_id`,`parent_id`,`sort_order`) values (158,1,1,0,1),(159,1,1,0,2),(160,1,1,158,1),(161,1,1,158,2),(162,1,1,159,1),(163,1,1,159,2);

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
