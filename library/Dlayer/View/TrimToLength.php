<?php

/**
 * Trims a string to a specific length and adds ellipsis if required
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Dlayer_View_TrimToLength extends Zend_View_Helper_Abstract
{
    /**
     * Override the hinting for the view property so that we can see the view helpers that have been defined
     *
     * @var Dlayer_View_Codehinting
     */
    public $view;

    private $string;
    private $length;

    /**
     * Set the string and trim length
     *
     * @param string $string
     * @param integer $length
     * @return Dlayer_View_TrimToLength
     */
    public function trimToLength($string, $length = 50)
    {
        $this->resetParams();

        $this->string = $string;
        $this->length = $length;

        return $this;
    }

    /**
     * Reset any internal params, we need to reset the params in case the view helper is called multiple times
     * within the same view script.
     *
     * @return void
     */
    public function resetParams()
    {
        $this->string = '';
        $this->length = 50;
    }

    /**
     * Return the trimmed text
     *
     * @return string
     */
    private function render()
    {
        if (strlen($this->string) > $this->length) {
            $html = substr($this->view->escape($this->string), 0, $this->length) . '&#8230;';
        } else {
            $html = $this->view->escape($this->string);
        }

        return $html;
    }

    /**
     * The view helpers can be output directly, we define the __toString method so that echo and print calls on the
     * object return the html generated by the render method
     *
     * @return string The generated html
     */
    public function __toString()
    {
        return $this->render();
    }
}
