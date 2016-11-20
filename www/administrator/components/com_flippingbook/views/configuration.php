<?php
defined( '_JEXEC') or die( 'Restricted access');
class Config {
function Configuration( $FlippingBook_config,$lists ) {
global $option;
JHTML::_('behavior.tooltip');
;echo '<script language="javascript" type="text/javascript"> 
    function submitbutton(pressbutton) { 
        submitform( pressbutton ); 
    } 
     
    function resetConfiguration() { 
        var printTitle = document.getElementById(\'printTitle\'); 
        printTitle.value = \'Print pages\'; 
        var downloadComplete = document.getElementById(\'downloadComplete\'); 
        downloadComplete.value = \'Complete\'; 
        var zoomHint = document.getElementById(\'zoomHint\'); 
        zoomHint.value = \'Double click for zooming\'; 
        var rigidPageSpeed = document.getElementById(\'rigidPageSpeed\'); 
        rigidPageSpeed.value = \'5\'; 
        var closeSpeed = document.getElementById(\'closeSpeed\'); 
        closeSpeed.value = \'3\'; 
        var moveSpeed = document.getElementById(\'moveSpeed\'); 
        moveSpeed.value = \'2\'; 
        var gotoSpeed = document.getElementById(\'gotoSpeed\'); 
        gotoSpeed.value = \'3\'; 
        var zoomOnClick1 = document.getElementById(\'zoomOnClick1\'); 
        zoomOnClick1.checked = true; 
        var dropShadowEnabled1 = document.getElementById(\'dropShadowEnabled1\'); 
        dropShadowEnabled1.checked = true; 
        var categoryListTitle = document.getElementById(\'categoryListTitle\'); 
        categoryListTitle.value = \'FlippingBook Categories\'; 
        var printIcon1 = document.getElementById(\'printIcon1\'); 
        printIcon1.checked = true; 
        var emailIcon1 = document.getElementById(\'emailIcon1\'); 
        emailIcon1.checked = true; 
    } 
</script> 
<form action="index.php?option=com_flippingbook" method="post" name="adminForm"> 
    <table width="100%" class="adminform"> 
        <tr valign="middle"> 
            <td width="50%" valign="top" nowrap="nowrap"> 
                <fieldset class="adminform"> 
                    <legend>';echo JText::_( 'Interface Settings');;echo '</legend> 
                    <table class="admintable"> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Theme');;echo '::';echo JText::_( 'Theme Description');;echo '">';echo JText::_( 'Theme');;echo '</span></td> 
                            <td>';echo $lists['themes_list'];;echo '</td> 
                        </tr> 
                        <tr> 
                          <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Preloader Type');;echo '::';echo JText::_( 'Preloader Type Description');;echo '">';echo JText::_( 'Preloader Type');;echo '</span></td> 
                          <td>';echo $lists['preloader'];;echo '</td> 
                      </tr> 
                        <tr> 
                          <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Page Flip Sound');;echo '::';echo JText::_( 'Page Flip Sound Description');;echo '">';echo JText::_( 'Page Flip Sound');;echo '</span></td> 
                          <td>';echo $lists['pageFlipSound'];;echo '</td> 
                        </tr> 
                        <tr> 
                          <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Hard Cover Flip Sound');;echo '::';echo JText::_( 'Hard Cover Flip Sound Description');;echo '">';echo JText::_( 'Hard Cover Flip Sound');;echo '</span></td> 
                          <td>';echo $lists['hardcoverFlipSound'];;echo '</td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Print Title');;echo '::';echo JText::_( 'Print Title Description');;echo '">';echo JText::_( 'Print Title');;echo '</span></td> 
                            <td><input name="printTitle" type="text" id="printTitle" value="';echo htmlspecialchars ( urldecode ( $FlippingBook_config->printTitle ));;echo '" style="width:200px;" /></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Download Complete');;echo '::';echo JText::_( 'Download Complete Description');;echo '">';echo JText::_( 'Download Complete');;echo '</span></td> 
                            <td><input name="downloadComplete" type="text" id="downloadComplete" value="';echo htmlspecialchars ( urldecode ( $FlippingBook_config->downloadComplete ));;echo '" style="width:200px;" /></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zoom Hint');;echo '::';echo JText::_( 'Zoom Hint Description');;echo '">';echo JText::_( 'Zoom Hint');;echo '</span></td> 
                            <td><input name="zoomHint" type="text" id="zoomHint" value="';echo htmlspecialchars ( urldecode ( $FlippingBook_config->zoomHint ));;echo '" style="width:200px;" /></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Rigid Page Speed');;echo '::';echo JText::_( 'Rigid Page Speed Description');;echo '">';echo JText::_( 'Rigid Page Speed');;echo '</span></td> 
                            <td><input name="rigidPageSpeed" type="text" id="rigidPageSpeed" maxlength="4" value="';echo $FlippingBook_config->rigidPageSpeed;;echo '" style="width:50px;"/></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Flip Speed');;echo '::';echo JText::_( 'Flip Speed Description');;echo '">';echo JText::_( 'Flip Speed');;echo '</span></td> 
                            <td><input name="closeSpeed" type="text" id="closeSpeed" maxlength="4" value="';echo $FlippingBook_config->closeSpeed;;echo '" style="width:50px;"/></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Move Speed');;echo '::';echo JText::_( 'Move Speed Description');;echo '">';echo JText::_( 'Move Speed');;echo '</span></td> 
                            <td><input name="moveSpeed" type="text" id="moveSpeed" maxlength="4" value="';echo $FlippingBook_config->moveSpeed;;echo '" style="width:50px;"/></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Go To Speed');;echo '::';echo JText::_( 'Go To Speed Description');;echo '">';echo JText::_( 'Go To Speed');;echo '</span></td> 
                            <td><input name="gotoSpeed" type="text" id="gotoSpeed" maxlength="4" value="';echo $FlippingBook_config->gotoSpeed;;echo '" style="width:50px;"/></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zoom On Double Click');;echo '::';echo JText::_( 'Zoom On Double Click Description');;echo '">';echo JText::_( 'Zoom On Double Click');;echo '</span></td> 
                            <td>';echo JHTML::_( 'select.booleanlist','zoomOnClick','class="inputbox"',$FlippingBook_config->zoomOnClick );;echo '</td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Drop Shadow Enabled');;echo '::';echo JText::_( 'Drop Shadow Enabled Description');;echo '">';echo JText::_( 'Drop Shadow Enabled');;echo '</span></td> 
                            <td>';echo JHTML::_( 'select.booleanlist','dropShadowEnabled','class="inputbox"',$FlippingBook_config->dropShadowEnabled );;echo '</td> 
                        </tr> 
                        <tr> 
                            <td></td> 
                            <td height="30" valign="bottom"><input type="button" name="Button" value="';echo JText::_( 'Restore default settings');;echo '" onclick="resetConfiguration();" /></td> 
                        </tr> 
                    </table>  
                </fieldset>                            </td> 
            <td width="50%" valign="top" nowrap="nowrap"><fieldset class="adminform"> 
                    <legend>';echo JText::_( 'Category List');;echo '</legend> 
                    <table class="admintable"> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Category List Title');;echo '::';echo JText::_( 'CATEGORY LIST TITLE DESCRIPTION');;echo '">';echo JText::_( 'Category List Title');;echo '</span></td> 
                            <td><input name="categoryListTitle" type="text" id="categoryListTitle" maxlength="254" value="';echo htmlspecialchars ( urldecode ( $FlippingBook_config->categoryListTitle ));;echo '" style="width:200px;" /></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Columns In Category List');;echo '::';echo JText::_( 'COLUMNS IN CATEGORY LIST DESCRIPTION');;echo '">';echo JText::_( 'Columns In Category List');;echo '</span></td> 
                            <td>';echo $lists['columns'];;echo '</td> 
                        </tr> 
                        <tr> 
                          <td class="key">';echo JText::_( 'Print Icon');;echo '</td> 
                            <td>';echo JHTML::_( 'select.booleanlist','printIcon','class="inputbox"',$FlippingBook_config->printIcon );;echo '</td> 
                      </tr> 
                        <tr> 
                          <td class="key">';echo JText::_( 'Email Icon');;echo '</td> 
                            <td>';echo JHTML::_( 'select.booleanlist','emailIcon','class="inputbox"',$FlippingBook_config->emailIcon );;echo '</td> 
                      </tr> 
                    </table> 
                </fieldset> 
            </td> 
        </tr> 
        <tr valign="middle"> 
          <td colspan="2" valign="top" nowrap="nowrap"></td> 
      </tr> 
    </table> 
    <input type="hidden" name="option" value="';echo $option;;echo '" /> 
    <input type="hidden" name="task" value="" /> 
</form> 
';
}
}
?>