<?php
/*
# ------------------------------------------------------------------------
# JA Norite template for Joomla 1.5.x
# ------------------------------------------------------------------------
# Copyright (C) 2004-2010 JoomlArt.com. All Rights Reserved.
# @license - PHP files are GNU/GPL V2. CSS / JS are Copyrighted Commercial,
# bound by Proprietary License of JoomlArt. For details on licensing, 
# Please Read Terms of Use at http://www.joomlart.com/terms_of_use.html.
# Author: JoomlArt.com
# Websites:  http://www.joomlart.com -  http://www.joomlancers.com
# Redistribution, Modification or Re-licensing of this file in part of full, 
# is bound by the License applied. 
# ------------------------------------------------------------------------
*/

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

include_once (dirname(__FILE__).DS.'libs'.DS.'ja.template.helper.php');

if( defined('_DEMO_MODE_') ) {
	$tmplTools = JATemplateHelper::getInstance($this, array('ui', JA_TOOL_SCREEN, JA_TOOL_MENU, JA_TOOL_COLOR, 'main_layout', 'direction'));
} else {
	$tmplTools = JATemplateHelper::getInstance($this, array('ui', JA_TOOL_SCREEN, JA_TOOL_MENU, 'main_layout', 'direction'));
}

//Calculate the width of template
$tmplWidth = '';
$tmplWrapMin = '100%';
switch ($tmplTools->getParam(JA_TOOL_SCREEN)) {
	case 'auto':
		$tmplWidth = '97%';
		break;
	case 'fluid':
		$tmplWidth = intval($tmplTools->getParam('ja_screen-fluid-fix-ja_screen_width'));
		$tmplWidth = $tmplWidth ? $tmplWidth.'%' : '90%';
		break;
	case 'fix':
		$tmplWidth = intval($tmplTools->getParam('ja_screen-fluid-fix-ja_screen_width'));
		$tmplWrapMin = $tmplWidth ? ($tmplWidth+1).'px' : '771px';
		$tmplWidth = $tmplWidth ? $tmplWidth.'px' : '770px';
		break;
	default:
		$tmplWidth = intval($tmplTools->getParam(JA_TOOL_SCREEN));
		$tmplWrapMin = $tmplWidth ? ($tmplWidth+1).'px' : '981px';
		$tmplWidth = $tmplWidth ? $tmplWidth.'px' : '980px';
		break;
}

$tmplTools->setParam ('tmplWidth', $tmplWidth);
$tmplTools->setParam ('tmplWrapMin', $tmplWrapMin);

//Main navigation
$ja_menutype = $tmplTools->getMenuType();
$jamenu = null;
if ($ja_menutype && $ja_menutype != 'none') {
	$japarams = new JParameter('');
	$japarams->set( 'menutype', $tmplTools->getParam('menutype', 'mainmenu') );
	$japarams->set( 'menu_images_align', 'left' );
	$japarams->set( 'menupath', $tmplTools->templateurl() .'/ja_menus');
	$japarams->set('menu_images', 1); //0: not show image, 1: show image which set in menu item
	$japarams->set('menu_background', 1); //0: image, 1: background
	$japarams->set('mega-colwidth', 170); //Megamenu only: Default column width
	$japarams->set('mega-style', 3); //Megamenu only: Menu style. 
	$japarams->set('rtl',($tmplTools->getParam('direction')=='rtl' || $tmplTools->direction == 'rtl'));
	$jamenu = $tmplTools->loadMenu($japarams, $ja_menutype); 
}	
//End for main navigation

$layout = $tmplTools->getLayout ();
if ($layout) {
	$tmplTools->display ($layout);
}