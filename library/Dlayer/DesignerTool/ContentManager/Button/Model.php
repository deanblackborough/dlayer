<?php

/**
 * Data model for the button content item
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Dlayer_DesignerTool_ContentManager_Button_Model extends
    Dlayer_DesignerTool_ContentManager_Shared_Model_Content_Item
{
    /**
     * Add a new button content item
     *
     * @param integer $site_id
     * @param integer $page_id
     * @param integer $content_id
     * @param array $params The params data array from the tool
     *
     * @return boolean
     */
    public function add($site_id, $page_id, $content_id, array $params)
    {
        $result = false;

        $data_id = $this->existingDataIdOrFalse($site_id, $params['content'], 'Button');

        if ($data_id === false) {
            $data_id = $this->addData($site_id, $params['name'], $params['label']);
        }

        if ($data_id !== false) {
            $sql = "INSERT INTO `user_site_page_content_item_button` 
                    (
                        `site_id`, 
                        `page_id`, 
                        `content_id`, 
                        `data_id`
                    ) 
                    VALUES 
                    (
                        :site_id, 
                        :page_id, 
                        :content_id, 
                        :data_id
                    )";
            $stmt = $this->_db->prepare($sql);
            $stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
            $stmt->bindValue(':page_id', $page_id, PDO::PARAM_INT);
            $stmt->bindValue(':content_id', $content_id, PDO::PARAM_INT);
            $stmt->bindValue(':data_id', $data_id, PDO::PARAM_INT);
            $result = $stmt->execute();
        }

        return $result;
    }

    /**
     * Add the new content item data into the content table for button items
     *
     * @param integer $site_id
     * @param string $name
     * @param string $content
     * @return integer|false The id for the new data or false upon failure
     */
    private function addData($site_id, $name, $content)
    {
        $sql = "INSERT INTO `user_site_content_button` 
				(
				    `site_id`, 
				    `name`, 
				    `content`
				) 
				VALUES 
				(   
				    :site_id, 
				    :name, 
				    :content
				)";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
        $stmt->bindValue(':name', $name, PDO::PARAM_STR);
        $stmt->bindValue(':content', $content, PDO::PARAM_STR);
        $result = $stmt->execute();

        if ($result === true) {
            return intval($this->_db->lastInsertId('user_site_content_button'));
        } else {
            return false;
        }
    }

    /**
     * Fetch the existing data for the content item
     *
     * @param integer $site_id
     * @param integer $id
     *
     * @return array|false The data array for the content item or false upon failure
     */
    public function existingData($site_id, $id)
    {
        $sql = "SELECT 
                    `uscb`.`name`, 
                    `uscb`.`content`
				FROM 
				    `user_site_page_content_item_button` `uspcib` 
				INNER JOIN 
				    `user_site_content_button` `uscb` ON 
				        `uspcib`.`data_id` = uscb.id AND 
				        `uscb`.`site_id` = :site_id 
				WHERE 
				    `uspcib`.`site_id` = :site_id AND 
				    `uspcib`.`content_id` = :content_id";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
        $stmt->bindValue(':content_id', $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch();
    }
}
