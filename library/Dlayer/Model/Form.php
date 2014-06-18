<?php
/**
* Form model
* 
* Within the form module a user is able to create forms to place within 
* templates, content or widgets
*
* @author Dean Blackborough <dean@g3d-development.com>
* @copyright G3D Development Limited
* @version $Id: Form.php 1449 2014-01-24 00:43:31Z Dean.Blackborough $
* @category Model
*/
class Dlayer_Model_Form extends Zend_Db_Table_Abstract
{
    /**
    * Check to see if the given form is valid, it just needs to belong to the 
    * requested site, currently their is no status indicator because the user 
    * needs to be able to edit disabled forms
    *
    * @param integer $form_id
    * @param integer $site_id
    * @return boolean
    */
    public function valid($form_id, $site_id)
    {
        $sql = "SELECT id
                FROM user_site_forms
                WHERE site_id = :site_id
                AND id = :form_id";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
        $stmt->bindValue(':form_id', $form_id, PDO::PARAM_INT);
        $stmt->execute();

        $result = $stmt->fetch();

        if($result != FALSE) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    
    /**
	* Fetch all the forms that have been defined for the requested site. 
	* 
	* Initially a user will have 2 sample sites which will contain sample 
	* forms, when a new site is created from scracth there will be no 
	* forms, it is therefore entirely possible that there will be no forms for 
	* the requested site
	* 
	* @param integer $site_id
	* @return array Array of the forms for the site
    */
    public function forms($site_id) 
    {
    	$sql = "SELECT id, `name` 
    			FROM user_site_forms 
    			WHERE site_id = :site_id  
    			ORDER BY `name` ASC";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetchAll();
    }
    
    /**
    * Check to see if the supplied form name is unique
    * 
    * @param string $name
    * @param integer $site_id Site id to limit results by
    * @param integer|NULL $form_id If in edit mode we need to supply the id of 
    * 							   the current template so that the row can be 
    * 							   excluded from the query
    * @return boolean TRUE if the tested form name is unique
    */
    public function nameUnique($name, $site_id, $form_id=NULL) 
    {
    	$where = NULL;
    	
    	if($form_id != NULL) {
			$where = 'AND id != :form_id ';
		}
    	
		$sql = "SELECT id 
				FROM user_site_forms 
				WHERE UPPER(`name`) = :name 
				AND site_id = :site_id "; 
		$sql .= $where;
		$sql .= "LIMIT 1";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':name', strtoupper($name), PDO::PARAM_STR);
		$stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
		if($form_id != NULL) {
			$stmt->bindValue(':form_id', $form_id, PDO::PARAM_INT);
		}
		$stmt->execute();
		
		$result = $stmt->fetch();
		
		if($result == FALSE) {
			return TRUE;
		} else {
			return FALSE;
		}
    }
    
    /**
    * Add a new form to the requested site
    * 
    * @param integer $site_id
    * @param string $name Name for the new form
    * @return integer New form id
    */
    public function addForm($site_id, $name) 
    {
		$sql = "INSERT INTO user_site_forms 
				(site_id, `name`) 
				VALUES 
				(:site_id, :name)";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
		$stmt->bindValue(':name', $name, PDO::PARAM_STR);
		$stmt->execute();
		
		return $this->_db->lastInsertId('user_site_forms');
    }
    
    /**
    * Fetch the details for the requested form
    * 
    * @param integer $form_id
    * @param integer $site_id
    * @return array|FALSE Data array for site
    */
    public function form($form_id, $site_id) 
    {
		$sql = "SELECT id, `name` 
				FROM user_site_forms 
				WHERE site_id = :site_id 
				AND id = :form_id 
				LIMIT 1";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
		$stmt->bindValue(':form_id', $form_id, PDO::PARAM_INT);
		$stmt->execute();
		
		return $stmt->fetch();
    }
    
    /**
    * Edit the details for the selected site form
    * 
    * @param integer $site_id
    * @param integer $form_id
    * @param string $name
    * @return void
    */
    public function editForm($site_id, $form_id, $name) 
    {
		$sql = "UPDATE user_site_forms 
				SET `name` = :name 
				WHERE site_id = :site_id 
				AND id = :form_id";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':name', $name, PDO::PARAM_STR);
		$stmt->bindValue(':site_id', $site_id, PDO::PARAM_INT);
		$stmt->bindValue(':form_id', $form_id, PDO::PARAM_INT);
		$stmt->execute();
    }
}