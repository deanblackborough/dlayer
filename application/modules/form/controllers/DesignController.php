<?php

/**
 * The form module design controller is the root of the form builder, this is
 * where the user builds a form to either add to a template, page or widget.
 *
 * The builder has a tool bar to the right that shows all the tools for the
 * form builder div and a ribbon at the top that updates based on either the
 * selected tool or the selected form field
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Form_DesignController extends Zend_Controller_Action
{
	/**
	 * Type hinting for action helpers, hints the property to the code
	 * hinting class which exists in the library
	 *
	 * @var Dlayer_Action_CodeHinting
	 */
	protected $_helper;

	private $session_dlayer;

	/**
	 * @var Dlayer_Session_Form
	 */
	private $session_form;

	private $layout;

	/**
	 * @var array Nav bar items
	 */
	private $nav_bar_items = array(
		array('uri' => '/dlayer/index/home', 'name' => 'Dlayer Demo', 'title' => 'Dlayer.com: Web development simplified'),
		array('uri' => '/form/index/index', 'name' => 'Form builder', 'title' => 'Form management'),
		array('uri' => '/dlayer/settings/index', 'name' => 'Settings', 'title' => 'Settings'),
		array('uri' => 'http://www.dlayer.com/docs/', 'name' => 'Docs', 'title' => 'Read the Docs for Dlayer'),
	);

	/**
	 * Initialise the controller, run any required set up code and set
	 * properties required by controller actions
	 *
	 * @return void
	 */
	public function init()
	{
		$this->_helper->authenticate();

		$this->_helper->setModule();

		$this->_helper->validateSiteId();

		$this->_helper->validateFormId();

		$this->session_dlayer = new Dlayer_Session();
		$this->session_form = new Dlayer_Session_Form();
	}

	/**
	 * Base action for the design controller, loads in the html for the menu,
	 * ribbon, modes, toolbar and form
	 *
	 * @return void
	 */
	public function indexAction()
	{
		$this->_helper->setLayout('designer');

		$this->view->dlayer_toolbar = $this->dlayerToolbar();
		$this->view->dlayer_form = $this->dlayerForm();
		$this->view->dlayer_ribbon = $this->dlayerRibbon();
		$this->view->return = $this->session_form->returnModule();

		$this->view->module = $this->getRequest()->getModuleName();
		$this->view->field_id = $this->session_form->fieldId();
		$this->view->tool = $this->session_form->tool();

		$this->_helper->setLayoutProperties($this->nav_bar_items, '/form/index/index',
			array('css/dlayer.css','css/designer-shared.css', 'css/designer-1170.css'),
			array('scripts/dlayer.js', 'scripts/designer.js', 'scripts/form-builder.js', 'scripts/preview-form-builder.js'),
			'Dlayer.com - Form builder', '/form/design/preview');
	}

	/**
	 * Preview for the completed form
	 *
	 * @return void
	 */
	public function previewAction()
	{
		$this->_helper->setLayout('preview');

		$this->view->dlayer_form = $this->dlayerFormPreview();

		$this->_helper->setLayoutProperties(array(), '', array('css/dlayer.css', 'css/preview.css'), array(),
			'Dlayer.com - Form preview');
	}

	/**
	 * Generate the html for the tool bar, the enabled tools for the module are
	 * selected and then passed to a view file. The view is generated using
	 * the tools array and then the result is passed back to the index action
	 *
	 * @return string
	 */
	private function dlayerToolbar()
	{
		$model_tool = new Dlayer_Model_Tool();

		$this->view->tools = $model_tool->tools($this->getRequest()->getModuleName());
		$this->view->tool = $this->session_form->tool();
		$this->view->field_id = $this->session_form->fieldId();

		return $this->view->render("design/toolbar.phtml");
	}

	/**
	 * Generate the html for the ribbon, there are two ribbon states, the initial state and when a tool is selected.
	 * The contents of the ribbon are loaded via Ajax, the method simply generates the container html
	 *
	 * @return string
	 */
	private function dlayerRibbon()
	{
		$tool = $this->session_form->tool();

		if($tool !== FALSE)
		{
			$html = $this->dlayerRibbonHtml($tool['tool'], $tool['tab'], $tool['sub_tool']);
		}
		else
		{
			$html = $this->view->render("design\\ribbon\\default.phtml");
		}

		$this->view->html = $html;

		return $this->view->render("design\\ribbon.phtml");
	}

	/**
	 * Generate the tabs for the selected tool, an empty container is generated for each tab which will be populated
	 * via an AJAX request
	 *
	 * @param string $tool
	 * @param string $tab
	 * @param string|NULL $sub_tool
	 * @return string
	 */
	private function dlayerRibbonHtml($tool, $tab, $sub_tool = NULL)
	{
		if($this->session_form->fieldId() !== NULL)
		{
			$edit_mode = TRUE;
		}
		else
		{
			$edit_mode = FALSE;
		}

		$model_tool = new Dlayer_Model_Tool();
		$tabs = $model_tool->toolTabs('form', $tool, $edit_mode);


		if($tabs != FALSE)
		{
			$this->view->selected_tool = $tool;
			$this->view->selected_tab = $tab;
			$this->view->selected_sub_tool = $sub_tool;
			$this->view->tabs = $tabs;
			$this->view->module = 'form';
			$html = $this->view->render('design/ribbon/ribbon-html.phtml');
		}
		else
		{
			$html = $this->view->render('design/ribbon/default.phtml');
		}

		return $html;
	}

	/**
	 * Generate the html for the requested tool tab, called via AJAX by the
	 * base view.
	 *
	 * The tool and tab are checked to see if they are valid and then the
	 * data required to generate the tab is pulled and passed to the view.
	 *
	 * @return string
	 */
	public function ribbonTabHtmlAction()
	{
		$this->_helper->disableLayout();

		$module = $this->getRequest()->getModuleName();
		$tool = $this->getParamAsString('tool');
		$sub_tool = $this->getParamAsString('sub_tool');
		$tab = $this->getParamAsString('tab');

		$ribbon_tab = new Dlayer_Ribbon_Tab();

		if($tab !== NULL && $tool !== NULL)
		{
			$model_tool = new Dlayer_Model_Tool();

			$exists = $model_tool->tabExists($this->getRequest()->getModuleName(), $tool, $tab);

			if($exists != FALSE)
			{
				if($this->session_form->fieldId() !== NULL)
				{
					$edit_mode = TRUE;
				}
				else
				{
					$edit_mode = FALSE;
				}

				$this->session_form->setRibbonTab($tab, $sub_tool);

				$this->view->color_picker_data = $this->colorPickerData();
				$this->view->data = $ribbon_tab->viewData($module, $tool, $tab,
					$model_tool->multiUse($module, $tool, $tab), $edit_mode);
				$this->view->edit_mode = $edit_mode;

				if($sub_tool === NULL)
				{
					$this->view->addScriptPath(DLAYER_LIBRARY_PATH . "\\Dlayer\\DesignerTool\\FormBuilder\\" .
						$tool . "\\scripts\\");
				}
				else
				{
					$this->view->addScriptPath(DLAYER_LIBRARY_PATH . "\\Dlayer\\DesignerTool\\FormBuilder\\" .
						$tool . "\\SubTool\\" . $sub_tool ."\\scripts\\");
				}

				$html = $this->view->render($tab . '.phtml');
			}
			else
			{
				$html = $this->view->render("design\\ribbon\\default.phtml");
			}
		}
		else
		{
			$html = $this->view->render("design\\ribbon\\default.phtml");
		}

		$this->view->html = $html;
	}

	/**
	 * Generate the form html. This method fetches all the elements that have
	 * been added to the form and renders a working version of the form
	 *
	 * @return string Html
	 */
	private function dlayerForm()
	{
		$site_id = $this->session_dlayer->siteId();
		$form_id = $this->session_form->formId();
		$field_id = $this->session_form->fieldId();

		$designer_form = new Dlayer_Designer_Form($site_id, $form_id,
			FALSE, $field_id);

		$model_settings = new Dlayer_Model_View_Settings();
		$model_layout = new Dlayer_Model_View_Form_Layout();

		$this->view->base_font_family = $model_settings->baseFontFamily(
			$site_id, 'form');
		$this->view->titles = $model_layout->titles($site_id, $form_id);

		$this->view->form = $designer_form->form();
		$this->view->field_id = $field_id;
		$this->view->field_styles = $designer_form->fieldStyles();

		return $this->view->render("design/form.phtml");
	}

	/**
	 * Generate the preview form html
	 *
	 * @return string Html
	 */
	private function dlayerFormPreview()
	{
		$site_id = $this->session_dlayer->siteId();
		$form_id = $this->session_form->formId();
		$field_id = $this->session_form->fieldId();

		$designer_form = new Dlayer_Designer_Form($site_id, $form_id, TRUE,
			NULL);

		$model_settings = new Dlayer_Model_View_Settings();
		$model_layout = new Dlayer_Model_View_Form_Layout();

		$this->view->base_font_family = $model_settings->baseFontFamily(
			$this->session_dlayer->siteId(), 'form');
		$this->view->titles = $model_layout->titles($site_id, $form_id);

		$this->view->form = $designer_form->form();
		$this->view->field_styles = $designer_form->fieldStyles();

		return $this->view->render("design/form-preview.phtml");
	}

	/**
	 * Set the tool for the tool bar, validates that the tool is valid, sets
	 * the params and then redirects the user with the tool selected. The
	 * ribbon will be updated to show the details for the selected tool.
	 *
	 * The cancel tool processes and then returns the user back to the base of
	 * the designer with nothing selected.
	 *
	 * @return void
	 */
	public function setToolAction()
	{
		$this->_helper->disableLayout(FALSE);

		$tool = $this->getRequest()->getParam('tool');

		if($tool !== NULL && strlen($tool) > 0)
		{
			if($tool !== 'Cancel')
			{
				if($this->session_form->setTool($tool) === TRUE)
				{
					$reset = $this->getRequest()->getParam('reset');
					if($reset !== NULL && $reset === 1)
					{
						$this->session_form->clearFieldId();
					}
					$this->redirect('/form/design');
				}
				else
				{
					$this->cancelTool();
				}
			}
			else
			{
				$this->cancelTool();
			}
		}
		else
		{
			$this->cancelTool();
		}
	}

	/**
	 * Cancel tool, clears the currently set content module vars, user is
	 * returned to the base of the content manager with no tools, divs or
	 * content items selected.
	 *
	 * @return void
	 */
	private function cancelTool()
	{
		$this->session_form->clearAll();
		$this->redirect('/form/design');
	}

	/**
	 * Sets the selected field and returns the user back to the designer so that
	 * they can edit the selected field
	 *
	 * @return void
	 */
	public function setSelectedFieldAction()
	{
		$this->_helper->disableLayout(FALSE);

		$id = $this->getRequest()->getParam('selected');
		$tool = $this->getRequest()->getParam('tool');
		$type = $this->getRequest()->getParam('type');

		if($this->session_form->setFieldId($id, $type) == TRUE &&
			$this->session_form->setTool($tool) == TRUE
		)
		{
			$this->_redirect('/form/design');
		}
		else
		{
			$this->cancelTool();
		}
	}

	/**
	 * Move the selected field, before passing the request to the model
	 * we check to ensure that the field can be moved in the requested
	 * direction and also that the field is valid, as in the type matches and
	 * the field belongs to the current form
	 *
	 * @return div
	 */
	public function moveFieldAction()
	{
		$this->_helper->disableLayout(FALSE);

		$direction = $this->getRequest()->getParam('direction');
		$field_type = $this->getRequest()->getParam('type');
		$field_id = $this->getRequest()->getParam('field-id');

		$model_form_field = new Dlayer_Model_Form_Field();

		if($model_form_field->valid($field_id,
				$this->session_dlayer->siteId(), $this->session_form->formId(),
				$field_type) == TRUE &&
			in_array($direction, array('up', 'down')) == TRUE
		)
		{
			$model_form_field->moveFormField($direction, $field_type,
				$field_id, $this->session_form->formId(),
				$this->session_dlayer->siteId());
		}

		$this->_redirect('/form/design/');
	}

	/**
	 * Fetch the data for the color picker, passed to the ribbon tab view
	 * so color picker can be pre populated for all tabs.
	 *
	 * Returns an array with two indexs, palettes and history, if there was a
	 * problem fetching data FALSE will be returned for the index that failed,
	 * the view will display a friendly error message
	 *
	 * @return array
	 */
	private function colorPickerData()
	{
		$model_palettes = new Dlayer_Model_Palette();

		$site_id = $this->session_dlayer->siteId();

		return array(
			'palettes' => $model_palettes->palettes($site_id),
			'history' => $model_palettes->lastNColors($site_id),
		);
	}

	/**
	 * Get a post param
	 *
	 * @todo Move this out of controller
	 * @param string $param
	 * @param integer|NULL $default
	 * @return integer|NULL
	 */
	private function getParamAsInteger($param, $default = NULL)
	{
		return ($this->getRequest()->getParam($param) !== '' ? intval($this->getRequest()->getParam($param)) : $default);
	}

	/**
	 * Get a post param
	 *
	 * @todo Move this out of controller
	 * @param string $param
	 * @param integer|NULL $default
	 * @return string|NULL
	 */
	private function getParamAsString($param, $default = NULL)
	{
		return $this->getRequest()->getParam($param, $default);
	}
}
