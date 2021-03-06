<?php

/**
 * Color picker input, includes a hidden element to store the selected value
 * and then a div to invoke the color picker, extension of Zend
 *
 * @author Dean Blackborough
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
class Dlayer_Form_Element_ColorPicker extends Zend_Form_Element_Text
{
    /**
     * Default form view helper to use for rendering
     * @var string
     */
    public $helper = 'formElementColorPicker';

    /**
     * Initialize object; used by extending classes
     *
     * @return void
     */
    public function init()
    {
        $this->clear_link = false;
    }

    /**
     * Add clear link after the color selector, defaults to hidden, only shows
     * when this method is called
     *
     * @return Dlayer_Form_Element_ColorPicker
     */
    public function addClearLink()
    {
        $this->clear_link = true;

        return $this;
    }
}
