
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
	KEY `version_id` (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
