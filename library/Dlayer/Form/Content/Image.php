<?php
/**
* Form for the image content item tool
* 
* This form is used by the image content item tool to allow a user to select 
* an image from their image library and also define the display options. This 
* form is also used by the edit version of the tool
*
* @author Dean Blackborough
* @copyright G3D Development Limited
*/
class Dlayer_Form_Content_Image extends Dlayer_Form_Module_Content
{
	/**
	* Set the initial properties for the form
	* 
	* @param integer $page_id
	* @param integer $div_id
	* @param integer $content_row_id
	* @param array $content_item The existing data for the content item, 
	* 	array values will be FALSE in add mode, populated in edit mode
	* @param boolean $edit_mode Is the tool in edit mode
	* @param integer $multi_use The multi use value for the tool, either 1 or 0
	* @param array|NULL $options Zend form options data array
	* @return void
	*/
	public function __construct($page_id, $div_id, $content_row_id, 
		array $content_item, $edit_mode=FALSE, $multi_use=0, $options=NULL)
	{
		$this->tool = 'image';
		$this->content_type = 'image';
		$this->sub_tool_model = NULL;

		parent::__construct($page_id, $div_id, $content_row_id, 
			$content_item, $edit_mode, $multi_use, $options);
	}

	/**
	* Initialise the form, sets the url, action method and calls the functions 
	* to build the form
	*
	* @return void
	*/
	public function init()
	{
		$this->setAction('/content/process/tool');

		$this->setMethod('post');
		
		$this->formElementsData();

		$this->setUpFormElements();

		$this->validationRules();

		if($this->edit_mode == FALSE) {
			$legend = 'Add <small>Add a new image content item</small>'; 
		} else {
			$legend = 'Edit <small>Edit the image content item</small>';
		}

		$this->addElementsToForm('image_item', $legend, $this->elements);

		$this->addDefaultElementDecorators();

		$this->addCustomElementDecorators();
	}
	
	/**
	* Fetch the data required by the form elements, in this case the list of 
	* images for the image select
	* 
	* @todo THis is only here till picker works.
	* @return void Writes the data to the $this->element_data property
	*/
	private function formElementsData()
	{
		$model_image_library = new Dlayer_Model_Image_Library();
		
		$session_dlayer = new Dlayer_Session();

		$this->elements_data['null'] = 'Select image';

		foreach($model_image_library->imagesArrayForSelect(
			$session_dlayer->siteId()) as $k => $v) {
			$this->elements_data[$k] = $v;
		}
	}

	/**
	* Set up all the form elements required by the tool, this is broekn down 
	* into two sections, the hidden elements that manage the environment and 
	* tool and the user visible elements for the user
	* 
	* @return void The form elements are written to the private 
	* 	$this->elements array
	*/
	protected function setUpFormElements()
	{
		$this->toolElements();

		$this->userElements();
	}

	/**
	* Set up all the tool and environment elements, there are all the elements 
	* that define the tool being used and the environment/session values 
	* currently set in the designer
	*
	* @return void The form elements are written to the private 
	* 	$this->elements array
	*/
	private function toolElements()
	{
		$page_id = new Zend_Form_Element_Hidden('page_id');
		$page_id->setValue($this->page_id);

		$this->elements['page_id'] = $page_id;

		$div_id = new Zend_Form_Element_Hidden('div_id');
		$div_id->setValue($this->div_id);

		$this->elements['div_id'] = $div_id;
		
		$content_row_id = new Zend_Form_Element_Hidden('content_row_id');
		$content_row_id->setValue($this->content_row_id);

		$this->elements['content_row_id'] = $content_row_id;

		$tool = new Zend_Form_Element_Hidden('tool');
		$tool->setValue($this->tool);

		$this->elements['tool'] = $tool;

		$content_type = new Zend_Form_Element_Hidden('content_type');
		$content_type->setValue($this->content_type);

		$this->elements['content_type'] = $content_type;

		if(array_key_exists('id', $this->content_item) == TRUE 
		&& $this->content_item['id'] != FALSE) {
			$content_id = new Zend_Form_Element_Hidden('content_id');
			$content_id->setValue($this->content_item['id']);

			$this->elements['content_id'] = $content_id;
		}

		$multi_use = new Zend_Form_Element_Hidden('multi_use');
		$multi_use->setValue($this->multi_use);
		$multi_use->setBelongsTo('params');

		$this->elements['multi_use'] = $multi_use;
	}

	/**
	* Set up the user elements, these are the fields that the user interacts 
	* with
	* 
	* @return void The form elements are written to the private 
	* 	$this->elements array
	*/
	private function userElements()
	{
		$image = new Zend_Form_Element_Select('version_id');
		$image->setLabel('Image');
		$image->setDescription('Select an image from your Image library.');
		$image->setMultiOptions($this->elements_data);
		$image->setAttribs(array('class'=>'form-control input-sm'));
		$image->setBelongsTo('params');
		$image->setRequired();
		
		if(array_key_exists('version_id', $this->content_item) == TRUE && 
			$this->content_item['version_id'] != FALSE) {

			$image->setValue($this->content_item['version_id']);
		}
		
		$this->elements['version_id'] = $image;
		
		$expand = new Zend_Form_Element_Select('expand');
		$expand->setLabel('Expand?');
		$expand->setDescription('Do you want your viewers to be able to see an 
			expanded version of your image?');
		$expand->setMultiOptions(array(
			0=>'No - Inline image only', 
			1=>'Yes - Full size image displays in a dialog on click'));
		$expand->setAttribs(array('class'=>'form-control input-sm'));
		$expand->setBelongsTo('params');
		$expand->setRequired();
		
		if(array_key_exists('expand', $this->content_item) == TRUE && 
			$this->content_item['expand'] != FALSE) {

			$expand->setValue($this->content_item['expand']);
		}
		
		$this->elements['expand'] = $expand;
		
		$caption = new Zend_Form_Element_Textarea('caption');
		$caption->setLabel('Caption');
		$caption->setAttribs(array('cols'=>50, 'rows'=>5, 
			'placeholder'=>'e.g., Caption explaining image...', 
			'class'=>'form-control input-sm'));
		$caption->setDescription('Enter an optional caption which will appear 
			below your image.');
		$caption->setBelongsTo('params');
		
		if(array_key_exists('caption', $this->content_item) == TRUE 
			&& $this->content_item['caption'] != FALSE) {
			
			$caption->setValue($this->content_item['caption']);
		}

		$this->elements['caption'] = $caption;
		
		$submit = new Zend_Form_Element_Submit('submit');
		$submit->setAttribs(array('class'=>'btn btn-primary'));
		if($this->edit_mode == FALSE) {
			$submit->setLabel('Insert');
		} else {
			$submit->setLabel('Save');
		}

		$this->elements['submit'] = $submit;
	}

	/**
	* Add the validation rules for the form elements and set the custom error
	* messages
	*
	* @return void
	*/
	protected function validationRules()
	{

	}
}