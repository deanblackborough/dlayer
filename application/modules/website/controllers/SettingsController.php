<?php
/**
* Settings
* 
* @author Dean Blackborough <dean@g3d-development.com>
* @copyright G3D Development Limited
*/
class Website_SettingsController extends Zend_Controller_Action 
{
	/**
	* Type hinting for action helpers, hints the property to the code 
	* hinting class which exists in the library
	* 
	* @var Dlayer_Action_CodeHinting
	*/
	protected $_helper;

	private $session_dlayer;

	private $layout;

	/**
	* Init the controller, run any set up code required by all the actions 
	* in the controller
	* 
	* @return void
	*/
	public function init()
	{
		$this->_helper->authenticate();

		$this->_helper->setModule();

		$this->_helper->validateSiteId();

		$this->session_dlayer = new Dlayer_Session();

		// Include js and css files in layout
		$this->layout = Zend_Layout::getMvcInstance();
		$this->layout->assign('js_include', array('scripts/dlayer.js'));
		$this->layout->assign('css_include', array('styles/forms.css', 
			'styles/settings.css'));
	}

	/**
	* Base settings page for the web site manager
	* 
	* @return void
	*/
	public function indexAction()
	{
		$model_sites = new Dlayer_Model_Site();

		$this->dlayerMenu('/website/settings/index');
		$this->settingsMenus('Web site', '/website/settings/index', 
			'/website/settings/index');

		$this->view->site = $model_sites->site($this->session_dlayer->siteId());

		$this->layout->assign('css_include', array('css/dlayer.css'));
		$this->layout->assign('title', 'Dlayer.com - Web site manager settings');
	}

	/**
	* Generate the base menu bar for the application.
	* 
	* @param string $url Selected url
	* @return string Html
	*/
	private function dlayerMenu($url) 
	{
		$items = array(array('url'=>'/image/index/index', 
			'name'=>'Web site manager', 'title'=>'Dlayer Web site manager'), 
			array('url'=>'', 'name'=>'Designers', 'title'=>'Choose a designer', 
				'children'=>array(
					array('url'=>'/template/index/index', 
						'name'=>'Template designer', 'title'=>'Dlayer Template designer'), 
					array('url'=>'/content/index/index', 
						'name'=>'Content manager', 'title'=>'Dlayer Content manager'), 
					array('url'=>'/form/index/index', 
						'name'=>'Form builder', 'title'=>'Dlayer Form builder'), 
					array('url'=>'/image/index/index', 
						'name'=>'Image library', 'title'=>'Dlayer Image library'))), 
			array('url'=>'/website/settings/index', 
				'name'=>'Settings', 'title'=>'Website manager settings'), 
			array('url'=>'/dlayer/index/logout', 'name'=>'<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout (' . 
				$this->session_dlayer->identity() . ')', 'title'=>'Logout'));

		$this->layout->assign('nav', array('class'=>'top_nav', 
			'items'=>$items, 'active_url'=>$url));
	}

	/**
	* Generate the setting and section menus for settings
	*
	* @param string $group Settings group to fetch settings for
	* @param string $group_url Active setting group url
	* @param string $setting_url Active setting url
	* @return string Html
	*/
	private function settingsMenus($group, $group_url='', $setting_url='')
	{
		$model_settings = new Dlayer_Model_Settings();
		$setting_groups = $model_settings->settingGroups();

		$settings = $model_settings->settings($group);

		$this->view->setting_groups = array('class'=>'setting_groups', 
			'items'=>$setting_groups, 'active_url'=>$group_url);

		$this->view->settings = array('class'=>'settings', 
			'items'=>$settings, 'active_url'=>$setting_url);
	}
}