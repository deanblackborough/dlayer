<?php

/**
 * Jumbotron content item view helper, a jumbotron is used to highlight something on a page, it features a title,
 * sub title and optional button
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Dlayer_View_Jumbotron extends Zend_View_Helper_Abstract
{
	/**
	 * Override the hinting for the view property so that we can see the view
	 * helpers that have been defined
	 *
	 * @var Dlayer_View_Codehinting
	 */
	public $view;

	/**
	 * @var array Data array for the content item
	 */
	private $data;

	/**
	 * Constructor for view helper, data is set via the setter methods
	 *
	 * @param array $data Content item data array
	 * @return Dlayer_View_Jumbotron
	 */
	public function jumbotron(array $data)
	{
		$this->resetParams();

		$this->data = $data;

		return $this;
	}

	/**
	 * Reset any internal params, we do this because the view helper could be called many times within the view script
	 *
	 * @return void
	 */
	private function resetParams()
	{
		$this->data = array();
	}

	/**
	 * Generate the html for the content item
	 *
	 * @return string
	 */
	private function render()
	{
		// The id of a content item is defined as follows [tool]:[item_type]:[id]
		$id = 'jumbotron:jumbotron:' . $this->view->escape($this->data['content_id']);

		$html = '<div class="jumbotron">';
		$html .= '<h1>' . $this->view->escape($this->data['title']) . '</h1>';
		$html .= '<p>' . $this->view->escape($this->data['sub_title']) . '</p>';

		if(strlen($this->data['button_label']) > 0)
		{
			$html .= '<p><a class="btn btn-primary btn-lg" href="#" role="button">';
			$html .= $this->view->escape($this->data['button_label']);
			$html .= '</a></p>';
		}

		$html .= '</div>';

		return $html;
	}

	/**
	 * The view helper can be output directly, there is no need to call the render method, simply echo or print
	 *
	 * @return string
	 */
	public function __toString()
	{
		return $this->render();
	}
}
