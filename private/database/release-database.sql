/*
SQLyog Enterprise v12.2.1 (64 bit)
MySQL - 5.6.25 : Database - dlayer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `designer_color_palette` */

CREATE TABLE `designer_color_palette` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_script` char(9) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palette` */

insert  into `designer_color_palette`(`id`,`name`,`view_script`) values (1,'Palette 1','palette-1');
insert  into `designer_color_palette`(`id`,`name`,`view_script`) values (2,'Palette 2','palette-2');

/*Table structure for table `designer_color_palette_color` */

CREATE TABLE `designer_color_palette_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `palette_id` int(11) unsigned NOT NULL,
  `color_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `palette_id` (`palette_id`),
  KEY `color_type_id` (`color_type_id`),
  CONSTRAINT `designer_color_palette_color_ibfk_1` FOREIGN KEY (`palette_id`) REFERENCES `designer_color_palette` (`id`),
  CONSTRAINT `designer_color_palette_color_ibfk_2` FOREIGN KEY (`color_type_id`) REFERENCES `designer_color_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palette_color` */

insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (1,1,1,'Black','#000000');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (2,1,2,'Dark grey','#333333');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (3,1,3,'Grey','#555555');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (4,1,4,'Light grey','#777777');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (5,1,5,'Off white','#EEEEEE');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (6,2,1,'Blue','#337ab7');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (7,2,2,'Green','#5cb85c');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (8,2,3,'Light blue','#5bc0de');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (9,2,4,'Amber','#f0ad4e');
insert  into `designer_color_palette_color`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (10,2,5,'Red','#d9534f');

/*Table structure for table `designer_color_type` */

CREATE TABLE `designer_color_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_type` */

insert  into `designer_color_type`(`id`,`type`) values (1,'Primary');
insert  into `designer_color_type`(`id`,`type`) values (2,'Secondary');
insert  into `designer_color_type`(`id`,`type`) values (3,'Tertiary');
insert  into `designer_color_type`(`id`,`type`) values (4,'Quaternary');
insert  into `designer_color_type`(`id`,`type`) values (5,'Quinary');

/*Table structure for table `designer_content_heading` */

CREATE TABLE `designer_content_heading` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_content_heading` */

insert  into `designer_content_heading`(`id`,`name`,`tag`,`sort_order`) values (1,'Page title','h1',1);
insert  into `designer_content_heading`(`id`,`name`,`tag`,`sort_order`) values (2,'Content heading 1','h2',2);
insert  into `designer_content_heading`(`id`,`name`,`tag`,`sort_order`) values (3,'Content heading 2','h3',3);
insert  into `designer_content_heading`(`id`,`name`,`tag`,`sort_order`) values (4,'Content heading 3','h4',4);
insert  into `designer_content_heading`(`id`,`name`,`tag`,`sort_order`) values (5,'Content heading 4','h5',5);
insert  into `designer_content_heading`(`id`,`name`,`tag`,`sort_order`) values (6,'Content heading 5','h6',6);

/*Table structure for table `designer_content_type` */

CREATE TABLE `designer_content_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tool_id` (`tool_id`),
  CONSTRAINT `designer_content_type_ibfk_1` FOREIGN KEY (`tool_id`) REFERENCES `dlayer_module_tool` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_content_type` */

insert  into `designer_content_type`(`id`,`name`,`description`,`tool_id`) values (1,'text','Text block',10);
insert  into `designer_content_type`(`id`,`name`,`description`,`tool_id`) values (2,'heading','Heading',11);
insert  into `designer_content_type`(`id`,`name`,`description`,`tool_id`) values (3,'form','Form',16);
insert  into `designer_content_type`(`id`,`name`,`description`,`tool_id`) values (4,'jumbotron','Jumbotron',34);
insert  into `designer_content_type`(`id`,`name`,`description`,`tool_id`) values (5,'image','Image',39);

/*Table structure for table `designer_css_border_style` */

