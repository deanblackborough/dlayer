<?php
/**
* Configuration values for dlayer, specifically the designer.
* 
* @author Dean Blackborough
* @copyright G3D Development Limited
* @version $Id: Config.php 1421 2014-01-20 16:23:02Z Dean.Blackborough $
*/
abstract class Dlayer_Config 
{
	CONST DESIGNER_WIDTH = 996;
	CONST DESIGNER_HEIGHT = 700;
	
	CONST FORM_MINIMUM_WIDTH = 600;
	CONST FORM_LEGEND = 'My form';
	CONST FORM_BUTTON = 'Save';
	
	CONST IMAGE_LIBRARY_DEFAULT_CATEGORY = 'Uncategorised';
	CONST IMAGE_LIBRARY_DEFAULT_SUB_CATEGORY = 'Misc.';
	
	CONST IMAGE_LIBRARY_ALL_SUB_CATEGORY = 'All';
		
	CONST IMAGE_LIBRARY_THUMB_WIDTH = 160;
	CONST IMAGE_LIBRARY_THUMB_HEIGHT = 120;    
	CONST IMAGE_LIBRARY_THUMB_PER_PAGE = 24;
	CONST IMAGE_LIBRARY_CANVAS_R = 255;
	CONST IMAGE_LIBRARY_CANVAS_G = 255;
	CONST IMAGE_LIBRARY_CANVAS_B = 255;
}