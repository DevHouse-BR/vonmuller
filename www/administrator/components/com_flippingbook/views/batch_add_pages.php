<?php
defined( '_JEXEC') or die( 'Restricted access');
class BatchAddPages {
function form($lists)    {
JHTML::_('behavior.tooltip');
;echo '<script language="javascript" type="text/javascript"> 
    function submitbutton(pressbutton) { 
        var form = document.adminForm; 
        if (pressbutton == \'cancel_configuration\') { 
            submitform( pressbutton ); 
            return; 
        } 
        // do field validation 

        if (pressbutton == \'batch_add_pages_execute\') { 
            if ((form.method.value == "advanced")&&((form.prefix_page.value == "")||(form.prefix_zoom.value == ""))) { 
                alert( "';echo JText::_( 'Enter the prefix fields values',true );;echo '" ); 
                return; 
            } else { 
                submitform( pressbutton ); 
            } 
        } else { 
            submitform( pressbutton ); 
        } 
    } 
</script> 
<form action="index.php" method="post" name="adminForm"> 
    <table class="admintable" width="100%"> 
        <tr> 
            <td class="key"><label for="title">';echo JText::_( 'Book');;echo '</label></td> 
            <td>';echo $lists['books'];;echo '</td> 
        </tr> 
        <tr> 
            <td class="key"><label for="title">';echo JText::_( 'Folder');;echo '</label></td> 
            <td>';echo $lists['folders'];;echo '</td> 
        </tr> 
        <tr> 
            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Mode');;echo '::';echo JText::_( 'Mode Description');;echo '">';echo JText :: _('Mode');;echo '</span></td> 
            <td>';echo $lists['method'];;echo '</td> 
        </tr> 
        <tr> 
            <td colspan="2"> 
                <fieldset class="adminform"><legend>';echo JText::_( 'Advanced Mode');;echo '</legend> 
                    <table class="admintable" width="100%">     
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Prefix For Pages Images');;echo '::';echo JText::_( 'Prefix For Pages Images Description');;echo '">';echo JText::_( 'Prefix For Pages Images');;echo '</span></td> 
                            <td><input class="inputbox" type="text" name="prefix_page" id="prefix_page" size="30" value="my-book_" /></td> 
                            <td rowspan="6" valign="top"><img src="components/com_flippingbook/images/batch_help.gif" /></td> 
                        </tr> 
                        <tr> 
                            <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Prefix For Zoomed Images');;echo '::';echo JText::_( 'Prefix For Zoomed Images Description');;echo '">';echo JText::_( 'Prefix For Zoomed Images');;echo '</span></td> 
                            <td><input class="inputbox" type="text" name="prefix_zoom" id="prefix_zoom" size="30" value="zoom_" /></td> 
                        </tr> 
                        <tr> 
                            <td> </td> 
                            <td> </td> 
                        </tr> 
                    </table> 
                </fieldset> 
            </td> 
        </tr> 
    </table> 
<script language="javascript" type="text/javascript"> 
var prefix_page_obj = document.getElementById("prefix_page"); 
var prefix_zoom_obj = document.getElementById("prefix_zoom"); 
var method_obj = document.getElementById("method"); 
function check_method() { 
    if (method_obj.selectedIndex == 0) { 
        prefix_page_obj.disabled = true; 
        prefix_zoom_obj.disabled = true; 
    } else { 
        prefix_page_obj.disabled = false; 
        prefix_zoom_obj.disabled = false; 
    } 
} 
check_method(); 
</script> 
        <input type="hidden" name="task" value="batch_add_pages" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
</form> 
';
}
function perform($vars,$files) {
}
}
?>