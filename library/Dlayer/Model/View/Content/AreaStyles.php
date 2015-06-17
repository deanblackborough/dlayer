<?php
/**
* Content area styles model. The model is responsible for fetching all 
* the styles that have been defined for content areas using the area styling 
* options
* 
* This model fetches the data for an entire content page and should only ever 
* be called when fetching the data for the design view of the designer, it is 
* output only, no management
* 
* @author Dean Blackborough <dean@g3d-development.com>
* @copyright G3D Development Limited
* @category View model
*/
class Dlayer_Model_View_Content_AreaStyles extends Zend_Db_Table_Abstract
{
	/**
	* Fetch all the defined background colour styles for the content areas that 
	* make up the current page, results are returned indexed by content area id
	* 
	* @param integer $site_id
	* @param integer $page_id
	* @return array|FALSE Either an array indexed by content area id or FALSE 
	* 	if there are no defined style values
	*/
	public function backgroundColors($site_id, $page_id) 
	{
		$sql = 'SELECT uspsabc.content_area_id, uspsabc.color_hex 
				FROM user_site_page_styles_area_background_color uspsabc 
				WHERE uspsabc.site_id = :site_id 
				AND uspsabc.page_id = :page_id ';
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
		$stmt->bindValue(':page_id', $page_id, PDO::PARAM_INT);
		$stmt->execute();
		
		$result = $stmt->fetchAll();
		
		if(count($result) > 0) {
			$styles = array();
			
			foreach($result as $row) {
				$styles[$row['content_area_id']] = $row['color_hex'];
			}
			
			return $styles;
		} else {
			return FALSE;
		}
	}
}