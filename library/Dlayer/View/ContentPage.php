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
     * Override the hinting for the view property so that we can see the view helpers that have been defined
     *
     * @var Dlayer_View_Codehinting
     */
    public $view;

    /**
     * @var string
     */
    private $html;

    /**
     * @var TRUE|NULL Is the content page selected in designer
     */
    private $page_selected;

    /**
     * @var integer|NULL Id of the selected column
     */
    private $selected_column_id;

    /**
     * @var integer|NULL Id of the selected row
     */
    private $selected_row_id;

    /**
     * @var integer|NULL Id of the selected content item
     */
    private $selected_content_id;

    /**
     * @var boolean Child content
     */
    private $child_content = true;

    private $page_id;

    /**
     * Pass in anything required to set up the object
     *
     * @param integer $page_id
     * @param array $rows The rows that make up the content page
     * @param array $columns The columns that make up the content page
     * @param array $content Contains the raw data to generate the content items and assign them to their row
     * @param TRUE|NULL $page_selected Is the page selected in the designer?
     * @param integer|NULL $column_id Id of the selected column, if any
     * @param integer|NULL $row_id Id of the selected row, if any
     * @param integer|NULL $content_id Id of the selected content item if any
     *
     * @return Dlayer_View_ContentPage
     */
    public function contentPage(
        $page_id,
        array $rows,
        array $columns,
        array $content,
        $page_selected,
        $column_id = null,
        $row_id = null,
        $content_id = null
    ) {
        $this->page_id = $page_id;
        $this->view->row()->setRows($rows);
        $this->view->column()->setColumns($columns);
        $this->view->content()->setContent($content);

        if (count($rows) === 0 && count($columns) === 0) {
            $this->child_content = false;
        }

        $this->page_selected = $page_selected;
        $this->selected_column_id = $column_id;
        $this->selected_row_id = $row_id;
        $this->selected_content_id = $content_id;

        return $this;
    }

    /**
     * Pass in the styling data for the page
     *
     * @param array $content_container_styles
     * @param array $row_styles
     * @param array $column_styles
     * @param array $content_item_styles
     *
     * @return Dlayer_View_ContentPage
     */
    public function setStyles(
        array $content_container_styles,
        array $row_styles,
        array $column_styles,
        array $content_item_styles)
    {
        $this->view->stylingPage()->setStyles($content_container_styles);
        $this->view->stylingColumn()->setStyles($column_styles);
        $this->view->stylingRow()->setStyles($row_styles);
        $this->view->stylingContentItem()->setStyles($content_item_styles);

        return $this;
    }

    /**
     * Pass in the data array for the responsive options
     *
     * @param array $responsive_column_widths
     *
     * @return Dlayer_View_ContentPage
     */
    public function setResponsiveOptions(array $responsive_column_widths)
    {
        $this->view->column()->setResponsiveWidths($responsive_column_widths);

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
        $page_class = 'container-fluid';
        if ($this->page_selected === null) {
            $page_class .= ' selectable';
        } else {
            if ($this->selected_row_id == null) {
                $page_class .= ' selected';
            }
        }

        if ($this->child_content === false) {
            $page_class .= ' page-min-height';
        }

        $this->html = '<div class="' . $page_class . '" ' . $this->view->stylingPage()->setPage($this->page_id) . '>';

        $this->view->row()->setColumnId(0);
        $this->view->row()->setSelectedColumnId($this->selected_column_id);
        $this->view->row()->setSelectedRowId($this->selected_row_id);
        $this->view->row()->setSelectedContentId($this->selected_content_id);

        if ($this->child_content === true) {
            $this->html .= $this->view->row()->render();
        } else {
            if ($this->page_selected !== null) {
                $this->html .= '<div style="padding: 2rem 0;">';
                $this->html .= "<p><a href=\"/content/design/set-tool/tool/AddRow\" class=\"btn btn-primary\">Add Row(s)</a></p>";
                $this->html .= '</div>';
            }
        }

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
