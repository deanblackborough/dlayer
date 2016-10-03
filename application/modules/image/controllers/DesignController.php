<?php

/**
 * The design controller is the root of the image library, this is where the
 * user manages the images in their library
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Image_DesignController extends Zend_Controller_Action
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
	 * @var Dlayer_Session_Image
	 */
	private $session_image;

	private $designer_image_library;

	/**
	 * @var array Nav bar items
	 */
	private $nav_bar_items = array(
		array('uri' => '/dlayer/index/home', 'name' => 'Dlayer Demo', 'title' => 'Dlayer.com: Web development simplified'),
		array('uri' => '/image/index/index', 'name' => 'Image library', 'title' => 'Image management'),
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

		$this->session_dlayer = new Dlayer_Session();
		$this->session_image = new Dlayer_Session_Image();

		// Set category and sub category values if currently NULL
		$category_id = $this->session_image->imageId(
			Dlayer_Session_Image::CATEGORY);
		$sub_category_id = $this->session_image->imageId(
			Dlayer_Session_Image::SUB_CATEGORY);

		if($category_id == NULL || $sub_category_id == NULL)
		{
			$model_image_categories = new Dlayer_DesignerTool_ImageLibrary_Category_Model();

			$default_category = $model_image_categories->category(
				$this->session_dlayer->site_id, 0);
			$default_sub_category = $model_image_categories->subCategory(
				$this->session_dlayer->site_id, $default_category['id'], 0);

			$this->session_image->setEditMode();
			$this->session_image->setImageId($default_category['id'],
				Dlayer_Session_Image::CATEGORY);
			$this->session_image->setImageId($default_sub_category['id'],
				Dlayer_Session_Image::SUB_CATEGORY);
		}

		$this->designer();
	}

	/**
	 * Instantiate the designer class
	 *
	 * @return void
	 */
	private function designer()
	{
		$sort_ordering = $this->session_image->sortOrder();

		$this->designer_image_library = new Dlayer_Designer_ImageLibrary(
			$this->session_dlayer->siteId(),
			$this->session_image->imageId(Dlayer_Session_Image::CATEGORY),
			$this->session_image->imageId(Dlayer_Session_Image::SUB_CATEGORY),
			$sort_ordering['sort'], $sort_ordering['order'],
			$this->session_image->imageId(Dlayer_Session_Image::IMAGE),
			$this->session_image->imageId(Dlayer_Session_Image::VERSION));
	}

	/**
	 * Base action for the designer controller, loads in the html for the
	 * menu, ribbon, modes, toolbar and template
	 *
	 * @return void
	 */
	public function indexAction()
	{
		$this->view->dlayer_toolbar = $this->dlayerToolbar();
		$this->view->dlayer_library = $this->dlayerLibrary();
		$this->view->dlayer_ribbon = $this->dlayerRibbon();

		$this->view->module = $this->getRequest()->getModuleName();
		$this->view->tool = $this->session_image->tool();
		$this->view->filter_form = $this->designer_image_library->filterForm();

		$this->view->image_id = $this->session_image->imageId();

		$this->_helper->setLayoutProperties($this->nav_bar_items, '/image/design/index',
			array('css/dlayer.css', 'css/designer-shared.css', 'css/designer-970.css',),
			array('scripts/dlayer.js','scripts/designer.js'),
			'Dlayer.com - Image library');
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

		$this->view->image_id = $this->session_image->imageId();

		$this->view->tools = $model_tool->tools($this->getRequest()->getModuleName());
		$this->view->tool = $this->session_image->tool();

		return $this->view->render("design/toolbar.phtml");
	}

	/**
	 * Generate the html for the ribbon, there are three ribbon states,
	 * the initial state, div selected and then tool selected. The contents
	 * of the ribbon are loaded via AJAX, this method just generates the
	 * container html for when a tool is selected and then the html for the
	 * two base states
	 *
	 * @return string
	 */
	private function dlayerRibbon()
	{
		$tool = $this->session_image->tool();

		if($tool != FALSE)
		{
			$html = $this->dlayerRibbonHtml($tool['tool'], $tool['tab']);
		}
		else
		{
			$ribbon = new Dlayer_Ribbon();

			$image_id = $this->session_image->imageId(Dlayer_Session_Image::IMAGE);

			if($image_id != NULL)
			{
				$html = $this->view->render($ribbon->selectedViewScriptPath());
			}
			else
			{
				$html = $this->view->render($ribbon->defaultViewScriptPath());
			}
		}

		$this->view->html = $html;

		return $this->view->render('design/ribbon.phtml');
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
		if($this->session_image->editMode() === TRUE)
		{
			$edit_mode = TRUE;
		}
		else
		{
			$edit_mode = FALSE;
		}

		$model_tool = new Dlayer_Model_Tool();
		$tabs = $model_tool->toolTabs('image', $tool, $edit_mode);

		if($tabs !== FALSE)
		{
			$this->view->selected_tool = $tool;
			$this->view->selected_tab = $tab;
			$this->view->selected_sub_tool = $sub_tool;
			$this->view->tabs = $tabs;
			$this->view->module = 'image';
			$html = $this->view->render('design/ribbon/ribbon-html.phtml');
		}
		else
		{
			$html = $this->view->render('design/ribbon/default.phtml');
		}

		return $html;
	}

	/**
	 * Generate the html for the requested tool tab, called via Ajax. The tool and tab are checked to ensure they are
	 * valid and active and then the data required to generate the tool tab is fetched and passed too the view
	 *
	 * @todo Update code, needs to actually check validity of tool and current status
	 * @throws \Exception
	 * @return string
	 */
	public function ribbonTabHtmlAction()
	{
		$this->_helper->disableLayout();

		$module = $this->getRequest()->getModuleName();
		$tool = $this->getParamAsString('tool');
		$sub_tool = $this->getParamAsString('sub_tool');
		$tab = $this->getParamAsString('tab');

		if($tool !== NULL && $tab !== NULL)
		{
			$model_tool = new Dlayer_Model_Tool();

			$exists = $model_tool->tabExists($this->getRequest()->getModuleName(), $tool, $tab);

			if($exists === TRUE)
			{
				if($this->session_image->editMode() === TRUE)
				{
					$edit_mode = TRUE;
				}
				else
				{
					$edit_mode = FALSE;
				}

				/**
				 * @todo Need to remove this class eventually
				 */
				$ribbon_tab = new Dlayer_Ribbon_Tab();

				$this->session_image->setRibbonTab($tab, $sub_tool);
				$this->view->data = $ribbon_tab->viewData($module, $tool, $tab,
					$model_tool->multiUse($module, $tool, $tab), $edit_mode);

				if($sub_tool === NULL)
				{
					$this->view->addScriptPath(DLAYER_LIBRARY_PATH . "\\Dlayer\\DesignerTool\\ImageLibrary\\" .
						$tool . "\\scripts\\");
				}
				else
				{
					$this->view->addScriptPath(DLAYER_LIBRARY_PATH . "\\Dlayer\\DesignerTool\\ImageLibrary\\" .
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
	 * Generate the html for the library, list of thumbnails for the selected
	 * category and subcategory or if an image is selected the detail page
	 * for the image
	 *
	 * @return string
	 */
	private function dlayerLibrary()
	{
		if($this->session_image->imageId() == NULL)
		{
			return $this->dlayerLibraryThumbnails();
		}
		else
		{
			return $this->dlayerLibraryDetail();
		}
	}

	/**
	 * Display thumbnails
	 */
	private function dlayerLibraryThumbnails()
	{
		$per_page = Dlayer_Config::IMAGE_LIBRARY_THUMB_PER_PAGE;
		$start = Dlayer_Helper::getInteger('start', 0);

		$sort_order = $this->session_image->sortOrder();
		$images = $this->designer_image_library->images(
			$per_page, $start);

		$this->view->sort = $sort_order['sort'];
		$this->view->sort_order = $sort_order['order'];
		$this->view->images = $images['results'];
		$this->view->title = $this->designer_image_library->titleData();

		// Pagination params
		$this->view->images_count = $images['count'];
		$this->view->per_page = $per_page;
		$this->view->start = $start;

		return $this->view->render("design/library.phtml");
	}

	/**
	 * Display detail
	 */
	private function dlayerLibraryDetail()
	{
		$detail = $this->designer_image_library->detail();
		$versions = $this->designer_image_library->versions();
		$usage = $this->designer_image_library->usage();

		// Unable to correctly fetch data, clear all session data and return 
		// the user to the library
		if($detail == FALSE || $versions == FALSE)
		{
			$this->session_image->clearAll();
			$this->_redirect('/image');
		}

		$this->view->detail = $detail;
		$this->view->versions = $versions;
		$this->view->usage = $usage;
		$this->view->image_id = $this->session_image->imageId();
		$this->view->version_id = $this->session_image->imageId(
			Dlayer_Session_Image::VERSION);

		return $this->view->render("design/detail.phtml");
	}

	/**
	 * Set the selected image and versionn, after setting the properties the
	 * user is sent to the detyail page for an image
	 *
	 * @return void
	 */
	public function setSelectedImageAction()
	{
		$this->_helper->disableLayout(FALSE);

		$image_id = $this->getRequest()
			->getParam('image');
		$version_id = $this->getRequest()
			->getParam('version');

		if($this->session_image->setImageId($image_id) == TRUE &&
			$this->session_image->setImageId($version_id,
				Dlayer_Session_Image::VERSION) == TRUE
		)
		{
			$this->session_image->clearTool();
			$this->_redirect('/image/design');
		}
		else
		{
			$this->cancelTool();
		}
	}

	/**
	 * Set the tool, validates that the requested tool is valid and then sets
	 * the params in the content session.
	 *
	 * After a tool has been set the view is refreshed, the ribbon and designer
	 * willbe updated based on the selected tool or item
	 *
	 * Unlike all the other tools the cancel tool clears all template session
	 * values before refreshing the view
	 *
	 * @return void
	 */
	public function setToolAction()
	{
		$this->_helper->disableLayout(FALSE);

		$tool = $this->getRequest()
			->getParam('tool');
		$edit = $this->getRequest()
			->getParam('edit', 0);

		$this->session_image->setEditMode();

		if($tool != NULL && strlen($tool) > 0)
		{
			if($tool != 'cancel')
			{
				if($this->session_image->setTool($tool) == TRUE)
				{
					if($edit == 1)
					{
						$this->session_image->setEditMode(1);
					}
					$this->_redirect('/image/design');
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
	 * The cancel tool clears all the currently set content template vars, the
	 * user is returned to the manager after the session is cleared
	 *
	 * @return void
	 */
	private function cancelTool()
	{
		$this->session_image->clearAll();
		$this->_redirect('/image/design');
	}

	/**
	 * Set the filter
	 *
	 * @todo Need to chjeck that the submitted values are valid values
	 * @return void
	 */
	public function filterAction()
	{
		if(array_key_exists('category_filter', $_POST) == TRUE &&
			array_key_exists('sub_category_filter', $_POST) == TRUE
		)
		{
			$this->session_image->setImageId($_POST['category_filter'],
				Dlayer_Session_Image::CATEGORY);
			$this->session_image->setImageId($_POST['sub_category_filter'],
				Dlayer_Session_Image::SUB_CATEGORY);

			$this->session_image->setEditMode();
		}

		$this->_redirect('/image/design');
	}

	/**
	 * Set the sort options, sets the values in the session and them returns the
	 * user to the designer
	 *
	 * @return void
	 */
	public function setSortAction()
	{
		$sort = $this->getRequest()
			->getParam('sort');
		$order = $this->getRequest()
			->getParam('order');

		$sort_order = $this->session_image->sortOrder();

		// User only needs to set one param at a time so we pull the current 
		// values from the session if noi values are submitted for ether sort 
		// or order
		if($sort == NULL)
		{
			$sort = $sort_order['sort'];
		}
		if($order == NULL)
		{
			$order = $sort_order['order'];
		}

		$this->session_image->setSort($sort, $order);

		$this->_redirect('/image/design/index');
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
