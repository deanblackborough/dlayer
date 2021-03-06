<?php

/**
 * Dlayer base form class for app forms
 *
 * @author Dean Blackborough <dean@g3d-development.com>
 * @copyright G3D Development Limited
 * @license https://github.com/Dlayer/dlayer/blob/master/LICENSE
 */
abstract class Dlayer_Form_Site extends Dlayer_Form
{
    /**
     * Pass in any values that are needed to set up the form, optional
     *
     * @param array|NULL Options for form
     * @return void
     */
    public function __construct($options = null)
    {
        parent::__construct($options = null);
    }

    /**
     * Add the default decorators to use for the form inputs
     *
     * @return void
     */
    protected function addDefaultElementDecorators()
    {
        $this->setDecorators(array(
            'FormElements',
            array('Form', array('class' => 'form'))
        ));


        $this->setElementDecorators(array(
            array('ViewHelper'),
            array('Description', array('tag' => 'p', 'class' => 'help-block')),
            array('Errors', array('class' => 'alert alert-danger')),
            array('Label'),
            array(
                'HtmlTag',
                array(
                    'tag' => 'div',
                    'class' => array(
                        'callback' => function ($decorator) {
                            if ($decorator->getElement()->hasErrors()) {
                                return 'form-group has-error';
                            } else {
                                return 'form-group';
                            }
                        }
                    )
                )
            )
        ));

        $this->setDisplayGroupDecorators(array(
            'FormElements',
            'Fieldset',
        ));
    }

    /**
     * Add any custom decorators, these are inputs where we need a little more
     * control over the html, an example being the submit button
     *
     * @return void
     */
    protected function addCustomElementDecorators()
    {
        $this->elements['submit']->setDecorators(array(
            array('ViewHelper'),
            array('HtmlTag', array('tag' => 'div', 'class' => 'form-group'))
        ));
    }
}
