<?php
defined( '_JEXEC') or die( 'Restricted access');
switch ( getVersion() ) {
case '1.5.10':
break;
case '1.5.9':
updateDatabaseStructure_159_to_1510 ();
showUpdateMessage ( 'FlippingBook has been updated to 1.5.10 version.');
break;
case '1.5.8':
updateDatabaseStructure_158_to_159 ();
updateDatabaseStructure_159_to_1510 ();
showUpdateMessage ( 'FlippingBook has been updated to 1.5.10 version.');
break;
case '1.5.7':
updateDatabaseStructure_157_to_158 ();
updateDatabaseStructure_158_to_159 ();
updateDatabaseStructure_159_to_1510 ();
showUpdateMessage ( 'FlippingBook has been updated to 1.5.10 version.');
break;
default: 
updateDatabaseStructure_156_to_157 ();
updateDatabaseStructure_157_to_158 ();
updateDatabaseStructure_158_to_159 ();
updateDatabaseStructure_159_to_1510 ();
showUpdateMessage ( 'FlippingBook has been updated to 1.5.10 version.');
break;
}
function updateDatabaseStructure_159_to_1510 () {
$db    =&JFactory::getDBO ();
$query = array ();
$query[] = "UPDATE `#__flippingbook_config` SET `value` = '1.5.10' WHERE `name` = 'version'";
foreach ( $query as $query_string ) {
$db->setQuery ( $query_string );
$db->query () or die( $db->stderr () );
}
}
function updateDatabaseStructure_158_to_159 () {
$db    =&JFactory::getDBO ();
$query = array ();
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `direction` VARCHAR( 3 ) NOT NULL DEFAULT 'LTR'";
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `frame_width` INT( 4 ) NOT NULL DEFAULT '0'";
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `frame_color` VARCHAR (10) NOT NULL DEFAULT 'FFFFFF'";
$query[] = "UPDATE `#__flippingbook_config` SET `value` = '1.5.9' WHERE `name` = 'version'";
foreach ( $query as $query_string ) {
$db->setQuery ( $query_string );
$db->query () or die( $db->stderr () );
}
}
function updateDatabaseStructure_157_to_158 () {
$db    =&JFactory::getDBO ();
$query = array ();
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `sound_control_button` TINYINT( 1 ) NOT NULL DEFAULT '1'";
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `transparent_pages` TINYINT( 1 ) NOT NULL DEFAULT '1'";
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `show_zoom_hint` TINYINT( 1 ) NOT NULL DEFAULT '1'";
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `fullscreen_hint` TEXT NOT NULL DEFAULT ''";
$query[] = "UPDATE `#__flippingbook_config` SET `value` = '1.5.8' WHERE `name` = 'version'";
foreach ( $query as $query_string ) {
$db->setQuery ( $query_string );
$db->query () or die( $db->stderr () );
}
}
function updateDatabaseStructure_156_to_157 () {
$db    =&JFactory::getDBO ();
$query = array ();
$query[] = "ALTER TABLE `#__flippingbook_books` ADD `zooming_method` INT( 1 ) NOT NULL DEFAULT '0'";
$query[] = "ALTER TABLE `#__flippingbook_pages` ADD `zoom_height` INT( 4 ) NOT NULL DEFAULT '800'";
$query[] = "ALTER TABLE `#__flippingbook_pages` ADD `zoom_width` INT( 4 ) NOT NULL DEFAULT '600'";
$query[] = "INSERT INTO `#__flippingbook_config` ( `name` , `value` ) VALUES ( 'version', '1.5.7' )";
foreach ( $query as $query_string ) {
$db->setQuery( $query_string );
$db->query() or die( $db->stderr () );
}
}
function getVersion () {
$db    =&JFactory::getDBO ();
$query = "SELECT value FROM #__flippingbook_config WHERE name = 'version'";
$db->setQuery ($query);
$rows = $db->loadObjectList ();
return $rows[0]->value;
}
function showUpdateMessage ( $updateMessage ) {
echo ' <dl id="system-message">';
echo ' <dt class="message">Message</dt>';
echo ' <dd class="message message fade">';
echo ' <ul>';
echo $updateMessage;
echo ' </ul>';
echo ' </dd>';
echo ' </dl>';
}
?>