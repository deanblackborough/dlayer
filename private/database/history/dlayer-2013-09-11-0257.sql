/*
SQLyog Enterprise v11.23 (32 bit)
MySQL - 5.6.13 : Database - dlayer
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
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `palette_id` (`palette_id`),
  KEY `color_type_id` (`color_type_id`),
  CONSTRAINT `designer_color_palette_colors_ibfk_1` FOREIGN KEY (`palette_id`) REFERENCES `designer_color_palettes` (`id`),
  CONSTRAINT `designer_color_palette_colors_ibfk_2` FOREIGN KEY (`color_type_id`) REFERENCES `designer_color_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_color_palette_colors` */

insert  into `designer_color_palette_colors`(`id`,`palette_id`,`color_type_id`,`name`,`color_hex`,`enabled`) values (1,1,1,'Black','#000000',1),(2,1,2,'Tan','#f3f1df',1),(3,1,3,'Dark grey','#666666',1),(4,2,1,'Blue','#336699',1),(5,2,2,'Dark grey','#666666',1),(6,2,3,'Grey','#999999',1),(7,3,1,'Blue','#003366',1),(8,3,2,'White','#FFFFFF',1),(9,3,3,'Orange','#FF6600',1);

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

/*Table structure for table `designer_content_headings` */

DROP TABLE IF EXISTS `designer_content_headings`;

