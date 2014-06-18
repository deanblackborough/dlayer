<?php
/**
* Custom session class for the template module, store vars which we need to
* manage the environment, attemping to not have visible get vars so this class
* will deal with the values
*
* @author Dean Blackborough <dean@g3d-development.com>
* @copyright G3D Development Limited
* @version $Id: Template.php 1724 2014-04-13 15:12:59Z Dean.Blackborough $
*/
class Dlayer_Session_Template extends Zend_Session_Namespace
{
    /**
    * @param string $namespace
    * @param bool $singleInstance
    * @return void
    */
    public function __construct($namespace = 'dlayer_session_template',
    $singleInstance = false)
    {
        parent::__construct($namespace, $singleInstance);

        $this->setExpirationSeconds(3600);
    }

    /**
    * Set the id for the site template that the user wants to work on
    *
    * @param integer $id
    * @return void
    */
    public function setTemplateId($id)
    {
        $this->template_id = intval($id);
    }

    /**
    * Get the id of the template that the user is currently working on
    *
    * @return integer|NULL
    */
    public function templateId()
    {
        return $this->template_id;
    }

    /**
    * Set the id of the template div that the user is working with, also checks
    * to ensure that the selected div belongs to the current template and site
    *
    * @param integer $id
    * @return boolean
    */
    public function setDivId($id)
    {
        $model_template = new Dlayer_Model_View_Template();
        $model_div = new Dlayer_Model_Template_Div();
        $session_dlayer = new Dlayer_Session();
        
        if($id != 0) {
            if($model_div->valid($session_dlayer->siteId(),
            $this->templateId(), $id) == TRUE) {
                $this->div_id = intval($id);
                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            if($model_template->templateEmpty($session_dlayer->siteId(),
            $this->templateId()) == TRUE) {
                $this->div_id = intval($id);
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    /**
    * Get the id of the selected template div
    *
    * @return integer|NULL
    */
    public function divId()
    {
        return $this->div_id;
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
            $this->tool_destructive = $tool_details['destructive'];
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
                         'model'=>$this->tool_model, 
                         'destructive'=>$this->tool_destructive);
        } else {
            return FALSE;
        }
    }
    
    /**
    * Clears the session values for the template designer, these are the vars 
    * that relate to the current state of the designer, selected div, 
    * tool and tool tab, leaves template_id set, just resets the state of the 
    * designer.
    * 
    * @param boolean $reset If TRUE also clears template_id
    * @return void
    */
    public function clearAll($reset=FALSE)
    {
        $this->div_id = NULL;
        $this->tool = NULL;
        $this->tab = NULL;
        if($reset == TRUE) {
            $this->template_id = NULL;
        }
    }
}