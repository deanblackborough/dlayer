<?php
/**
* Base form class for all the Form builder ribbon forms
*
* @author Dean Blackborough
* @copyright G3D Development Limited
* @version $Id: Form.php 1831 2014-05-12 21:44:14Z Dean.Blackborough $
*/
abstract class Dlayer_Form_Module_Form extends Dlayer_Form
{
	protected $form_id;
    protected $field_data = array();
    protected $edit_mode;
    
    protected $elements_data;

    protected $tool;
    protected $field_type;
    protected $sub_tool_model;

    /**
    * Set the initial properties for the form
    *
    * @param integer $form_id
    * @param array $field_data Field data array, either an array with all the 
    * 						   attrubutes and their current value or an array 
    * 						   with FALSE as the value for each attribute
    * @param boolean $edit_mode Is the tool in edit mode
    * @param array|NULL $options Zend form options data array
    * @return void
    */
    public function __construct($form_id, array $field_data, $edit_mode=FALSE, 
    $options=NULL)
    {
        $this->form_id = $form_id;
        $this->field_data = $field_data;
        $this->edit_mode = $edit_mode;

        parent::__construct($options=NULL);
    }
    
    /**
    * Add the default decorators to use for the form inputs
    *
    * @return void
    */
    protected function addDefaultElementDecorators()
    {
        $this->setElementDecorators(array(array('ViewHelper',
        array('tag' => 'div', 'class'=>'input')), array('Description'),
        array('Errors'), array('Label'), array('HtmlTag',
        array('tag' => 'div', 'class'=>'input'))));
    }

    /**
    * Add any custom decorators, these are inputs where we need a little more
    * control over the html, an example being the submit button
    *
    * @return void
    */
    protected function addCustomElementDecorators()
    {
        $this->elements['submit']->setDecorators(array(array('ViewHelper'),
        array('HtmlTag', array('tag' => 'div', 'class'=>'save'))));
    }
    
    /**
    * Check field array for field value, either return assigned value or FALSE
    * if field value not set in data array
    * 
    * @param string $field
    * @return string|FALSE
    */
    protected function fieldValue($field) 
    {
		if(array_key_exists($field, $this->field_data) == TRUE 
        && $this->field_data[$field] != FALSE) {
        	return $this->field_data[$field];
		} else {
			return FALSE;
		}
    }
    
    /**
    * Check field array for field attribute value, either return assigned 
    * attribute value or FALSE if field attribute value not set in data array
    * 
    * @param string $attribute
    * @return string|FALSE
    */
    protected function fieldAttributeValue($attribute) 
    {
		if(array_key_exists('attributes', $this->field_data) == TRUE
		&& array_key_exists($attribute, $this->field_data['attributes']) == TRUE 
		&& $this->field_data['attributes'][$attribute] != FALSE) {
        	return $this->field_data['attributes'][$attribute];
		} else {
			return FALSE;
		}
    }
}