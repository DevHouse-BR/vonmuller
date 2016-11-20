<?php
defined( '_JEXEC') or die( 'Restricted access');
require_once( JPATH_COMPONENT.DS.'controller.php');
JTable::addIncludePath( JPATH_COMPONENT.DS.'tables');
$controller = new FlippingBookController( array('default_task'=>'showMain') );
$controller->execute( JRequest::getCmd( 'task') );
$controller->redirect();
?>