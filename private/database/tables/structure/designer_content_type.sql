
CREATE TABLE `designer_content_type` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
	`description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`tool_id` int(11) unsigned NOT NULL,
	PRIMARY KEY (`id`),
	KEY `tool_id` (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;