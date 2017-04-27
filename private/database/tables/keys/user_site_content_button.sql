
ALTER TABLE `dlayer`.`user_site_content_button`
    ADD CONSTRAINT `user_site_content_button_fk1` FOREIGN KEY (`site_id`) REFERENCES `user_site` (`id`);
