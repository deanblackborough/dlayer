<?php

/**
 * Content page view helper, generates all the html for a content page by first creating the structure of the page by
 * adding the rows and columns and then assigning the content items to the rows
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Dlayer_View_ContentPage extends Zend_View_Helper_Abstract
{
	/**
	 * Override the hinting for the view property so that we can see the view
	 * helpers that have been defined
	 *
	 * @var Dlayer_View_Codehinting
	 */
	public $view;

	/**
	 * Generated html
	 *
	 * @var string
	 */
	private $html;

	/**
	 * Id of the selected row
	 *
	 * @var integer|NULL
	 */
	private $selected_row_id;

	/**
	 * Id of the selected content item
	 *
	 * @var integer|NULL
	 */
	private $selected_content_id;

	/**
	 * Pass in anything required to set up the object
	 *
	 * @param array $rows The rows that make up the content page
	 * @param array $columns The columns that make up the content page
	 * @param array $content Contains the raw data to generate the content items and assign them to their row
	 * @param array $row_styles Defined styles for the rows
	 * @param array $content_styles Any styles defined for the content items
	 * @param integer|NULL $row_id Id of the selected row if any
	 * @param integer|NULL $content_id Id of the selected content item if any
	 * @return Dlayer_View_ContentPage
	 */
	public function contentPage(array $rows, array $columns, array $content, array $row_styles,
		array $content_styles, $row_id = NULL, $content_id = NULL)
	{
		$this->view->row()->setRows($rows);
		$this->view->column()->setColumns($columns);
		$this->view->content()->setContent($content);

		return $this;
	}

	/**
	 * Generates the base structure for the page and then calls a recursive method to do the rest of the work
	 *
	 * @return string
	 * @throws \Exception
	 */
	private function render()
	{
		$this->html = '<div class="container-fluid">';

		$this->view->row()->setColumnId(0);

		$this->html .= $this->view->row()->render();

		$this->html .= '</div>';

		return $this->html;
	}


	/**
	 * THis view helper can be ouput directly using print and echo, there is no
	 * need to call the render method. The __toString method is defined to allow
	 * this functionality, all it does it call the render method
	 *
	 * @return string The html generated by the render method
	 */
	public function __toString()
	{
		return $this->render();
	}
}