CREATE TABLE `designer_css_border_style` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `style` (`style`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Border styles that can be used within the designers';

/*Data for the table `designer_css_border_style` */

insert  into `designer_css_border_style`(`id`,`name`,`style`,`sort_order`) values (1,'Solid','solid',2);
insert  into `designer_css_border_style`(`id`,`name`,`style`,`sort_order`) values (2,'Dashed','dashed',3);
insert  into `designer_css_border_style`(`id`,`name`,`style`,`sort_order`) values (3,'No border','none',1);

/*Table structure for table `designer_css_font_family` */

CREATE TABLE `designer_css_font_family` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_font_family` */

insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (1,'Helvetica','Helvetica Neue, Helvetica, Arial','\"Helvetica Neue\", Helvetica, Arial, sans-serif',1);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (2,'Lucida Grande','Lucida Grande, Lucida Sans Unicode, Bitstream Vera Sans','\"Lucida Grande\", \"Lucida Sans Unicode\", \"Bitstream Vera Sans\", sans-serif',2);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (3,'Georgia','Georgia, URW Bookman L','Georgia, \"URW Bookman L\", serif',3);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (4,'Corbel','Corbel, Arial, Helvetica, Nimbus Sans L, Liberation Sans','Corbel, Arial, Helvetica, \"Nimbus Sans L\", \"Liberation Sans\", sans-serif',4);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (5,'Code','Consolas, Bitstream Vera Sans Mono, Andale Mono, Monaco, Lucida Console','Consolas, \"Bitstream Vera Sans Mono\", \"Andale Mono\", Monaco, \"Lucida Console\", monospace',5);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (6,'Verdana','Verdana, Geneva','Verdana, Geneva, sans-serif',6);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (7,'Tahoma','Tahoma, Geneva','Tahoma, Geneva, sans-serif',7);
insert  into `designer_css_font_family`(`id`,`name`,`description`,`css`,`sort_order`) values (8,'Segoe','Segoe UI, Helvetica, Arial, Sans-Serif;','\"Segoe UI\", Helvetica, Arial, \"Sans-Serif\"',8);

/*Table structure for table `designer_css_text_decoration` */

CREATE TABLE `designer_css_text_decoration` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_decoration` */

insert  into `designer_css_text_decoration`(`id`,`name`,`css`,`sort_order`) values (1,'None','none',1);
insert  into `designer_css_text_decoration`(`id`,`name`,`css`,`sort_order`) values (2,'Underline','underline',2);
insert  into `designer_css_text_decoration`(`id`,`name`,`css`,`sort_order`) values (3,'Strike-through','line-through',3);

/*Table structure for table `designer_css_text_style` */

CREATE TABLE `designer_css_text_style` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_style` */

insert  into `designer_css_text_style`(`id`,`name`,`css`,`sort_order`) values (1,'Normal','normal',1);
insert  into `designer_css_text_style`(`id`,`name`,`css`,`sort_order`) values (2,'Italic','italic',2);
insert  into `designer_css_text_style`(`id`,`name`,`css`,`sort_order`) values (3,'Oblique','oblique',3);

/*Table structure for table `designer_css_text_weight` */

CREATE TABLE `designer_css_text_weight` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_weight` */

insert  into `designer_css_text_weight`(`id`,`name`,`css`,`sort_order`) values (1,'Normal','400',1);
insert  into `designer_css_text_weight`(`id`,`name`,`css`,`sort_order`) values (2,'Bold','700',3);
insert  into `designer_css_text_weight`(`id`,`name`,`css`,`sort_order`) values (3,'Light','100',4);
insert  into `designer_css_text_weight`(`id`,`name`,`css`,`sort_order`) values (4,'Light bold','500',2);

/*Table structure for table `designer_form_field_attribute` */

CREATE TABLE `designer_form_field_attribute` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `field_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_type_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_type_id` (`field_type_id`),
  KEY `attribute_type_id` (`attribute_type_id`),
  CONSTRAINT `designer_form_field_attribute_ibfk_1` FOREIGN KEY (`field_type_id`) REFERENCES `designer_form_field_type` (`id`),
  CONSTRAINT `designer_form_field_attribute_ibfk_2` FOREIGN KEY (`attribute_type_id`) REFERENCES `designer_form_field_attribute_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_form_field_attribute` */

insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (1,1,'Size','size',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (2,1,'Max length','maxlength',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (3,2,'Columns','cols',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (4,2,'Rows','rows',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (5,3,'Size','size',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (6,3,'Max length','maxlength',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (7,1,'Placeholder','placeholder',2);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (8,2,'Placeholder','placeholder',2);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (9,3,'Placeholder','placeholder',2);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (10,4,'Size','size',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (11,4,'Max length','maxlength',1);
insert  into `designer_form_field_attribute`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (12,4,'Placeholder','placeholder',2);

/*Table structure for table `designer_form_field_attribute_type` */

CREATE TABLE `designer_form_field_attribute_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_form_field_attribute_type` */

insert  into `designer_form_field_attribute_type`(`id`,`name`,`type`) values (1,'Integer','integer');
insert  into `designer_form_field_attribute_type`(`id`,`name`,`type`) values (2,'String','string');

/*Table structure for table `designer_form_field_param_preview` */

CREATE TABLE `designer_form_field_param_preview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_type_id` tinyint(3) unsigned NOT NULL,
  `field_attribute_id` tinyint(3) unsigned NOT NULL,
  `preview_method_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_attribute_id` (`field_attribute_id`),
  KEY `preview_method_id` (`preview_method_id`),
  KEY `designer_form_field_param_previews_ibfk_1` (`field_type_id`),
  CONSTRAINT `designer_form_field_param_preview_ibfk_1` FOREIGN KEY (`field_type_id`) REFERENCES `designer_form_field_type` (`id`),
  CONSTRAINT `designer_form_field_param_preview_ibfk_2` FOREIGN KEY (`field_attribute_id`) REFERENCES `designer_form_field_attribute` (`id`),
  CONSTRAINT `designer_form_field_param_preview_ibfk_3` FOREIGN KEY (`preview_method_id`) REFERENCES `designer_form_preview_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_form_field_param_preview` */

insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (1,1,1,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (2,1,2,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (3,1,7,1);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (4,2,3,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (5,2,4,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (6,2,8,1);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (7,3,5,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (8,3,6,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (9,3,9,1);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (10,4,10,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (11,4,11,3);
insert  into `designer_form_field_param_preview`(`id`,`field_type_id`,`field_attribute_id`,`preview_method_id`) values (12,4,12,1);

/*Table structure for table `designer_form_field_type` */

CREATE TABLE `designer_form_field_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_form_field_type` */

insert  into `designer_form_field_type`(`id`,`name`,`type`,`description`) values (1,'Text','text','A single line field');
insert  into `designer_form_field_type`(`id`,`name`,`type`,`description`) values (2,'Textarea','textarea','A multiple line field');
insert  into `designer_form_field_type`(`id`,`name`,`type`,`description`) values (3,'Password','password','A password field');
insert  into `designer_form_field_type`(`id`,`name`,`type`,`description`) values (4,'Email','email','Email field');

/*Table structure for table `designer_form_layout` */

CREATE TABLE `designer_form_layout` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_form_layout` */

insert  into `designer_form_layout`(`id`,`layout`,`class`) values (1,'Standard','form');
insert  into `designer_form_layout`(`id`,`layout`,`class`) values (2,'Inline','form-inline');
insert  into `designer_form_layout`(`id`,`layout`,`class`) values (3,'Horizontal','form-horizontal');

/*Table structure for table `designer_form_preview_method` */

CREATE TABLE `designer_form_preview_method` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_form_preview_method` */

insert  into `designer_form_preview_method`(`id`,`method`) values (1,'field_attribute_string');
insert  into `designer_form_preview_method`(`id`,`method`) values (2,'row_attribute');
insert  into `designer_form_preview_method`(`id`,`method`) values (3,'field_attribute_integer');

/*Table structure for table `dlayer_identity` */

CREATE TABLE `dlayer_identity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identity` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logged_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_action` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`identity`),
  KEY `enabled` (`enabled`),
  KEY `logged_in` (`logged_in`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_identity` */

insert  into `dlayer_identity`(`id`,`identity`,`credentials`,`logged_in`,`last_login`,`last_action`,`enabled`) values (1,'user-1@dlayer.com','$6$rounds=5000$jks453yuyt55d$CZJCjaieFQghQ6MwQ1OUI5nVKDy/Fi2YXk7MyW2hcex9AdJ/jvZA8ulvjzK1lo3rRVFfmd10lgjqAbDQM4ehR1',0,'2016-06-06 16:01:55','2016-06-06 16:09:13',1);
insert  into `dlayer_identity`(`id`,`identity`,`credentials`,`logged_in`,`last_login`,`last_action`,`enabled`) values (2,'user-2@dlayer.com','$6$rounds=5000$jks453yuyt55d$ZVEJgs2kNjxOxNEayqqoh2oJUiGbmxIKRqOTxVM05MP2YRcAjE9adCZfQBWCc.qe1nDjEM9.ioivNz3c/qyZ80',0,'2015-05-29 15:57:54','2015-05-29 15:58:47',1);
insert  into `dlayer_identity`(`id`,`identity`,`credentials`,`logged_in`,`last_login`,`last_action`,`enabled`) values (3,'user-3@dlayer.com','$6$rounds=5000$jks453yuyt55d$NYF6yCvxXplefx7nr8vDe4cUGBEFtd3G5vuJ2utfqvPwEf3dSgNXNTcGbFO6WrJSn21CXHgZwNOQHy691E/Rm.',0,'2015-05-29 15:59:10','2015-05-29 16:25:10',1);

/*Table structure for table `dlayer_module` */

CREATE TABLE `dlayer_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module` */

insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (1,'template','Template designer','The Template designer lets you create page templates',7,0);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (2,'widget','Widget designer','The Widget designer lets you to develop reusable content items',4,0);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (3,'form','Form builder','The Form builder lets you build web forms',2,1);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (4,'content','Content manager','The Content manager lets you create and manage all your site content',1,0);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (5,'website','Web site manager (Preview)','The Web site manager lets you manage the relationships between all your site pages and data',5,1);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (6,'question','Question manager','Create quizzes, tests and polls. <span class=\"label label-default\">Planning</span>',99,0);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (7,'dlayer','Dlayer','Home',0,1);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (8,'image','Image library','Your Image and Media library',6,1);
insert  into `dlayer_module`(`id`,`name`,`title`,`description`,`sort_order`,`enabled`) values (9,'data','Data manager','The Data manager lets you design datasets and then manage your data',3,0);

/*Table structure for table `dlayer_module_tool` */

CREATE TABLE `dlayer_module_tool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tool` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tool name to use through code',
  `tool_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tool process model',
  `folder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folder for tool tab ciew scripts',
  `base` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Can tool run on base div',
  `destructive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Group within toolbar',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Sort order within group',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tool` (`module_id`,`tool`),
  KEY `group_id` (`group_id`),
  KEY `sort_order` (`sort_order`),
  KEY `destructive` (`destructive`),
  CONSTRAINT `dlayer_module_tool_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tool` */

insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (1,1,'Cancel','cancel',NULL,'cancel',1,0,1,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (2,1,'Create rows','split-horizontal','SplitHorizontal','split-horizontal',1,1,2,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (3,1,'Split vertical','split-vertical','SplitVertical','split-vertical',1,1,2,2,0);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (6,1,'Resize','resize','Resize','resize',0,1,2,3,0);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (7,1,'Background colour','background-color','BackgroundColor','background-color',1,0,3,1,0);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (8,1,'Border','border','Border','border',1,0,3,2,0);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (9,4,'Cancel','cancel',NULL,'cancel',2,0,1,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (10,4,'Text','text','Text','text',0,0,3,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (11,4,'Heading','heading','Heading','heading',0,0,3,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (12,3,'Text','text','Text','text',0,0,4,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (13,3,'Text area','textarea','Textarea','textarea',0,0,4,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (14,3,'Cancel','cancel',NULL,'cancel',2,0,1,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (15,3,'Password','password','Password','password',0,0,4,4,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (16,4,'Form','import-form','ImportForm','import-form',0,0,3,4,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (17,5,'Cancel','cancel',NULL,'cancel',0,0,1,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (18,5,'New page','new-page','NewPage','new-page',0,0,2,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (19,5,'Move page','move-page','MovePage','move-page',0,0,2,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (20,3,'Email','preset-email','Email','preset-email',0,0,3,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (21,3,'Name','preset-name','Text','preset-name',0,0,3,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (22,4,'Text','import-text','ImportText','import-text',0,0,4,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (23,4,'Heading','import-heading','ImportHeading','import-heading',0,0,4,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (25,8,'Add image to library','add','Add','add',1,0,2,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (26,8,'Cancel / Back to library','cancel',NULL,'cancel',0,0,1,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (27,8,'Categories','category','Category','category',1,0,3,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (28,8,'Sub categories','subcategory','Subcategory','subcategory',1,0,3,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (29,8,'Clone image','copy','Copy','copy',0,0,4,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (30,8,'Crop image','crop','Crop','crop',0,0,4,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (31,8,'Edit image','edit','Edit','edit',0,0,4,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (32,4,'Add content row(s)','add-content-row','AddContentRow','add-content-row',1,0,2,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (34,4,'Jumbotron','jumbotron','Jumbotron','jumbotron',0,0,3,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (35,4,'Jumbotron','import-jumbotron','ImportJumbotron','import-jumbotron',0,0,4,4,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (36,4,'Move row','move-row','MoveRow','move-row',1,0,2,5,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (37,4,'Move item','move-item','MoveItem','move-item',1,0,2,6,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (38,4,'Content row','content-row','ContentRow','content-row',1,0,2,4,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (39,4,'Image','image','Image','image',0,0,3,5,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (40,4,'Carousel','carousel','ImageCarousel','carousel',0,0,3,6,0);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (41,4,'Select parent','select','Select','select',1,0,2,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (42,3,'Layout','form-layout','FormLayout','form-layout',1,0,2,1,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (43,3,'Actions','form-actions','formActions','form-actions',1,0,2,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (44,3,'Options','form-settings','FormSettings','form-settings',1,0,2,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (45,3,'Email','email','Email','email',0,0,4,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (46,4,'Content area','content-area','ContentArea','content-area',1,0,2,2,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (47,3,'Comment','preset-comment','Textarea','preset-comment',0,0,3,3,1);
insert  into `dlayer_module_tool`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`base`,`destructive`,`group_id`,`sort_order`,`enabled`) values (48,3,'Password','preset-password','Password','preset-password',0,0,3,4,1);

/*Table structure for table `dlayer_module_tool_tab` */

CREATE TABLE `dlayer_module_tool_tab` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(2) unsigned NOT NULL,
  `tool_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_script` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_tool_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `glyph` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multi_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `edit_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tool_tab` (`tool_id`,`view_script`),
  KEY `name` (`name`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `dlayer_module_tool_tab_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_module` (`id`),
  CONSTRAINT `dlayer_module_tool_tab_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `dlayer_module_tool` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tool_tab` */

insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (1,1,2,'Quick','quick',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (2,1,2,'Custom','advanced',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (3,1,2,'?','help',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (4,1,3,'Quick','quick',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (5,1,3,'Mouse','advanced',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (6,1,3,'?','help',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (7,1,7,'#1','palette-1',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (8,1,7,'#2','palette-2',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (9,1,7,'#3','palette-3',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (10,1,7,'Custom','advanced',NULL,NULL,0,0,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (11,1,7,'?','help',NULL,NULL,0,0,0,5,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (12,1,6,'Custom','advanced',NULL,NULL,0,0,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (14,1,6,'?','help',NULL,NULL,0,0,0,5,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (15,1,6,'Push','expand',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (16,1,6,'Pull','contract',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (17,1,6,'Height','height',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (20,1,8,'Custom','advanced',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (21,1,8,'?','help',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (22,1,8,'Full border','full',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (23,4,10,'Text','text',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (24,4,11,'Heading','heading',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (25,4,10,'Help','help',NULL,NULL,0,0,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (26,4,11,'Help','help',NULL,NULL,0,0,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (27,3,12,'Field','text',NULL,'pencil',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (28,3,12,'Help','help',NULL,'info-sign',0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (29,3,13,'Field','textarea',NULL,'pencil',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (30,3,13,'Help','help',NULL,'info-sign',0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (31,3,15,'Field','password',NULL,'pencil',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (32,3,15,'Help','help',NULL,'info-sign',0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (33,4,16,'Form','import-form',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (34,4,16,'Help','help',NULL,NULL,0,0,0,5,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (35,5,18,'Page','new-page',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (36,5,18,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (37,5,19,'Page','move-page',NULL,'transfer',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (38,5,19,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (39,4,10,'Styles','styling','Styling_Text',NULL,1,1,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (40,4,11,'Styles','styling','Styling_Heading',NULL,1,1,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (41,4,16,'Styles','styling','Styling_ImportForm',NULL,1,1,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (42,3,20,'Field','preset-email',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (43,3,20,'Help','help',NULL,'info-sign',0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (44,3,21,'Field','preset-name',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (45,3,21,'Help','help',NULL,'info-sign',0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (46,4,16,'Size & position','position','Position_ImportForm',NULL,1,1,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (47,4,10,'Size & position','position','Position_Text',NULL,1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (48,4,11,'Size & position','position','Position_Heading',NULL,1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (49,3,12,'Styling','styling','Styling_Text','tint',1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (50,3,13,'Styling','styling','Styling_Textarea','tint',1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (51,3,15,'Styling','styling','Styling_Password','tint',1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (54,4,16,'Edit in Form builder','edit',NULL,NULL,0,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (55,4,22,'Import','import-text',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (56,4,22,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (57,4,23,'Import','import-heading',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (58,4,23,'Help','help',NULL,NULL,0,0,2,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (61,8,25,'Image','add',NULL,'upload',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (62,8,25,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (63,8,27,'Category','category',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (64,8,27,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (65,8,28,'Sub Category','subcategory',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (66,8,28,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (67,8,29,'Clone image','copy',NULL,'copy',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (68,8,29,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (69,8,30,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (70,8,31,'Edit image','edit',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (71,8,31,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (72,8,30,'Crop image','crop',NULL,'resize-small',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (73,4,32,'Row','add-content-row',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (74,4,32,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (77,4,34,'Jumbotron','jumbotron',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (78,4,34,'Help','help',NULL,NULL,0,0,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (79,4,34,'Styles','styling','Styling_Jumbotron',NULL,1,1,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (80,4,34,'Size & position','position','Position_Jumbotron',NULL,1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (81,4,35,'Import','import-jumbotron',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (82,4,35,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (83,4,36,'Move','move-row',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (84,4,36,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (85,4,37,'Move','move-item',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (86,4,37,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (87,4,38,'Row','content-row',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (88,4,38,'Styles','styling','Styling_ContentRow',NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (89,4,39,'Image','image',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (90,4,39,'Help','help',NULL,NULL,0,0,0,4,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (91,4,40,'Carousel','carousel',NULL,NULL,1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (92,4,40,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (93,4,39,'Size & position','position','Position_Image',NULL,1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (94,4,39,'Styles','styling','Styling_Image',NULL,1,1,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (95,4,41,'Select','select',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (96,4,41,'Help','help',NULL,NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (97,3,42,'Layout','form-layout',NULL,'wrench',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (98,3,42,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (99,3,45,'Field','email',NULL,'pencil',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (100,3,45,'Help','help',NULL,'info-sign',0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (101,3,45,'Styling','styling','Styling_Email','tint',1,1,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (102,3,43,'Actions','form-actions',NULL,'wrench',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (103,3,43,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (104,3,44,'Options','form-settings',NULL,'wrench',1,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (105,3,44,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (106,4,38,'Help','help',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (107,4,46,'Area','content-area',NULL,NULL,0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (108,4,46,'Styles','styling','Styling_ContentArea',NULL,0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (109,4,46,'Help','help',NULL,NULL,0,0,0,3,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (110,3,47,'Field','preset-comment',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (111,3,47,'Help','help',NULL,'info-sign',0,0,0,2,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (112,3,48,'Field','preset-password',NULL,'pencil',0,0,1,1,1);
insert  into `dlayer_module_tool_tab`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`sub_tool_model`,`glyph`,`multi_use`,`edit_mode`,`default`,`sort_order`,`enabled`) values (113,3,48,'Help','help',NULL,'info-sign',0,0,0,2,1);

/*Table structure for table `dlayer_session` */

CREATE TABLE `dlayer_session` (
  `session_id` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `save_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`,`save_path`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_session` */

insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('0jc3741u0asl8l2jkusfmcdmu2','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1464443702,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1464447301;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('1sfigj3q216bcv47dt4683mo57','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458322082,3601,'__ZF|a:2:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458325682;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1458325682;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:4:\"form\";}dlayer_session_form|a:6:{s:7:\"form_id\";i:1;s:8:\"field_id\";i:2;s:4:\"tool\";s:5:\"email\";s:3:\"tab\";s:7:\"styling\";s:6:\"return\";N;s:10:\"tool_model\";s:5:\"Email\";}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('30otermdbre3migtp5jml666g2','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1464077056,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1464080656;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('38tgd1v43mmnvs0qt0b80769c6','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1463923416,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1463927015;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('3u6ucr97de8vfeelpbu229dkd0','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458768722,3601,'__ZF|a:4:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458772322;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1458772319;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1458772322;}s:23:\"dlayer_session_designer\";a:1:{s:3:\"ENT\";i:1458772322;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:7:\"content\";}dlayer_session_form|a:5:{s:7:\"form_id\";i:1;s:8:\"field_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:6:\"return\";N;}dlayer_session_content|a:7:{s:7:\"page_id\";i:1;s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:11:\"template_id\";i:1;}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('43u3i2h735m548vl0tbr21r8s7','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1465225758,3601,'__ZF|a:5:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1465229358;}s:20:\"dlayer_session_image\";a:1:{s:3:\"ENT\";i:1465229358;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1465229358;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1465229358;}s:23:\"dlayer_session_designer\";a:1:{s:3:\"ENT\";i:1465229358;}}dlayer_session_image|a:8:{s:9:\"edit_mode\";i:1;s:9:\"image_ids\";a:0:{}s:4:\"sort\";N;s:10:\"sort_order\";N;s:4:\"tool\";N;s:10:\"tool_model\";s:8:\"Category\";s:16:\"tool_destructive\";s:1:\"0\";s:3:\"tab\";N;}dlayer_session_content|a:6:{s:7:\"page_id\";N;s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;}dlayer_session_form|a:5:{s:7:\"form_id\";N;s:8:\"field_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:6:\"return\";N;}dlayer_session_designer|a:4:{s:24:\"image_picker_category_id\";N;s:28:\"image_picker_sub_category_id\";N;s:21:\"image_picker_image_id\";N;s:23:\"image_picker_version_id\";N;}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('5bp20cckohk2hpjc78lpc50mn3','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1461597646,3601,'__ZF|a:4:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1461601246;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1461601246;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1461600750;}s:23:\"dlayer_session_designer\";a:1:{s:3:\"ENT\";i:1461601246;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:7:\"content\";}dlayer_session_content|a:8:{s:7:\"page_id\";i:1;s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:11:\"template_id\";i:1;s:10:\"tool_model\";s:7:\"Heading\";}dlayer_session_form|a:6:{s:7:\"form_id\";i:1;s:8:\"field_id\";i:2;s:4:\"tool\";s:5:\"email\";s:3:\"tab\";s:5:\"email\";s:6:\"return\";N;s:10:\"tool_model\";s:5:\"Email\";}dlayer_session_designer|a:4:{s:24:\"image_picker_category_id\";N;s:28:\"image_picker_sub_category_id\";N;s:21:\"image_picker_image_id\";N;s:23:\"image_picker_version_id\";N;}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('6dosotk67riqfc3qfmj25tpft6','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1464445965,3601,'__ZF|a:6:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1464449565;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1464449565;}s:22:\"dlayer_session_website\";a:1:{s:3:\"ENT\";i:1464449563;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1464449565;}s:20:\"dlayer_session_image\";a:1:{s:3:\"ENT\";i:1464449565;}s:23:\"dlayer_session_designer\";a:1:{s:3:\"ENT\";i:1464449565;}}dlayer_session_form|a:6:{s:7:\"form_id\";N;s:8:\"field_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:6:\"return\";N;s:10:\"tool_model\";s:5:\"Email\";}dlayer_session_website|a:2:{s:7:\"page_id\";N;s:4:\"tool\";N;}dlayer_session_content|a:6:{s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:7:\"page_id\";N;}dlayer_session_designer|a:4:{s:24:\"image_picker_category_id\";N;s:28:\"image_picker_sub_category_id\";N;s:21:\"image_picker_image_id\";N;s:23:\"image_picker_version_id\";N;}dlayer_session_image|a:8:{s:4:\"tool\";N;s:3:\"tab\";N;s:9:\"image_ids\";a:0:{}s:9:\"edit_mode\";i:1;s:4:\"sort\";N;s:10:\"sort_order\";N;s:10:\"tool_model\";s:8:\"Category\";s:16:\"tool_destructive\";s:1:\"0\";}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('74dkqhpuj9ckvrfc06fjsrlrm3','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1463929207,3601,'__ZF|a:2:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1463932807;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1463932807;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:7:\"content\";}dlayer_session_content|a:7:{s:7:\"page_id\";i:4;s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:11:\"template_id\";N;}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('79u8bg5croboipj35sv19hilr3','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1463842357,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1463845957;}}dlayer_session|a:2:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('96rigape9pmohag4tt750853b1','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458840952,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458844552;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('dj496elnn6ijmf88ea154r8fm4','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458033763,3601,'__ZF|a:2:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458037363;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1458037363;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:4:\"form\";}dlayer_session_form|a:6:{s:7:\"form_id\";i:1;s:8:\"field_id\";N;s:4:\"tool\";s:11:\"form-layout\";s:3:\"tab\";s:4:\"help\";s:6:\"return\";N;s:10:\"tool_model\";s:10:\"FormLayout\";}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('h3otk1s2arvgh9u27hkbd7cu71','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458490035,3601,'__ZF|a:7:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458493635;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1458493442;}s:22:\"dlayer_session_website\";a:1:{s:3:\"ENT\";i:1458493408;}s:23:\"dlayer_session_template\";a:1:{s:3:\"ENT\";i:1458493442;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1458493442;}s:20:\"dlayer_session_image\";a:1:{s:3:\"ENT\";i:1458493442;}s:23:\"dlayer_session_designer\";a:1:{s:3:\"ENT\";i:1458493442;}}dlayer_session_form|a:6:{s:7:\"form_id\";N;s:8:\"field_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:6:\"return\";N;s:10:\"tool_model\";s:5:\"Email\";}dlayer_session_website|a:2:{s:7:\"page_id\";N;s:4:\"tool\";N;}dlayer_session_template|a:4:{s:6:\"div_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:11:\"template_id\";N;}dlayer_session_content|a:7:{s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:7:\"page_id\";N;s:11:\"template_id\";N;}dlayer_session_designer|a:4:{s:24:\"image_picker_category_id\";N;s:28:\"image_picker_sub_category_id\";N;s:21:\"image_picker_image_id\";N;s:23:\"image_picker_version_id\";N;}dlayer_session_image|a:3:{s:4:\"tool\";N;s:3:\"tab\";N;s:9:\"image_ids\";a:0:{}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('hqe8fbsvkc7cbb0o47p0ejv3d0','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1465225162,3601,'__ZF|a:3:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1465228762;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1465228454;}s:22:\"dlayer_session_website\";a:1:{s:3:\"ENT\";i:1465228762;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:7:\"website\";}dlayer_session_form|a:6:{s:7:\"form_id\";i:1;s:8:\"field_id\";N;s:4:\"tool\";s:13:\"form-settings\";s:3:\"tab\";s:4:\"help\";s:6:\"return\";N;s:10:\"tool_model\";s:12:\"FormSettings\";}dlayer_session_website|a:5:{s:7:\"page_id\";N;s:4:\"tool\";s:8:\"new-page\";s:10:\"tool_model\";s:7:\"NewPage\";s:16:\"tool_destructive\";s:1:\"0\";s:3:\"tab\";s:8:\"new-page\";}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('ked7qa7jd05frq3jqcrlipl435','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1464302334,3601,'__ZF|a:3:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1464305934;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1464305930;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1464305934;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:4:\"form\";}dlayer_session_content|a:6:{s:7:\"page_id\";i:3;s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;}dlayer_session_form|a:1:{s:7:\"form_id\";N;}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('kic9g1f4a3fsf72n06jco9kkv2','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1459355643,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1459359242;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('kp0a7qf7rk30ump6a29a9mi1g4','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1463761833,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1463765432;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('l3tkb3e6ecor3l1anao60qt9c4','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1465038452,3601,'__ZF|a:2:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1465042052;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1465042052;}}dlayer_session|a:3:{s:11:\"identity_id\";i:1;s:7:\"site_id\";i:1;s:6:\"module\";s:4:\"form\";}dlayer_session_form|a:6:{s:7:\"form_id\";i:1;s:8:\"field_id\";i:9;s:4:\"tool\";s:8:\"password\";s:3:\"tab\";s:8:\"password\";s:6:\"return\";N;s:10:\"tool_model\";s:8:\"Password\";}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('lqf2c01ipahljt5te3b7e3j8a3','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1463842350,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1463845950;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('qils08vu6he9apqgd390bfs876','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458760883,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458764482;}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('r85hra1csep8hk2819j9iqoh30','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458603915,3601,'__ZF|a:6:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458607515;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1458607515;}s:23:\"dlayer_session_designer\";a:1:{s:3:\"ENT\";i:1458607515;}s:23:\"dlayer_session_template\";a:1:{s:3:\"ENT\";i:1458607515;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1458607515;}s:20:\"dlayer_session_image\";a:1:{s:3:\"ENT\";i:1458607515;}}dlayer_session_content|a:7:{s:7:\"page_id\";N;s:6:\"div_id\";N;s:14:\"content_row_id\";N;s:10:\"content_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:11:\"template_id\";N;}dlayer_session_template|a:4:{s:6:\"div_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:11:\"template_id\";N;}dlayer_session_form|a:5:{s:8:\"field_id\";N;s:4:\"tool\";N;s:3:\"tab\";N;s:7:\"form_id\";N;s:6:\"return\";N;}dlayer_session_designer|a:4:{s:24:\"image_picker_category_id\";N;s:28:\"image_picker_sub_category_id\";N;s:21:\"image_picker_image_id\";N;s:23:\"image_picker_version_id\";N;}dlayer_session_image|a:3:{s:4:\"tool\";N;s:3:\"tab\";N;s:9:\"image_ids\";a:0:{}}');
insert  into `dlayer_session`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('re5dpo398i9n94sgeas6tpq8j5','C:\\Users\\g3d\\Documents\\Xampp\\tmp','PHPSESSID',1458603794,3601,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1458607393;}}');

/*Table structure for table `dlayer_setting` */

CREATE TABLE `dlayer_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_group_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` tinyint(3) unsigned NOT NULL,
  `scope_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_group_id` (`setting_group_id`,`name`),
  UNIQUE KEY `url` (`url`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`),
  KEY `scope_id` (`scope_id`),
  CONSTRAINT `dlayer_setting_ibfk_1` FOREIGN KEY (`setting_group_id`) REFERENCES `dlayer_setting_group` (`id`),
  CONSTRAINT `dlayer_setting_ibfk_2` FOREIGN KEY (`scope_id`) REFERENCES `dlayer_setting_scope` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_setting` */

insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (1,1,'Colour palettes','Colour palettes','<p>You can define three colour palettes for each of your web sites, the colours you define here will be shown anytime you need a tool that requires you to choose a colour.</p>\r\n\r\n<p>You will always be able to choose a colour that is not in one of your three palettes, think of these as quick access.</p>','/dlayer/settings/palettes',1,'All colour pickers',2,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (2,3,'Base font family','Set the base font for all text','<p>Set the base font family for the text in the content manager, the user’s  web browser will attempt to use each of the fonts in the order they are specified until a valid font is found.</p>\r\n\r\n<p>All content unless styled otherwise will appear using the selected base font family.</p>','/content/settings/base-font-family',2,'Content module, all text',2,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (3,3,'Heading styles','Set the styles for the six heading types','<p>Define the styles for the page title and the five sub headings, H2 through H6.</p>\r\n\r\n<p>Anywhere you need to choose one of the heading types the styles defined here will be used.</p>','/content/settings/headings',3,'Heading tool',3,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (4,4,'Base font family','Set the base font for all text','<p>Set the base font family for the text in the form builder, the user’s  web browser will attempt to use each of the fonts in the order they are specified until a valid font is found.</p>\r\n\r\n<p>All content unless styled otherwise will appear using the selected base font family.</p>','/form/settings/base-font-family',2,'Forms module, all text',2,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (5,1,'Overview','Overview','<p>Settings overview.</p>','/dlayer/settings/index',1,NULL,1,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (6,2,'Overview','Overview','<p>Template designer settings overview.</p>','/template/settings/index',2,NULL,1,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (7,3,'Overview','Overview','<p>Content manager settings overview.</p>','/content/settings/index',2,NULL,1,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (8,4,'Overview','Overview','<p>Form builder settings overview.</p>','/form/settings/index',2,NULL,1,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (9,8,'Overview','Overview','<p>Image library settings overview.</p>','/image/settings/index',2,NULL,1,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (10,6,'Overview','Overview','<p>Web site manager settings overview.</p>','/website/settings/index',2,NULL,1,1);
insert  into `dlayer_setting`(`id`,`setting_group_id`,`name`,`title`,`description`,`url`,`scope_id`,`scope_details`,`sort_order`,`enabled`) values (11,5,'Overview','Overview','<p>Widget designer settings overview</p>','/widget/settings/index',2,NULL,1,1);

/*Table structure for table `dlayer_setting_group` */

CREATE TABLE `dlayer_setting_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` tinyint(3) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tab_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `dlayer_setting_group_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `dlayer_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_setting_group` */

insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (1,'App',7,'Dlayer settings','Dlayer','/dlayer/settings/index',1,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (2,'Template',1,'Template designer settings','Template designer','/template/settings/index',2,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (3,'Content',4,'Content designer settings','Content manager','/content/settings/index',3,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (4,'Form',3,'Form builder settings','Form builder','/form/settings/index',4,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (5,'Widget',2,'Widget designer settings','Widget designer','/widget/settings/index',5,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (6,'Web site',5,'Web site designer settings','Web site manager','/website/settings/index',7,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (7,'Question',6,'Question manager settings','Question manager','/question/settings/index',6,1);
insert  into `dlayer_setting_group`(`id`,`name`,`module_id`,`title`,`tab_title`,`url`,`sort_order`,`enabled`) values (8,'Image',8,'Image library settings','Image library','/image/settings/index',8,1);

/*Table structure for table `dlayer_setting_scope` */

CREATE TABLE `dlayer_setting_scope` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_setting_scope` */

insert  into `dlayer_setting_scope`(`id`,`scope`) values (1,'App');
insert  into `dlayer_setting_scope`(`id`,`scope`) values (2,'Module');
insert  into `dlayer_setting_scope`(`id`,`scope`) values (3,'Tool');

/*Table structure for table `user_setting_color_history` */

CREATE TABLE `user_setting_color_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_setting_color_history_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_setting_color_history` */

insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (1,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (2,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (3,1,'#555555');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (4,1,'#EEEEEE');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (5,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (6,2,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (7,2,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (8,2,'#555555');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (9,2,'#EEEEEE');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (10,2,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (13,3,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (14,3,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (15,3,'#555555');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (16,3,'#EEEEEE');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (17,3,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (25,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (26,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (27,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (28,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (29,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (30,2,'#5bc0de');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (31,2,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (32,3,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (33,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (34,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (35,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (36,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (37,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (38,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (39,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (40,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (41,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (42,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (43,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (44,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (45,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (46,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (47,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (48,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (49,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (50,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (51,1,'#555555');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (52,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (53,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (54,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (55,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (56,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (57,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (58,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (59,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (60,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (61,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (62,1,'#777777');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (63,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (64,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (65,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (66,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (67,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (68,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (69,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (70,1,'#d9534f');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (71,1,'#eeeeee');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (72,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (73,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (74,1,'#5bc0de');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (75,1,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (76,4,'#337ab7');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (77,4,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (78,4,'#555555');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (79,4,'#EEEEEE');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (80,4,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (81,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (82,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (83,1,'#5cb85c');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (84,1,'#5bc0de');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (85,1,'#f0ad4e');
insert  into `user_setting_color_history`(`id`,`site_id`,`color_hex`) values (86,1,'#d9534f');

/*Table structure for table `user_setting_color_palette` */

CREATE TABLE `user_setting_color_palette` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_script` char(9) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `view_script` (`view_script`),
  CONSTRAINT `user_setting_color_palette_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_setting_color_palette` */

insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (1,1,'Palette 1','palette-1',1);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (2,1,'Palette 2','palette-2',2);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (3,2,'Palette 1','palette-1',1);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (4,2,'Palette 2','palette-2',2);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (5,3,'Palette 1','palette-1',1);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (6,3,'Palette 2','palette-2',2);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (7,4,'Palette 1','palette-1',1);
insert  into `user_setting_color_palette`(`id`,`site_id`,`name`,`view_script`,`sort_order`) values (8,4,'Palette 2','palette-2',2);

/*Table structure for table `user_setting_color_palette_color` */

CREATE TABLE `user_setting_color_palette_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `palette_id` int(11) unsigned NOT NULL,
  `color_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `palette_id` (`palette_id`),
  KEY `color_type_id` (`color_type_id`),
  CONSTRAINT `user_setting_color_palette_color_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_setting_color_palette_color_ibfk_2` FOREIGN KEY (`palette_id`) REFERENCES `user_setting_color_palette` (`id`),
  CONSTRAINT `user_setting_color_palette_color_ibfk_3` FOREIGN KEY (`color_type_id`) REFERENCES `designer_color_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_setting_color_palette_color` */

insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (1,1,1,1,'Black','#000000');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (2,1,1,2,'Dark grey','#333333');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (3,1,1,3,'Grey','#555555');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (4,1,1,4,'Light grey','#777777');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (5,1,1,5,'Off white','#EEEEEE');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (6,1,2,1,'Blue','#337ab7');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (7,1,2,2,'Green','#5cb85c');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (8,1,2,3,'Light blue','#5bc0de');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (9,1,2,4,'Amber','#f0ad4e');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (10,1,2,5,'Red','#d9534f');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (11,2,3,1,'Black','#000000');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (12,2,3,2,'Dark grey','#333333');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (13,2,3,3,'Grey','#555555');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (14,2,3,4,'Light grey','#777777');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (15,2,3,5,'Off white','#EEEEEE');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (18,2,4,1,'Blue','#337ab7');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (19,2,4,2,'Green','#5cb85c');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (20,2,4,3,'Light blue','#5bc0de');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (21,2,4,4,'Amber','#f0ad4e');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (22,2,4,5,'Red','#d9534f');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (25,3,5,1,'Black','#000000');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (26,3,5,2,'Dark grey','#333333');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (27,3,5,3,'Grey','#555555');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (28,3,5,4,'Light grey','#777777');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (29,3,5,5,'Off white','#EEEEEE');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (34,3,6,3,'Light blue','#5bc0de');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (35,3,6,4,'Amber','#f0ad4e');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (36,3,6,5,'Red','#d9534f');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (37,4,7,1,'Black','#000000');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (38,4,7,3,'Dark grey','#333333');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (39,4,7,3,'Grey','#555555');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (40,4,7,4,'Light grey','#777777');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (41,4,7,5,'Off white','#EEEEEE');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (42,4,8,1,'Blue','#337ab7');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (43,4,8,3,'Green','#5cb85c');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (44,4,8,3,'Light blue','#5bc0de');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (45,4,8,4,'Amber','#f0ad4e');
insert  into `user_setting_color_palette_color`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`) values (46,4,8,5,'Red','#d9534f');

/*Table structure for table `user_setting_font_family` */

CREATE TABLE `user_setting_font_family` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `module_id` tinyint(3) unsigned NOT NULL,
  `font_family_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `module_id` (`module_id`),
  KEY `font_family_id` (`font_family_id`),
  CONSTRAINT `user_setting_font_family_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_setting_font_family_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `dlayer_module` (`id`),
  CONSTRAINT `user_setting_font_family_ibfk_3` FOREIGN KEY (`font_family_id`) REFERENCES `designer_css_font_family` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_setting_font_family` */

insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (1,1,3,8);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (2,1,4,1);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (3,2,3,1);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (4,2,4,1);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (5,3,3,1);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (6,3,4,1);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (7,4,3,1);
insert  into `user_setting_font_family`(`id`,`site_id`,`module_id`,`font_family_id`) values (8,4,4,1);

/*Table structure for table `user_setting_heading` */

CREATE TABLE `user_setting_heading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `heading_id` tinyint(3) unsigned NOT NULL,
  `style_id` tinyint(3) unsigned NOT NULL,
  `weight_id` tinyint(3) unsigned NOT NULL,
  `decoration_id` tinyint(3) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `style_id` (`style_id`),
  KEY `weight_id` (`weight_id`),
  KEY `decoration_id` (`decoration_id`),
  KEY `heading_id` (`heading_id`),
  CONSTRAINT `user_setting_heading_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_setting_heading_ibfk_3` FOREIGN KEY (`style_id`) REFERENCES `designer_css_text_style` (`id`),
  CONSTRAINT `user_setting_heading_ibfk_4` FOREIGN KEY (`weight_id`) REFERENCES `designer_css_text_weight` (`id`),
  CONSTRAINT `user_setting_heading_ibfk_5` FOREIGN KEY (`decoration_id`) REFERENCES `designer_css_text_decoration` (`id`),
  CONSTRAINT `user_setting_heading_ibfk_6` FOREIGN KEY (`heading_id`) REFERENCES `designer_content_heading` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_setting_heading` */

insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (1,1,1,1,4,1,36,'#000000',1);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (2,1,2,1,4,1,30,'#000000',2);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (3,1,3,1,4,1,24,'#000000',3);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (4,1,4,1,4,1,18,'#000000',4);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (5,1,5,1,4,1,14,'#000000',5);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (6,1,6,1,4,1,12,'#000000',6);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (7,2,1,1,4,1,36,'#000000',1);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (8,2,2,1,4,1,30,'#000000',2);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (9,2,3,1,4,1,24,'#000000',3);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (10,2,4,1,4,1,18,'#000000',4);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (11,2,5,1,4,1,14,'#000000',5);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (12,2,6,1,4,1,12,'#000000',6);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (13,3,1,1,4,1,36,'#000000',1);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (14,3,2,1,4,1,30,'#000000',2);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (15,3,3,1,4,1,24,'#000000',3);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (16,3,4,1,4,1,18,'#000000',4);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (17,3,5,1,4,1,14,'#000000',5);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (18,3,6,1,4,1,12,'#000000',6);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (19,4,1,1,2,1,22,'#000000',1);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (20,4,2,1,2,1,18,'#000000',2);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (21,4,3,1,2,1,16,'#000000',3);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (22,4,4,1,2,2,14,'#000000',4);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (23,4,5,2,2,1,14,'#000000',5);
insert  into `user_setting_heading`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`sort_order`) values (24,4,6,1,1,1,12,'#000000',6);

/*Table structure for table `user_site` */

CREATE TABLE `user_site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identity_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identity_id` (`identity_id`),
  CONSTRAINT `user_site_ibfk_1` FOREIGN KEY (`identity_id`) REFERENCES `dlayer_identity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site` */

insert  into `user_site`(`id`,`identity_id`,`name`) values (1,1,'Sample site 1');
insert  into `user_site`(`id`,`identity_id`,`name`) values (2,2,'Sample site 1');
insert  into `user_site`(`id`,`identity_id`,`name`) values (3,3,'Sample site 1');
insert  into `user_site`(`id`,`identity_id`,`name`) values (4,1,'Test site');

/*Table structure for table `user_site_content_heading` */

CREATE TABLE `user_site_content_heading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name to identity content',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_site_content_heading_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_content_heading` */

/*Table structure for table `user_site_content_jumbotron` */

CREATE TABLE `user_site_content_jumbotron` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_site_content_jumbotron_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_content_jumbotron` */

/*Table structure for table `user_site_content_text` */

CREATE TABLE `user_site_content_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name so user can identity content',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_site_content_text_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_content_text` */

/*Table structure for table `user_site_form` */

CREATE TABLE `user_site_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_form` */

/*Table structure for table `user_site_form_field` */

CREATE TABLE `user_site_form_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `form_id` int(11) unsigned NOT NULL,
  `field_type_id` tinyint(3) unsigned NOT NULL,
  `tool_id` int(11) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `form_id` (`form_id`),
  KEY `field_type_id` (`field_type_id`),
  KEY `tool_id` (`tool_id`),
  CONSTRAINT `user_site_form_field_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_form_field_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_site_form` (`id`),
  CONSTRAINT `user_site_form_field_ibfk_3` FOREIGN KEY (`field_type_id`) REFERENCES `designer_form_field_type` (`id`),
  CONSTRAINT `user_site_form_field_ibfk_4` FOREIGN KEY (`tool_id`) REFERENCES `dlayer_module_tool` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_form_field` */

/*Table structure for table `user_site_form_field_attribute` */

CREATE TABLE `user_site_form_field_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `form_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `attribute_id` tinyint(3) unsigned NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `form_id` (`form_id`),
  KEY `field_id` (`field_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `user_site_form_field_attribute_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_form_field_attribute_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_site_form` (`id`),
  CONSTRAINT `user_site_form_field_attribute_ibfk_3` FOREIGN KEY (`field_id`) REFERENCES `user_site_form_field` (`id`),
  CONSTRAINT `user_site_form_field_attribute_ibfk_4` FOREIGN KEY (`attribute_id`) REFERENCES `designer_form_field_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_form_field_attribute` */

/*Table structure for table `user_site_form_field_row_background_color` */

CREATE TABLE `user_site_form_field_row_background_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `form_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `form_id` (`form_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `user_site_form_field_row_background_color_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_form_field_row_background_color_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_site_form` (`id`),
  CONSTRAINT `user_site_form_field_row_background_color_ibfk_3` FOREIGN KEY (`field_id`) REFERENCES `user_site_form_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_form_field_row_background_color` */

/*Table structure for table `user_site_form_layout` */

CREATE TABLE `user_site_form_layout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `form_id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layout_id` tinyint(3) unsigned NOT NULL,
  `horizontal_width_label` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `horizontal_width_field` tinyint(2) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `form_id` (`form_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `user_site_form_layout_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_form_layout_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_site_form` (`id`),
  CONSTRAINT `user_site_form_layout_ibfk_3` FOREIGN KEY (`layout_id`) REFERENCES `designer_form_layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_form_layout` */

/*Table structure for table `user_site_form_setting` */

CREATE TABLE `user_site_form_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `form_id` int(11) unsigned NOT NULL,
  `width` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum form display width',
  `legend` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Fieldset legend text for form',
  `button` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text for the submit button',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `form_id` (`form_id`),
  CONSTRAINT `user_site_form_setting_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_form_setting_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_site_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_form_setting` */

/*Table structure for table `user_site_history` */

CREATE TABLE `user_site_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identity_id` int(11) unsigned NOT NULL,
  `site_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `identity_id` (`identity_id`),
  CONSTRAINT `user_site_history_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_history_ibfk_2` FOREIGN KEY (`identity_id`) REFERENCES `dlayer_identity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_history` */

insert  into `user_site_history`(`id`,`identity_id`,`site_id`) values (1,1,1);
insert  into `user_site_history`(`id`,`identity_id`,`site_id`) values (2,2,2);
insert  into `user_site_history`(`id`,`identity_id`,`site_id`) values (3,3,3);

/*Table structure for table `user_site_image_library` */

CREATE TABLE `user_site_image_library` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `sub_category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `category_id` (`category_id`),
  KEY `sub_category_id` (`sub_category_id`),
  CONSTRAINT `user_site_image_library_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_image_library_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `user_site_image_library_category` (`id`),
  CONSTRAINT `user_site_image_library_ibfk_3` FOREIGN KEY (`sub_category_id`) REFERENCES `user_site_image_library_sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_image_library` */

insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (1,1,'Autumn path','Public domain image.',1,1);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (2,1,'Downtown Boston','Public domain image.',1,1);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (3,1,'Horses','Public domain image.',4,4);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (4,1,'Old lantern and brush','Public domain image.',1,1);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (5,1,'Robin','Public domain image.',4,4);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (6,1,'Signs','Public domain image.',1,1);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (7,1,'Spring coffee','Public domain image.',1,1);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (8,3,'Autumn path','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (9,3,'Downtown Boston','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (10,3,'Horses','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (11,3,'Old lantern and brush','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (12,3,'Robin','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (13,3,'Signs','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (14,3,'Spring coffee','Public domain image.',3,3);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (15,2,'Autumn path','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (16,2,'Downtown Boston','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (17,2,'Horses','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (18,2,'Old lantern and brush','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (19,2,'Robin','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (20,2,'Signs','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (21,2,'Spring coffee','Public domain image.',2,2);
insert  into `user_site_image_library`(`id`,`site_id`,`name`,`description`,`category_id`,`sub_category_id`) values (22,1,'Autumn path - Clone','Clone or original image.',1,1);

/*Table structure for table `user_site_image_library_category` */

CREATE TABLE `user_site_image_library_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_site_image_library_category_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_image_library_category` */

insert  into `user_site_image_library_category`(`id`,`site_id`,`name`) values (1,1,'Uncategorised');
insert  into `user_site_image_library_category`(`id`,`site_id`,`name`) values (2,2,'Uncategorised');
insert  into `user_site_image_library_category`(`id`,`site_id`,`name`) values (3,3,'Uncategorised');
insert  into `user_site_image_library_category`(`id`,`site_id`,`name`) values (4,1,'Animals');

/*Table structure for table `user_site_image_library_link` */

CREATE TABLE `user_site_image_library_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `library_id` int(11) unsigned NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `library_id` (`library_id`),
  KEY `version_id` (`version_id`),
  CONSTRAINT `user_site_image_library_link_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_image_library_link_ibfk_2` FOREIGN KEY (`library_id`) REFERENCES `user_site_image_library` (`id`),
  CONSTRAINT `user_site_image_library_link_ibfk_3` FOREIGN KEY (`version_id`) REFERENCES `user_site_image_library_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_image_library_link` */

insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (1,1,1,1);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (2,1,2,2);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (3,1,3,3);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (4,1,4,4);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (5,1,5,5);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (6,1,6,6);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (7,1,7,23);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (8,3,8,8);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (9,3,9,9);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (10,3,10,10);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (11,3,11,11);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (12,3,12,12);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (13,3,13,13);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (14,3,14,14);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (15,2,15,15);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (16,2,16,16);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (17,2,17,17);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (18,2,18,18);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (19,2,19,19);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (20,2,20,20);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (21,2,21,21);
insert  into `user_site_image_library_link`(`id`,`site_id`,`library_id`,`version_id`) values (22,1,22,22);

/*Table structure for table `user_site_image_library_sub_category` */

CREATE TABLE `user_site_image_library_sub_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `user_site_image_library_sub_category_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_image_library_sub_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `user_site_image_library_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_image_library_sub_category` */

insert  into `user_site_image_library_sub_category`(`id`,`site_id`,`category_id`,`name`) values (1,1,1,'Misc.');
insert  into `user_site_image_library_sub_category`(`id`,`site_id`,`category_id`,`name`) values (2,2,2,'Misc.');
insert  into `user_site_image_library_sub_category`(`id`,`site_id`,`category_id`,`name`) values (3,3,3,'Misc.');
insert  into `user_site_image_library_sub_category`(`id`,`site_id`,`category_id`,`name`) values (4,1,4,'Misc.');

/*Table structure for table `user_site_image_library_version` */

CREATE TABLE `user_site_image_library_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `library_id` int(11) unsigned NOT NULL,
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tool_id` int(11) unsigned NOT NULL DEFAULT '25' COMMENT 'Tool used to create version',
  `identity_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `identity_id` (`identity_id`),
  KEY `library_id` (`library_id`),
  KEY `tool_id` (`tool_id`),
  CONSTRAINT `user_site_image_library_version_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_image_library_version_ibfk_2` FOREIGN KEY (`identity_id`) REFERENCES `dlayer_identity` (`id`),
  CONSTRAINT `user_site_image_library_version_ibfk_3` FOREIGN KEY (`library_id`) REFERENCES `user_site_image_library` (`id`),
  CONSTRAINT `user_site_image_library_version_ibfk_4` FOREIGN KEY (`tool_id`) REFERENCES `dlayer_module_tool` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_image_library_version` */

insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (1,1,1,'2015-04-22 12:21:09',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (2,1,2,'2015-04-22 12:21:45',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (3,1,3,'2015-04-22 12:22:06',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (4,1,4,'2015-04-22 12:22:28',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (5,1,5,'2015-04-22 12:22:54',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (6,1,6,'2015-04-22 12:23:17',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (7,1,7,'2015-04-22 12:23:39',25,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (8,3,8,'2015-04-22 12:29:00',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (9,3,9,'2015-04-22 12:29:18',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (10,3,10,'2015-04-22 12:29:31',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (11,3,11,'2015-04-22 12:29:41',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (12,3,12,'2015-04-22 12:29:53',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (13,3,13,'2015-04-22 12:30:08',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (14,3,14,'2015-04-22 12:30:24',25,3);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (15,2,15,'2015-04-22 12:30:55',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (16,2,16,'2015-04-22 12:31:08',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (17,2,17,'2015-04-22 12:31:22',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (18,2,18,'2015-04-22 12:31:35',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (19,2,19,'2015-04-22 12:31:50',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (20,2,20,'2015-04-22 12:32:02',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (21,2,21,'2015-04-22 12:32:15',25,2);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (22,1,22,'2015-04-22 12:39:27',29,1);
insert  into `user_site_image_library_version`(`id`,`site_id`,`library_id`,`uploaded`,`tool_id`,`identity_id`) values (23,1,7,'2015-04-22 12:47:14',30,1);

/*Table structure for table `user_site_image_library_version_meta` */

CREATE TABLE `user_site_image_library_version_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `library_id` int(11) unsigned NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '.jpg',
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `width` smallint(5) NOT NULL DEFAULT '1',
  `height` smallint(5) NOT NULL DEFAULT '1',
  `size` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `library_id` (`library_id`),
  KEY `version_id` (`version_id`),
  CONSTRAINT `user_site_image_library_version_meta_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_image_library_version_meta_ibfk_2` FOREIGN KEY (`library_id`) REFERENCES `user_site_image_library` (`id`),
  CONSTRAINT `user_site_image_library_version_meta_ibfk_3` FOREIGN KEY (`version_id`) REFERENCES `user_site_image_library_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_image_library_version_meta` */

insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (1,1,1,1,'.jpg','image/jpeg',615,453,173442);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (2,1,2,2,'.jpg','image/jpeg',615,461,124479);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (3,1,3,3,'.jpg','image/jpeg',615,389,42910);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (4,1,4,4,'.jpg','image/jpeg',615,410,51533);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (5,1,5,5,'.jpg','image/jpeg',615,407,32763);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (6,1,6,6,'.jpg','image/jpeg',615,461,49367);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (7,1,7,7,'.jpg','image/jpeg',615,410,47362);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (8,3,8,8,'.jpg','image/jpeg',615,453,173442);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (9,3,9,9,'.jpg','image/jpeg',615,461,124479);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (10,3,10,10,'.jpg','image/jpeg',615,389,42910);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (11,3,11,11,'.jpg','image/jpeg',615,410,51533);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (12,3,12,12,'.jpg','image/jpeg',615,407,32763);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (13,3,13,13,'.jpg','image/jpeg',615,461,49367);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (14,3,14,14,'.jpg','image/jpeg',615,410,47362);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (15,2,15,15,'.jpg','image/jpeg',615,453,173442);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (16,2,16,16,'.jpg','image/jpeg',615,461,124479);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (17,2,17,17,'.jpg','image/jpeg',615,389,42910);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (18,2,18,18,'.jpg','image/jpeg',615,410,51533);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (19,2,19,19,'.jpg','image/jpeg',615,407,32763);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (20,2,20,20,'.jpg','image/jpeg',615,461,49367);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (21,2,21,21,'.jpg','image/jpeg',615,410,47362);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (22,1,22,22,'.jpg','image/jpeg',615,453,173442);
insert  into `user_site_image_library_version_meta`(`id`,`site_id`,`library_id`,`version_id`,`extension`,`type`,`width`,`height`,`size`) values (23,1,7,23,'.jpg','image/jpeg',561,367,42624);

/*Table structure for table `user_site_page` */

CREATE TABLE `user_site_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `user_site_page_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page` */

/*Table structure for table `user_site_page_column_size` */

CREATE TABLE `user_site_page_column_size` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `column_id` int(11) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `col_type` enum('xs','sm','md','lg') COLLATE utf8_unicode_ci DEFAULT NULL,
  `offset` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `column_id` (`column_id`),
  CONSTRAINT `user_site_page_column_size_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_column_size_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_column_size_ibfk_3` FOREIGN KEY (`column_id`) REFERENCES `user_site_page_structure_column` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_column_size` */

/*Table structure for table `user_site_page_content_item_heading` */

CREATE TABLE `user_site_page_content_item_heading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `heading_id` tinyint(3) unsigned NOT NULL,
  `data_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  KEY `heading_id` (`heading_id`),
  KEY `data_id` (`data_id`),
  CONSTRAINT `user_site_page_content_item_heading_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_content_item_heading_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_content_item_heading_ibfk_3` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`),
  CONSTRAINT `user_site_page_content_item_heading_ibfk_4` FOREIGN KEY (`heading_id`) REFERENCES `designer_content_heading` (`id`),
  CONSTRAINT `user_site_page_content_item_heading_ibfk_5` FOREIGN KEY (`data_id`) REFERENCES `user_site_content_heading` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_item_heading` */

/*Table structure for table `user_site_page_content_item_image` */

CREATE TABLE `user_site_page_content_item_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `version_id` int(11) unsigned NOT NULL,
  `expand` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `caption` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `version_id` (`version_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `user_site_page_content_item_image_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_content_item_image_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_content_item_image_ibfk_3` FOREIGN KEY (`version_id`) REFERENCES `user_site_image_library_version` (`id`),
  CONSTRAINT `user_site_page_content_item_image_ibfk_4` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_item_image` */

/*Table structure for table `user_site_page_content_item_jumbotron` */

CREATE TABLE `user_site_page_content_item_jumbotron` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `data_id` int(11) unsigned NOT NULL,
  `button_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  KEY `data_id` (`data_id`),
  CONSTRAINT `user_site_page_content_item_jumbotron_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_content_item_jumbotron_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_content_item_jumbotron_ibfk_3` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`),
  CONSTRAINT `user_site_page_content_item_jumbotron_ibfk_4` FOREIGN KEY (`data_id`) REFERENCES `user_site_content_jumbotron` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_item_jumbotron` */

/*Table structure for table `user_site_page_content_item_text` */

CREATE TABLE `user_site_page_content_item_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `data_id` int(11) unsigned NOT NULL COMMENT 'Id of content in data table',
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  KEY `site_id` (`site_id`),
  KEY `data_id` (`data_id`),
  CONSTRAINT `user_site_page_content_item_text_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_content_item_text_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_content_item_text_ibfk_3` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`),
  CONSTRAINT `user_site_page_content_item_text_ibfk_4` FOREIGN KEY (`data_id`) REFERENCES `user_site_content_text` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_item_text` */

/*Table structure for table `user_site_page_content_size` */

CREATE TABLE `user_site_page_content_size` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `size` tinyint(3) unsigned NOT NULL DEFAULT '12',
  `col_type` enum('xs','sm','md','lg') COLLATE utf8_unicode_ci DEFAULT NULL,
  `offset` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `user_site_page_content_size_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_content_size_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_content_size_ibfk_3` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_size` */

/*Table structure for table `user_site_page_meta` */

CREATE TABLE `user_site_page_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`page_id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `user_site_page_meta_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_meta` */

/*Table structure for table `user_site_page_structure_column` */

CREATE TABLE `user_site_page_structure_column` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `row_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `row_id` (`row_id`),
  CONSTRAINT `user_site_page_structure_column_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_structure_column_ibfk_2` FOREIGN KEY (`row_id`) REFERENCES `user_site_page_structure_row` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_structure_column` */

/*Table structure for table `user_site_page_structure_content` */

CREATE TABLE `user_site_page_structure_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `row_id` int(11) unsigned NOT NULL,
  `sort_order` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `row_id` (`row_id`),
  CONSTRAINT `user_site_page_structure_content_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_structure_content_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_structure_content_ibfk_3` FOREIGN KEY (`row_id`) REFERENCES `user_site_page_structure_row` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_structure_content` */

/*Table structure for table `user_site_page_structure_row` */

CREATE TABLE `user_site_page_structure_row` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `column_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `column_id` (`column_id`),
  CONSTRAINT `user_site_page_structure_row_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site_content_heading` (`id`),
  CONSTRAINT `user_site_page_structure_row_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_structure_row_ibfk_3` FOREIGN KEY (`column_id`) REFERENCES `user_site_page_structure_column` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_structure_row` */

/*Table structure for table `user_site_page_styles_area_background_color` */

CREATE TABLE `user_site_page_styles_area_background_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_area_id` int(11) unsigned NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_area_id` (`content_area_id`),
  CONSTRAINT `user_site_page_styles_area_background_color_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_styles_area_background_color_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_styles_area_background_color_ibfk_3` FOREIGN KEY (`content_area_id`) REFERENCES `user_site_template_div` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_styles_area_background_color` */

/*Table structure for table `user_site_page_styles_container_background_color` */

CREATE TABLE `user_site_page_styles_container_background_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `user_site_page_styles_container_background_color_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_styles_container_background_color_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_styles_container_background_color_ibfk_3` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_styles_container_background_color` */

/*Table structure for table `user_site_page_styles_item_background_color` */

CREATE TABLE `user_site_page_styles_item_background_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `user_site_page_styles_item_background_color_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_styles_item_background_color_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_styles_item_background_color_ibfk_3` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_structure_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_styles_item_background_color` */

/*Table structure for table `user_site_page_styles_row_background_color` */

CREATE TABLE `user_site_page_styles_row_background_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `content_row_id` int(11) unsigned NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `page_id` (`page_id`),
  KEY `content_row_id` (`content_row_id`),
  CONSTRAINT `user_site_page_styles_row_background_color_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`),
  CONSTRAINT `user_site_page_styles_row_background_color_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `user_site_page` (`id`),
  CONSTRAINT `user_site_page_styles_row_background_color_ibfk_3` FOREIGN KEY (`content_row_id`) REFERENCES `user_site_page_content_rows` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_styles_row_background_color` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
