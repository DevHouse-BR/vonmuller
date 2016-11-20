<?php
defined( '_JEXEC') or die( 'Restricted access');
class FileManager {
function fileManagerInterface( $report ) {
;echo '<script language="JavaScript" type="text/javascript"> 
function addFile(what) { 
    if(document.getElementById) { 
        tr = what; 
        while (tr.tagName != \'TR\') tr = tr.parentNode; 
        tr = tr.previousSibling; 
        var newTr = tr.parentNode.insertBefore(tr.cloneNode(true),tr.nextSibling); 
        checkForLast(); 
        checkForMax(); 
    } 
} 
function show (what) { 
    what.style.display = "block"; 
} 

function hide (what) { 
    what.style.display = "none"; 
} 

function checkForMax(){ 
    btnsminus_f = document.getElementsByName(\'minus_f\'); 
    document.getElementsByName(\'plus_f\')[0].disabled = (btnsminus_f.length > 4) ? true : false; 
} 

function checkForLast(){ 
    btnsminus_f = document.getElementsByName(\'minus_f\'); 
    for (i = 0; i < btnsminus_f.length; i++){ 
        btnsminus_f[i].className = "addfile"; 
        if (btnsminus_f.length > 1){ 
            btnsminus_f[i].disabled = false; 
            show(btnsminus_f[i]); 
        } 
        else{ 
            btnsminus_f[i].disabled = true; 
            hide(btnsminus_f[i]); 
        } 
    } 
    btnsminus_l = document.getElementsByName(\'minus_l\'); 
    for (i = 0; i < btnsminus_l.length; i++){ 
        btnsminus_l[i].className = "addfile"; 
        if (btnsminus_l.length > 1){ 
            btnsminus_l[i].disabled = false; 
            show(btnsminus_l[i]); 
        } 
        else{ 
            btnsminus_l[i].disabled = true; 
            hide(btnsminus_l[i]); 
        } 
    } 
} 

function dropFile(what){ 
    tr = what; 
    while (tr.tagName != \'TR\') tr = tr.parentNode; 
    tr.parentNode.removeChild(tr); 
    checkForLast(); 
    checkForMax(); 
} 

</script> 
<form action="index.php?option=com_flippingbook&task=file_manager" method="post" name="adminForm" enctype="multipart/form-data"> 
';echo $report;;echo '<fieldset class="adminform"> 
    <legend>';echo JText::_( 'Upload Files');;echo '</legend> 
    <table border="0" cellspacing="0" cellpadding="0"> 
        <tr> 
            <td width="30%" valign="top"> 
                <table border="0" cellpadding="0" cellspacing="0" class="middle_form"> 
                    <tr height="30"> 
                        <td valign="top"> 
                            <input type="hidden" name="MAX_FILE_SIZE" value="16777216"> 
                            <input type="file" name="upload[]" size="50"> 
                        </td> 
                        <td width="50" align="center" valign="top"> 
                            <input type="button" name="minus_f" value="&#8212;" onClick="dropFile(this);" class="addfile" style="display: none;"> 
                        </td> 
                    </tr><tr height="30"> 
                        <td colspan="2" valign="top"> 
                            <input type="button"  name="plus_f" value="';echo JText::_( 'add field');;echo '" onClick="addFile(this);" class="addfile"> 
                        </td> 
                    </tr> 
                </table> 
            </td> 
            <td valign="top">&nbsp;&nbsp;&nbsp; 
                <input name="submit" type="submit" value="';echo JText::_( 'Upload');;echo '" /> 
            </td> 
        </tr> 
    </table> 
    ';echo JText::_( 'To ensure full compatibility, we recommend that you only use Latin characters and numerals in files and folders names.');;echo '</fieldset> 
';
if (JRequest::getVar( 'folder','','','string'))
$folder = JRequest::getVar( 'folder','','','string');
else 
$folder = DS .'images'.DS .'flippingbook';
if (substr($folder,0,20) != DS .'images'.DS .'fli'.'pping'.'book')
$folder = DS .'images'.DS .'flippingbook';
$path = JPATH_SITE .$folder;
$allFiles = array(null);
$filter='.';
$recurse=false;
$fullpath=false;
jimport('joomla.filesystem.folder');
$files = JFolder::files($path,$filter,$recurse,$fullpath);
$folders = JFolder::folders($path,$filter,$recurse,$fullpath);
;echo '<fieldset class="adminform"> 
    <legend>';echo JText::_( 'Current folder');;echo ': ';echo $folder;;echo '</legend> 
    <table width="100%" class="adminlist"> 
     
        <tr> 
            <td nowrap="nowrap" style="font-size:120%" colspan="4"> 
';if (JRequest::getVar( 'folder','','','string')) {;echo '                <a href="index.php?option=com_flippingbook&task=file_manager">';echo JText::_( 'Go To the Root Folder');;echo '</a>&nbsp;&nbsp;&nbsp; 
';};echo '                <a href="index.php?option=com_flippingbook&task=create_folder&folder=';echo $folder;;echo '">';echo JText::_( 'Create a new folder');;echo '</a> 
            </td> 
        </tr> 

        <tr> 
            <th width="150" align="left">';echo JText::_( 'Name');;echo '</th> 
            <th width="90" align="left">';echo JText::_( 'Size');;echo '</th> 
            <th width="100" align="center" colspan="2">';echo JText::_( 'Action');;echo '</th> 
        </tr> 
';
$folders = JFolder::listFolderTree (JPATH_ROOT .DS .$folder,'',10);
if (count($folders) >0) {
foreach ($folders as $folders_) {
$relname = str_replace (DS .'images'.DS .'flippingbook'.DS,'',$folders_["relname"]);
;echo '    <tr> 
        <td nowrap="nowrap" style="font-size:120%"><a href="index.php?option=com_flippingbook&task=file_manager&folder=';echo $folders_["relname"];;echo '">';echo $folders_["relname"];;echo '</a></td> 
        <td align="left">&mdash;</td> 
        <td width="100"><a href="index.php?option=com_flippingbook&task=rename_folder&folder_to_rename=';echo $relname;;echo '&folder=';echo $folder;;echo '">';echo JText::_( 'Rename');;echo '</a></td> 
        <td width="100"><a href="index.php?option=com_flippingbook&task=delete_folder&folder_to_delete=';echo $relname;;echo '&folder=';echo $folder;;echo '">';echo JText::_( 'Delete');;echo '</a></td> 
    </tr> 
';
}
}
$i = 0;
foreach ($files as $file) {
;echo '        <tr> 
            <td nowrap="nowrap">';echo $file;;echo '</td> 
            <td align="left">';
$fb_filesize = filesize($path .DS .$file);
echo number_format($fb_filesize,0,' ',' ');;echo '</td> 
            <td width="100"><a href="index2.php?option=com_flippingbook&task=rename_file&file_to_rename=';echo $file;;echo '&folder=';echo $folder;;echo '">';echo JText::_( 'Rename');;echo '</a></td> 
            <td width="100"><a href="index2.php?option=com_flippingbook&task=delete_file&file_to_delete=';echo $file;;echo '&folder=';echo $folder;;echo '">';echo JText::_( 'Delete');;echo '</a></td> 
        </tr> 
';
$i++;
};echo '    </table> 
</fieldset> 
<input type="hidden" name="option" value="com_flippingbook" /> 
<input type="hidden" name="task" value="upload_file" /> 
<input type="hidden" name="boxchecked" value="0" /> 
<input type="hidden" name="folder" value="';echo JRequest::getVar( 'folder','','','string');;echo '" /> 
</form> 
';
}
function renameFileForm ( $file ) {
;echo '<fieldset class="adminform"><legend>';echo JText::_( 'Rename File');;echo ':</legend> 
    <form action="index.php?option=com_flippingbook&task=rename_file" method="post" name="adminForm"> 
        <table> 
            <tr> 
                <td>';echo JText::_( 'Old file name');;echo ':</td> 
                <td>';echo $file;;echo '</td> 
            </tr> 
            <tr> 
                <td>';echo JText::_( 'New file name');;echo ':</td> 
                <td><input name="new_file_name" type="text" value="';echo $file;;echo '" style="width: 200px;" /></td> 
            </tr> 
        </table> 
        <input name="old_file_name" type="hidden" value="';echo $file;;echo '" /> 
        <input name="submit" type="submit" value="';echo JText::_( 'Save');;echo '" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
        <input name="save_renamed" type="hidden" value="1" /> 
        <input type="hidden" name="task" value="rename_file" /> 
        <input type="hidden" name="folder" value="';echo JRequest::getVar( 'folder','','','string');;echo '" /> 
    </form> 
</fieldset> 
';
}
function renameFolderForm ( $folder ) {
;echo '<fieldset class="adminform"><legend>';echo JText::_( 'Rename Folder');;echo ':</legend> 
    <form action="index.php?option=com_flippingbook&task=rename_folder" method="post" name="adminForm"> 
        <table> 
            <tr> 
                <td><strong style="color:red">';echo JText::_( 'Make sure that folder doesn\'t contain linked files');;echo '</strong></td> 
            </tr> 
            <tr> 
                <td>';echo JText::_( 'Old name');;echo ': ';echo DS .'images'.DS .'flippingbook'.DS .$folder;;echo '</td> 
            </tr> 
            <tr> 
                <td>';echo JText::_( 'New name');;echo ': ';echo DS .'images'.DS .'flippingbook'.DS;;echo ' <input name="new_folder_name" type="text" value="';echo $folder;;echo '" style="width: 200px;" /></td> 
            </tr> 
        </table> 
        <input name="old_folder_name" type="hidden" value="';echo $folder;;echo '" /> 
        <input name="submit" type="submit" value="';echo JText::_( 'Save');;echo '" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
        <input name="save_renamed_folder" type="hidden" value="1" /> 
        <input type="hidden" name="task" value="rename_folder" /> 
        <input type="hidden" name="folder" value="';echo JRequest::getVar( 'folder','','','string');;echo '" /> 
    </form> 
</fieldset> 
';
}
function createFolderForm ( $folder ) {
;echo '<fieldset class="adminform"><legend>';echo JText::_( 'Create a new folder');;echo ':</legend> 
    <form action="index.php?option=com_flippingbook&task=create_folder" method="post" name="adminForm"> 
        <table> 
            <tr> 
                <td>';echo JText::_( 'New folder name');;echo ': <input name="folder_name" type="text" value="new_folder" style="width: 200px;" /></td> 
            </tr> 
        </table> 
        <input name="submit" type="submit" value="';echo JText::_( 'Save');;echo '" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
        <input type="hidden" name="save_folder" value="1" /> 
        <input type="hidden" name="task" value="create_folder" /> 
        <input type="hidden" name="folder" value="';echo $folder;;echo '" /> 
    </form> 
</fieldset> 
';
}
}
?>