CREATE TABLE `designer_content_headings` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_content_headings` */

insert  into `designer_content_headings`(`id`,`name`,`tag`,`sort_order`,`enabled`) values (1,'Page title','h1',1,1),(2,'Heading 1','h2',2,1),(3,'Heading 2','h3',3,1),(4,'Heading 3','h4',4,1),(5,'Heading 4','h5',5,1),(6,'Heading 5','h6',6,1),(7,'Heading 6','h7',7,1);

/*Table structure for table `designer_content_types` */

DROP TABLE IF EXISTS `designer_content_types`;

CREATE TABLE `designer_content_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_content_types` */

insert  into `designer_content_types`(`id`,`name`,`description`,`enabled`) values (1,'text','Text block',1),(2,'heading','Heading',1);

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

/*Table structure for table `designer_css_font_families` */

DROP TABLE IF EXISTS `designer_css_font_families`;

CREATE TABLE `designer_css_font_families` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort_order` (`sort_order`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_font_families` */

insert  into `designer_css_font_families`(`id`,`name`,`description`,`css`,`sort_order`,`enabled`) values (1,'Helvetica','Helvetica, Arial, Nimbus Sans L','Helvetica, Arial, \"Nimbus Sans L\", sans-serif',1,1),(2,'Lucida Grande','Lucida Grande, Lucida Sans Unicode, Bitstream Vera Sans','\"Lucida Grande\", \"Lucida Sans Unicode\", \"Bitstream Vera Sans\", sans-serif',2,1),(3,'Georgia','Georgia, URW Bookman L','Georgia, \"URW Bookman L\", serif',3,1),(4,'Corbel','Corbel, Arial, Helvetica, Nimbus Sans L, Liberation Sans','Corbel, Arial, Helvetica, \"Nimbus Sans L\", \"Liberation Sans\", sans-serif',4,1),(5,'Code','Consolas, Bitstream Vera Sans Mono, Andale Mono, Monaco, Lucida Console','Consolas, \"Bitstream Vera Sans Mono\", \"Andale Mono\", Monaco, \"Lucida Console\", monospace',5,1),(6,'Verdana','Verdana, Geneva','Verdana, Geneva, sans-serif',6,1),(7,'Tahoma','Tahoma, Geneva','Tahoma, Geneva, sans-serif',7,1);

/*Table structure for table `designer_css_text_decorations` */

DROP TABLE IF EXISTS `designer_css_text_decorations`;

CREATE TABLE `designer_css_text_decorations` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `sort_order` (`sort_order`)
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
  KEY `enabled` (`enabled`),
  KEY `sort_order` (`sort_order`)
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
  KEY `enabled` (`enabled`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designer_css_text_weights` */

insert  into `designer_css_text_weights`(`id`,`name`,`css`,`sort_order`,`enabled`) values (1,'Normal','400',1,1),(2,'Bold','700',2,1),(3,'Light','100',3,1);

/*Table structure for table `dlayer_development_log` */

DROP TABLE IF EXISTS `dlayer_development_log`;

CREATE TABLE `dlayer_development_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `change` text COLLATE utf8_unicode_ci NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_development_log` */

insert  into `dlayer_development_log`(`id`,`change`,`added`,`enabled`) values (1,'Added a development log to Dlayer to show changes to the application, two reasons, one to spur on my development, two, to show the public what I am adding.','2013-04-05 00:38:16',1),(2,'Added a pagination view helper, update of my existing pagination view helper.','2013-04-05 00:38:52',1),(6,'Added a helper class to the library, initially only a couple of static helper functions.','2013-04-08 01:20:22',1),(7,'Updated the pagination view helper, added the ability to define text to use for links and also updated the logic for \'of n\' text.','2013-04-08 02:03:42',1),(8,'Updated the default styling for tables, header rows and table rows.','2013-04-08 02:19:22',1),(9,'Added the form for the add text field tool in the forms builder.','2013-04-12 18:15:57',1),(10,'Updated the base forms class, addElementsToForm() method updated, now able to create multiple fieldsets within a form, one fieldset per method call','2013-04-14 18:18:04',1),(11,'Updated all the help text for the template designer, simpler language.','2013-04-16 18:19:34',1),(12,'Added the form for the add textarea tool in the forms builder.','2013-04-20 18:20:36',1),(13,'Updated the pagination view helper, can now show either \'item n-m of o\' or \'page n of m\' between the next and previous links.','2013-04-21 18:46:50',1),(14,'Added base tool process model for the form builder, working on the add text field process tool model.','2013-04-25 01:37:41',1),(16,'Text field can now be added to a form in the form builder, still need to add supporting for editing a field.','2013-05-04 22:44:24',1),(17,'Text area field can now be added to the form, edit mode still needs to be added.','2013-05-12 02:27:58',1),(18,'Form builder now supports and displayed text area fields which have been added to the form defintion.','2013-05-12 02:28:13',1),(19,'Added initial styling for the form builder forms.','2013-05-12 03:12:49',1),(20,'The add field forms in the form builder now add the attributes for the text and textarea field types.','2013-05-14 01:48:24',1),(21,'Field attributes are now saved to the database and then pulled in the form builder and attached to the inputs.','2013-05-15 01:43:55',1),(22,'Reworked the javascript, selector functions have been moved to the module javascript files rather than the base Dlayer object.','2013-05-21 01:49:48',1),(23,'Public set methods (div and form field) now check that the given id belongs to the currently set template/form and site.','2013-05-28 01:02:38',1),(24,'Form module ribbon forms now show existing values when in edit mode.','2013-06-01 01:26:25',1),(25,'Edit mode in place for form text fields and form textarea fields','2013-06-11 00:00:23',1),(26,'Updated the template module and template session class, updated names of some logic vars, names more clear, wasn\'t always obvious what a var referred to.','2013-06-12 00:43:42',1),(27,'Multi use tool setting was not being respected in the form builder when adding a new field, field id was not being stored in session.','2013-06-16 21:09:23',1),(28,'Form fields not being pulled from database in correct order.','2013-06-16 21:09:54',1),(29,'Fixed a bug with the expand and contact tabs of the resize tool in the template designer, border widths were not being added to div width meaning that the split positions were not being calculated correctly.','2013-06-19 01:25:20',1),(30,'Pagination view helper wasn\'t escaping all developer defined text.','2013-06-25 23:31:43',1),(31,'Template module tool process methods now double check that the tool posted matches the tool defined in the session.','2013-06-25 23:51:11',1),(32,'Wife had a baby, Jack James','2013-06-28 05:41:00',1),(33,'Added the forms for the content headings to the content settings page, initially it just allows the user to update the params for the headings, there is no live preview or formatting.','2013-08-16 02:42:41',1),(34,'Added initial styling for the heading setting forms and added initial styling for the heading previews.','2013-08-16 03:37:51',1),(35,'Added live preview to the content settings page (header styles) defaults to show saved styles and then on change updates the previews.','2013-08-20 17:10:04',1),(36,'Refactored the designer js, all modules, simplifed the base dlayer object and moved all the js that was sitting in view files. Structure of the scripts folder now matches images and styles folders.','2013-08-21 01:46:02',1),(37,'Upgraded to jquery-1.10.2, fixed a small jquery issue with chrome, multi-line comment at top of script.','2013-08-22 23:53:30',1),(38,'Moved all the jquery required for the initial content module settings into the Dlayer js object.','2013-08-23 23:14:30',1),(39,'Added tabs to the content manager settings page, going to be too many settings for one page and the new layout will allow more detail to be given to the user.','2013-08-24 23:15:15',1),(40,'Added some default styling to the app, a tags and list items.','2013-08-25 01:57:42',1),(41,'Updated static validation helper class, now calls the new colorHex validation class','2013-08-26 02:50:26',1),(42,'Removed RGB entries for colours in the database, not required at the moment, going to just use hex values initially.','2013-08-28 00:47:24',1),(43,'Updated database and code, all fields relating to colour update to color_hex as that is currently what the field contains, later we can add a colour object is required with the RGB values and palette data, keeping things simple initially.','2013-08-28 00:48:48',1),(44,'Added the heading content type view helper to the content module, initially it adds all the header tag styles inline, this will be rectified later.','2013-08-29 02:37:13',1),(45,'Added a base font families table to the database and a corresponding font families settings table, allows the user to define the base font family per site/module, as in a base font family for the content manager and then the base font family for forms, support for the widget designer will be added later.','2013-08-29 19:54:42',1),(46,'Added the ability to define the base font family in the content module, the value is not currently being used by the designer, that support will be added shortly.','2013-09-06 16:44:18',1),(47,'Added a splash page to the app, this will be where the user logs in to get to their control panel.','2013-09-06 22:54:02',1),(48,'Re-skinned the app, new styling on the splash page, setting pages, base pages and development log.','2013-09-06 22:54:52',1),(49,'Re-skinned the designers, content manager, template designer and form builder','2013-09-09 00:42:34',1),(50,'Updated the tool bars in the three designers, tool icons are going to be larger.','2013-09-11 02:57:06',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dlayer_module_tool_tabs` */

insert  into `dlayer_module_tool_tabs`(`id`,`module_id`,`tool_id`,`name`,`view_script`,`multi_use`,`default`,`sort_order`,`enabled`) values (1,1,2,'Quick split','quick',0,1,1,1),(2,1,2,'Split with mouse','advanced',0,0,2,1),(3,1,2,'Help','help',0,0,3,1),(4,1,3,'Quick split','quick',0,1,1,1),(5,1,3,'Split with mouse','advanced',0,0,2,1),(6,1,3,'Help','help',0,0,3,1),(7,1,7,'Palette 1','palette-1',0,1,1,1),(8,1,7,'Palette 2','palette-2',0,0,2,1),(9,1,7,'Palette 3','palette-3',0,0,3,1),(10,1,7,'Set custom color','advanced',0,0,4,1),(11,1,7,'Help','help',0,0,5,1),(12,1,6,'Set custom size','advanced',1,0,4,1),(14,1,6,'Help','help',0,0,5,1),(15,1,6,'Expand','expand',1,1,1,1),(16,1,6,'Contract','contract',1,0,2,1),(17,1,6,'Adjust height','height',1,0,3,1),(20,1,8,'Set custom border','advanced',1,1,2,1),(21,1,8,'Help','help',0,0,3,1),(22,1,8,'Full border','full',0,0,1,1),(23,4,10,'Text','text',1,1,1,1),(24,4,11,'Heading','heading',1,1,1,1),(25,4,10,'Help','help',0,0,2,1),(26,4,11,'Help','help',0,0,2,1),(27,3,12,'Text','text',0,1,1,1),(28,3,12,'Help','help',0,0,2,1),(29,3,13,'Text area','textarea',0,1,1,1),(30,3,13,'Help','help',0,0,2,1);

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

insert  into `dlayer_module_tools`(`id`,`module_id`,`name`,`tool`,`tool_model`,`folder`,`icon`,`base`,`group_id`,`sort_order`,`enabled`) values (1,1,'Cancel','cancel',NULL,'cancel','cancel.png',1,1,1,1),(2,1,'Split horizontal','split-horizontal','SplitHorizontal','split-horizontal','split-horizontal.png',1,2,1,1),(3,1,'Split vertical','split-vertical','SplitVertical','split-vertical','split-vertical.png',1,2,2,1),(6,1,'Resize','resize','Resize','resize','resize.png',0,3,3,1),(7,1,'Background color','background-color','BackgroundColor','background-color','background-color.png',1,4,1,1),(8,1,'Border','border','Border','border','border.png',0,4,2,1),(9,4,'Cancel','cancel',NULL,'cancel','cancel.png',1,1,1,1),(10,4,'Text','text','Text','text','text.png',0,2,2,1),(11,4,'Heading','heading','Heading','Heading','heading.png',0,2,1,1),(12,3,'Text','text','Text','text','text.png',0,2,1,1),(13,3,'Text area','textarea','Textarea','textarea','textarea.png',0,2,2,1),(14,3,'Cancel','cancel',NULL,'cancel','cancel.png',1,1,1,1);

/*Table structure for table `dlayer_modules` */

DROP TABLE IF EXISTS `dlayer_modules`;

CREATE TABLE `dlayer_modules` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `button_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
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

insert  into `dlayer_modules`(`id`,`name`,`button_name`,`title`,`description`,`icon`,`sort_order`,`enabled`) values (1,'template','Template','Template designer','Design templates which define the basic structure for a webpage.','template.png',1,1),(2,'widget','Widget','Widget designer','Widgets are reusable fragments, if you have something that needs to appear on multiple pages it should probably be a widget.','widget.png',4,1),(3,'form','Forms','Forms builder','Create a form to capture user input.','form.png',3,1),(4,'content','Content','Content manager','Create pages and add content to them, content can be anything, text, images, forms, widgets.','content.png',2,1),(5,'website','Website','Website manager','Define the structure of your website by setting the relationship between web pages.','website.png',5,1);

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

insert  into `dlayer_sessions`(`session_id`,`save_path`,`name`,`modified`,`lifetime`,`session_data`) values ('fhuo32fcpr7tbdelro4eaaqht7','','PHPSESSID',1378559284,1440,'__ZF|a:1:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1378562884;}}dlayer_session|a:1:{s:7:\"site_id\";i:1;}'),('kskc4vmmrl3gi74nvieva2ud73','','PHPSESSID',1378864530,1440,'__ZF|a:4:{s:14:\"dlayer_session\";a:1:{s:3:\"ENT\";i:1378868130;}s:23:\"dlayer_session_template\";a:1:{s:3:\"ENT\";i:1378868130;}s:22:\"dlayer_session_content\";a:1:{s:3:\"ENT\";i:1378865165;}s:19:\"dlayer_session_form\";a:1:{s:3:\"ENT\";i:1378865435;}}dlayer_session|a:2:{s:9:\"module_id\";s:1:\"1\";s:7:\"site_id\";i:1;}dlayer_session_template|a:5:{s:11:\"template_id\";i:1;s:4:\"tool\";s:6:\"resize\";s:6:\"div_id\";s:3:\"161\";s:10:\"tool_model\";s:6:\"Resize\";s:3:\"tab\";s:6:\"expand\";}dlayer_session_content|a:5:{s:11:\"template_id\";i:1;s:7:\"page_id\";i:1;s:15:\"selected_div_id\";s:3:\"161\";s:19:\"selected_content_id\";N;s:4:\"tool\";N;}dlayer_session_form|a:3:{s:7:\"form_id\";i:1;s:4:\"tool\";N;s:8:\"field_id\";N;}');

/*Table structure for table `form_field_attribute_types` */

DROP TABLE IF EXISTS `form_field_attribute_types`;

CREATE TABLE `form_field_attribute_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `form_field_attribute_types` */

insert  into `form_field_attribute_types`(`id`,`name`,`type`) values (1,'Integer','integer'),(2,'String','string');

/*Table structure for table `form_field_attributes` */

DROP TABLE IF EXISTS `form_field_attributes`;

CREATE TABLE `form_field_attributes` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `field_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_type_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_type_id` (`field_type_id`),
  KEY `attribute_type_id` (`attribute_type_id`),
  CONSTRAINT `form_field_attributes_ibfk_1` FOREIGN KEY (`field_type_id`) REFERENCES `form_field_types` (`id`),
  CONSTRAINT `form_field_attributes_ibfk_2` FOREIGN KEY (`attribute_type_id`) REFERENCES `form_field_attribute_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `form_field_attributes` */

insert  into `form_field_attributes`(`id`,`field_type_id`,`name`,`attribute`,`attribute_type_id`) values (1,1,'Size','size',1),(2,1,'Max length','maxlength',1),(3,2,'Columns','cols',1),(4,2,'Rows','rows',1);

/*Table structure for table `form_field_types` */

DROP TABLE IF EXISTS `form_field_types`;

CREATE TABLE `form_field_types` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `form_field_types` */

insert  into `form_field_types`(`id`,`name`,`type`,`description`,`enabled`) values (1,'Text field','text','A single line form input',1),(2,'Textarea field','textarea','A multiple line for input',1);

/*Table structure for table `user_form_field_attributes` */

DROP TABLE IF EXISTS `user_form_field_attributes`;

CREATE TABLE `user_form_field_attributes` (
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
  CONSTRAINT `user_form_field_attributes_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_form_field_attributes_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_forms` (`id`),
  CONSTRAINT `user_form_field_attributes_ibfk_3` FOREIGN KEY (`field_id`) REFERENCES `user_form_fields` (`id`),
  CONSTRAINT `user_form_field_attributes_ibfk_4` FOREIGN KEY (`attribute_id`) REFERENCES `form_field_attributes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_form_field_attributes` */

insert  into `user_form_field_attributes`(`id`,`site_id`,`form_id`,`field_id`,`attribute_id`,`attribute`) values (1,1,1,1,1,'40'),(2,1,1,1,2,'255'),(3,1,1,2,1,'40'),(4,1,1,2,2,'255'),(5,1,1,3,3,'40'),(6,1,1,3,4,'2'),(7,1,1,5,3,'50'),(8,1,1,5,4,'3'),(9,1,1,6,1,'40'),(10,1,1,6,2,'255');

/*Table structure for table `user_form_fields` */

DROP TABLE IF EXISTS `user_form_fields`;

CREATE TABLE `user_form_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `form_id` int(11) unsigned NOT NULL,
  `field_type_id` tinyint(3) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `form_id` (`form_id`),
  KEY `field_type_id` (`field_type_id`),
  KEY `enabled` (`enabled`),
  CONSTRAINT `user_form_fields_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_form_fields_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `user_forms` (`id`),
  CONSTRAINT `user_form_fields_ibfk_3` FOREIGN KEY (`field_type_id`) REFERENCES `form_field_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_form_fields` */

insert  into `user_form_fields`(`id`,`site_id`,`form_id`,`field_type_id`,`label`,`description`,`enabled`) values (1,1,1,1,'Name','Please enter your name',1),(2,1,1,1,'Email','Please enter your email address',1),(3,1,1,2,'Comment','Please enter your comment',1),(5,1,1,2,'Test field','Test field description',1),(6,1,1,1,'Testing text field - Edit','Testing the see if the text field is added - Edit',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_forms` */

insert  into `user_forms`(`id`,`site_id`,`name`,`enabled`) values (1,1,'Test form',1);

/*Table structure for table `user_settings_color_palette_colors` */

DROP TABLE IF EXISTS `user_settings_color_palette_colors`;

CREATE TABLE `user_settings_color_palette_colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `palette_id` int(11) unsigned NOT NULL,
  `color_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
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

insert  into `user_settings_color_palette_colors`(`id`,`site_id`,`palette_id`,`color_type_id`,`name`,`color_hex`,`enabled`) values (10,1,1,1,'Black','#000000',1),(11,1,1,2,'Tan','#f3f1df',1),(12,1,1,3,'Dark grey','#666666',1),(13,1,2,1,'Blue','#336699',1),(14,1,2,2,'Dark grey','#666666',1),(15,1,2,3,'Grey','#999999',1),(16,1,3,1,'Blue','#003366',1),(17,1,3,2,'White','#FFFFFF',1),(18,1,3,3,'Green','#000000',1);

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

/*Table structure for table `user_settings_font_families` */

DROP TABLE IF EXISTS `user_settings_font_families`;

CREATE TABLE `user_settings_font_families` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `module_id` tinyint(3) unsigned NOT NULL,
  `font_family_id` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `site_id` (`site_id`),
  KEY `module_id` (`module_id`),
  KEY `font_family_id` (`font_family_id`),
  CONSTRAINT `user_settings_font_families_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `user_sites` (`id`),
  CONSTRAINT `user_settings_font_families_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `dlayer_modules` (`id`),
  CONSTRAINT `user_settings_font_families_ibfk_3` FOREIGN KEY (`font_family_id`) REFERENCES `designer_css_font_families` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_settings_font_families` */

insert  into `user_settings_font_families`(`id`,`site_id`,`module_id`,`font_family_id`,`enabled`) values (1,1,4,1,1),(2,1,3,1,1);

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
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  `margin_top` tinyint(2) unsigned NOT NULL DEFAULT '12',
  `margin_bottom` tinyint(2) unsigned NOT NULL DEFAULT '12',
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
  CONSTRAINT `user_settings_headings_ibfk_6` FOREIGN KEY (`heading_id`) REFERENCES `designer_content_headings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_settings_headings` */

insert  into `user_settings_headings`(`id`,`site_id`,`heading_id`,`style_id`,`weight_id`,`decoration_id`,`size`,`color_hex`,`margin_top`,`margin_bottom`,`sort_order`,`enabled`) values (1,1,1,1,2,1,22,'#81A594',12,12,1,1),(2,1,2,1,2,1,18,'#81A594',12,12,2,1),(3,1,3,1,2,1,16,'#81A594',12,12,3,1),(4,1,4,1,2,1,14,'#81A594',12,12,4,1),(5,1,5,2,2,1,14,'#81A594',12,12,5,1),(6,1,6,1,1,1,12,'#81A594',12,12,6,1),(7,1,7,2,1,1,12,'#000000',12,12,7,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content` */

insert  into `user_site_page_content`(`id`,`page_id`,`template_id`,`div_id`,`content_type`,`sort_order`) values (1,1,1,163,1,2),(2,1,1,163,1,3),(3,1,1,163,2,1);

/*Table structure for table `user_site_page_content_heading` */

DROP TABLE IF EXISTS `user_site_page_content_heading`;

CREATE TABLE `user_site_page_content_heading` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `heading_id` tinyint(3) unsigned NOT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  KEY `heading_id` (`heading_id`),
  CONSTRAINT `user_site_page_content_heading_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `user_site_pages` (`id`),
  CONSTRAINT `user_site_page_content_heading_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_content` (`id`),
  CONSTRAINT `user_site_page_content_heading_ibfk_3` FOREIGN KEY (`heading_id`) REFERENCES `designer_content_headings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_heading` */

insert  into `user_site_page_content_heading`(`id`,`page_id`,`content_id`,`heading_id`,`heading`) values (1,1,3,2,'This is a test heading');

/*Table structure for table `user_site_page_content_text` */

DROP TABLE IF EXISTS `user_site_page_content_text`;

CREATE TABLE `user_site_page_content_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `width` int(4) unsigned NOT NULL DEFAULT '0',
  `padding` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `user_site_page_content_text_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `user_site_pages` (`id`),
  CONSTRAINT `user_site_page_content_text_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `user_site_page_content` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_page_content_text` */

insert  into `user_site_page_content_text`(`id`,`page_id`,`content_id`,`width`,`padding`,`content`) values (1,1,1,826,5,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>'),(2,1,2,826,5,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt tristique venenatis. Praesent elementum risus id odio tincidunt consectetur. Aliquam a tortor ligula. Suspendisse facilisis fermentum lectus, eu tempus sapien imperdiet ac. Aenean ut eleifend lacus.</p>');

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
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  CONSTRAINT `user_site_template_div_background_colors_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_div_background_colors_ibfk_2` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_background_colors` */

insert  into `user_site_template_div_background_colors`(`id`,`template_id`,`div_id`,`color_hex`) values (17,1,160,'#999999'),(19,1,159,'#f3f1df'),(20,1,162,'#336699'),(21,1,163,'#f3f1df');

/*Table structure for table `user_site_template_div_borders` */

DROP TABLE IF EXISTS `user_site_template_div_borders`;

CREATE TABLE `user_site_template_div_borders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned NOT NULL,
  `div_id` int(11) unsigned NOT NULL,
  `position` enum('top','right','bottom','left') COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(3) unsigned NOT NULL DEFAULT '1',
  `color_hex` char(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#000000',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `template_id` (`template_id`),
  KEY `div_id` (`div_id`),
  KEY `style` (`style`),
  CONSTRAINT `user_site_template_div_borders_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `user_site_templates` (`id`),
  CONSTRAINT `user_site_template_div_borders_ibfk_2` FOREIGN KEY (`div_id`) REFERENCES `user_site_template_divs` (`id`),
  CONSTRAINT `user_site_template_div_borders_ibfk_3` FOREIGN KEY (`style`) REFERENCES `designer_css_border_styles` (`style`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_borders` */

insert  into `user_site_template_div_borders`(`id`,`template_id`,`div_id`,`position`,`style`,`width`,`color_hex`) values (13,1,163,'top','solid',2,'#000000'),(14,1,163,'right','solid',2,'#000000'),(15,1,163,'bottom','solid',2,'#000000'),(16,1,163,'left','solid',2,'#000000'),(25,1,161,'top','solid',5,'#000000'),(26,1,161,'right','solid',5,'#000000'),(27,1,161,'bottom','solid',5,'#000000'),(28,1,161,'left','solid',5,'#000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_div_sizes` */

insert  into `user_site_template_div_sizes`(`id`,`template_id`,`div_id`,`width`,`height`,`design_height`) values (158,1,158,980,0,190),(159,1,159,980,0,380),(160,1,160,140,0,190),(161,1,161,830,0,180),(162,1,162,140,0,380),(163,1,163,836,0,376),(164,1,164,140,0,95),(165,1,165,140,0,95);

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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_site_template_divs` */

insert  into `user_site_template_divs`(`id`,`site_id`,`template_id`,`parent_id`,`sort_order`) values (158,1,1,0,1),(159,1,1,0,2),(160,1,1,158,1),(161,1,1,158,2),(162,1,1,159,1),(163,1,1,159,2),(164,1,1,160,1),(165,1,1,160,2);

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
