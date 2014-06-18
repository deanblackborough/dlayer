<?php
/**
* Ribbon model
* 
* The ribbon displays the controls for the selected tool, there will always 
* be one tab but a tool can have many ribbon tabs
*
* @author Dean Blackborough <dean@g3d-development.com>
* @copyright G3D Development Limited
* @version $Id: Ribbon.php 1685 2014-03-16 20:48:23Z Dean.Blackborough $
* @category Model
*/
class Dlayer_Model_Ribbon extends Zend_Db_Table_Abstract
{
    /**
    * Fetches all the tabs for the selected tool, if the tool is considered 
    * to be in edit mode additional tool tabs can be pulled from the system
    *
    * @param string $module
    * @param string $tool
    * @param boolean $edit_mode There are tabs that only show in edit mode
    * @return array
    */
    public function tabs($module, $tool, $edit_mode=FALSE)
    {
        $sql = "SELECT dmtt.`name` AS tab_name, dmtt.view_script AS tab
                FROM dlayer_module_tool_tabs dmtt
                JOIN dlayer_module_tools dmt ON dmtt.tool_id = dmt.id
                    AND dmt.enabled = 1
                    AND dmt.folder = :tool
                    AND dmtt.module_id = dmt.module_id 
                JOIN dlayer_modules dm ON dmt.module_id = dm.id
                WHERE dm.`name` = :module
                AND dm.enabled = 1
                AND dmtt.enabled = 1 ";
        if($edit_mode == FALSE) {
			$sql .= "AND dmtt.edit_mode = 0 ";
        }
        $sql .= "ORDER BY dmtt.sort_order ASC";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':tool', $tool, PDO::PARAM_STR);
        $stmt->bindValue(':module', $module, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
