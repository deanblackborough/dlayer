<?php
/**
* Custom session class for the form builder module, store vars which we need to
* manage the environment, attemping to not have visible get vars so this class
* will deal with the values
*
* @author Dean Blackborough <dean@g3d-development.com>
* @copyright G3D Development Limited
* @version $Id: Form.php 1894 2014-06-03 00:10:11Z Dean.Blackborough $
*/
class Dlayer_Session_Form extends Zend_Session_Namespace
{
    /**
    * @param string $namespace
    * @param bool $singleInstance
    * @return void
    */
    public function __construct($namespace = 'dlayer_session_form',
    $singleInstance = false)
    {
        parent::__construct($namespace, $singleInstance);

        $this->setExpirationSeconds(3600);
    }

    /**
    * Set the form id that the user is working on
    *
    * @param integer $id
    * @return void
    */
    public function setFormId($id)
    {
        $this->form_id = intval($id);
    }

    /**
    * Get the id of the selected form
    *
    * @return integer|NULL
    */
    public function formId()
    {
        return $this->form_id;
    }

    /**
    * Set the form element that the user is editing, checks to see if the
    * field belongs to the requested form
    *
    * @param integer $id
    * @param string $type Form field type
    * @return boolean
    */
    public function setFieldId($id, $type)
    {
        $session_dlayer = new Dlayer_Session();
        $model_form_field = new Dlayer_Model_Form_Field();

        if($model_form_field->valid($id, $session_dlayer->siteId(),
        $this->formId(), $type) == TRUE) {
            $this->field_id = intval($id);
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /**
    * Get the id of the selected form element
    *
    * @return integer|NULL
    */
    public function fieldId()
    {
        return $this->field_id;
    }

    /**
    * Set the selected tool, before setting we check to see if the requested
    * tool is valid, if valid we set the default tab for the tool
    *
    * @param string $tool Name of the tool to set
    * @return boolean
    */
    public function setTool($tool)
    {
        $session_dlayer = new Dlayer_Session();
        $model_tool = new Dlayer_Model_Tool();

        $tool_details = $model_tool->valid($session_dlayer->module(), $tool);

        if($tool_details != FALSE) {
            $this->tool = $tool;
            $this->tool_model = $tool_details['tool_model'];
            $this->setRibbonTab($tool_details['tab']);
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /**
    * Set the tool tab
    *
    * @param string $tab
    * @return void
    */
    public function setRibbonTab($tab)
    {
        $this->tab = $tab;
    }

    /**
    * Returns the data array for the currently selected tool, if no tool is
    * set the method returns FALSE
    *
    * @return array|FALSE Array contains two indexes, tool and tab, name is
    *                     the name of the tool, tab is the name of the
    *                     selected tab
    */
    public function tool()
    {
        if($this->tool != NULL && $this->tab != NULL &&
        $this->tool_model != NULL) {
            return array('tool'=>$this->tool,
                         'tab'=>$this->tab,
                         'model'=>$this->tool_model);
        } else {
            return FALSE;
        }
    }
    
    /**
    * Clears the session values for the form builder, these are the vars 
    * that relate to the current state of the designer, selected input, 
    * tool and tool tab, leaves form_id set, just resets the state of the 
    * designer.
    * 
    * @param boolean $reset If TRUE also clears form_id
    * @return void
    */
    public function clearAll($reset=FALSE)
    {
        $this->field_id = NULL;
        $this->tool = NULL;
        $this->tab = NULL;
        $this->return = NULL;
        if($reset==TRUE) {
            $this->form_id = NULL;
        }
    }
    
    /**
    * Set the return module name, used when the user jumps to an item directly 
    * from another module
    * 
    * @param string $return Name of module to return to, example 'content'
    * @return void
    */
    public function setReturnModule($return) 
    {
    	$this->return = $return;
	}
	
	/**
	* Get the name of the return module, can be checked against to see if we 
	* need to include a return link in the designer
	* 
	* @return string|NULL
	*/
	public function returnModule() 
	{
		return $this->return;
	}    

    /**
    * Clear the selected field, this is called when the user switches the
    * tool when in editing mode
    *
    * @return void
    */
    public function clearFieldId()
    {
        $this->field_id = NULL;
    }
}