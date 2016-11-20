<?php
defined( '_JEXEC') or die( 'Restricted access');
class BookManager {
function showBooks( &$rows,&$pageNav,$option,&$lists ) {
$user =&JFactory::getUser();
$ordering = ($lists['order'] == 'm.category_id'||$lists['order'] == 'b.title');
JHTML::_('behavior.tooltip');
;echo '        <form action="index.php?option=com_flippingbook" method="post" name="adminForm"> 
            <table width="100%"> 
                <tr> 
                    <td align="left"> 
                        ';echo JText::_( 'Filter (Title, Description)');;echo ': 
                        <input type="text" name="search" id="search" value="';echo $lists['search'];;echo '" class="text_area" onchange="document.adminForm.submit();" /> 
                        <button onclick="this.form.submit();">';echo JText::_( 'Go');;echo '</button> 
                        <button onclick="document.getElementById(\'search\').value=\'\';this.form.submit();">';echo JText::_( 'Reset');;echo '</button></td> 
                    <td align="center" nowrap="nowrap"> 
                        ';echo JText::_( 'Category Filter');;echo ':';
echo $lists['category'];
;echo '</td> 
                    <td align="right" nowrap="nowrap">';echo JText::_( 'State Filter');;echo ': 
                        ';
echo $lists['state'];
;echo '</td> 
                </tr> 
            </table> 
        <div id="tablecell"> 
            <table class="adminlist"> 
                <thead> 
                    <tr> 
                        <th width="5" nowrap="nowrap">';echo JText::_( 'NUM');;echo '</th> 
                        <th width="20" nowrap="nowrap"><input type="checkbox" name="toggle" value="" onclick="checkAll(';echo count( $rows );;echo ');" /></th> 
                        <th width="1%" nowrap="NOWRAP">';echo JHTML::_('grid.sort','ID','m.id',@$lists['order_Dir'],@$lists['order'],'book_manager');;echo '</th> 
                        <th nowrap="nowrap" class="title">';echo JHTML::_('grid.sort','Book Title','book_title',@$lists['order_Dir'],@$lists['order'],'book_manager');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Published','m.published',@$lists['order_Dir'],@$lists['order'],'book_manager');;echo '</th> 
                        <th align="center">';echo JText::_( 'Description');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Category ID','m.category_id',@$lists['order_Dir'],@$lists['order'],'book_manager');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Category Title','m.title',@$lists['order_Dir'],@$lists['order'],'book_manager');;echo '</th> 
                        <th colspan="3" nowrap="NOWRAP">';echo JHTML::_('grid.sort','Ordering','m.ordering',@$lists['order_Dir'],@$lists['order'],'book_manager');;echo '';echo JHTML::_('grid.order',$rows,'filesave.png','savebookorder');;echo '</th> 
                    </tr> 
                </thead> 
                <tfoot> 
                    <tr> 
                        <td colspan="13"> 
                            ';echo $pageNav->getListFooter();;echo '                    </td> 
                    </tr> 
                </tfoot> 
                <tbody> 
            ';
$k = 0;
for ($i=0,$n=count( $rows );$i <$n;$i++) {
$row = &$rows[$i];
$link         = 'index.php?option=com_flippingbook&task=edit_book&cid[]='.$row->id ;
$checked     = JHTML::_('grid.checkedout',$row,$i );
$published     = JHTML::_('grid.published',$row,$i );
;echo '                <tr class="';echo "row$k";;echo '"> 
                    <td>';echo $pageNav->getRowOffset( $i );;echo '</td> 
                    <td>';echo $checked;;echo '</td> 
                    <td align="center">';echo $row->id;;echo '</td> 
                    <td>';if ( JTable::isCheckedOut($user->get ('id'),$row->checked_out ) ) {
echo $row->title;
}else {;echo '                        <a href="';echo JRoute::_( $link );;echo '" title="';echo JText::_( 'Edit Book');;echo '">';echo $row->book_title;;echo '</a> 
                    ';};echo '</td> 
                    <td align="center">';echo $published;;echo '</td> 
                    <td>';echo $row->description;;echo '</td> 
                    <td width="1%" align="center">';echo $row->category_id;;echo '</td> 
                    <td align="left">';echo $row->category_title;;echo '</td> 
                    <td width="1%" align="center">';echo $pageNav->orderUpIcon( $i,($row->category_id == @$rows[$i-1]->category_id) ,'orderup_book','Move Up',$ordering);;echo '</td> 
                    <td width="1%" align="center">';echo $pageNav->orderDownIcon( $i,$n,($row->category_id == @$rows[$i+1]->category_id),'orderdown_book','Move Down',$ordering );;echo '</td> 
                    <td width="1%" align="center" nowrap="nowrap">';$disabled = $ordering ?'': 'disabled="disabled"';;echo '<input type="text" name="order[]" size="5" value="';echo $row->ordering;;echo '" ';echo $disabled;;echo ' class="text_area" style="text-align: center" /></td> 
                </tr> 
                ';
$k = 1 -$k;
}
;echo '            </tbody> 
            </table> 
        </div> 

        <input type="hidden" name="option" value="';echo $option;;echo '" /> 
        <input type="hidden" name="task" value="book_manager" /> 
        <input type="hidden" name="section" value="book_manager" /> 
        <input type="hidden" name="boxchecked" value="0" /> 
        <input type="hidden" name="filter_order" value="';echo $lists['order'];;echo '" /> 
        <input type="hidden" name="filter_order_Dir" value="" /> 
        </form> 
        ';
}
function editBook( &$row,&$lists ) {
JRequest::setVar( 'hidemainmenu',1 );
$editor =&JFactory::getEditor();
jimport( 'joomla.filter.output');
JFilterOutput::objectHTMLSafe( $row,ENT_QUOTES );
jimport( 'joomla.html.pane');
$pane =&JPane::getInstance( 'sliders');
JHTML::_( 'behavior.tooltip');
;echo '         
<script language="javascript" type="text/javascript"> 
    function submitbutton(pressbutton) { 
        var form = document.adminForm; 
        if (pressbutton == \'cancel_book\') { 
            submitform( pressbutton ); 
            return; 
        } 

        if (form.title.value == "") { 
            alert( "';echo JText::_( 'Book must have a title',true );;echo '" ); 
        } else { 
            submitform( pressbutton ); 
        } 
    } 
</script> 
<br> 
<form action="index.php" method="post" name="adminForm"> 
<table width="100%" border="0" cellspacing="5" cellpadding="0" class="adminform"> 
    <tr> 
        <td valign="top"> 
            <table class="admintable"> 
';
if ( $row->id != "") {
;echo '                <tr> 
                    <td class="key">';echo JText::_( 'Preview Book');;echo '</td> 
                    <td><a href="../index2.php?option=com_flippingbook&view=book&id=';echo $row->id ;echo '" target="_blank"><img src="components/com_flippingbook/images/icon_preview.png" alt="Preview Book" align="top" border="0" width="24" height="24"></a></td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Book URL');;echo '</label></td> 
                    <td>';echo 'index.php?option=com_flippingbook&view=book&id='.$row->id;;echo '</td> 
                </tr> 
';
}
;echo '                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Category');;echo '</label></td> 
                    <td>';echo $lists['categories'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Preview Image');;echo '</label></td> 
                    <td>';echo $lists['preview_image'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Title');;echo '</label></td> 
                    <td><input class="inputbox" type="text" name="title" id="title" size="60" value="';echo $row->title;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Alias');;echo '</label></td> 
                    <td><input class="inputbox" type="text" name="alias" id="alias" size="60" value="';echo $row->alias;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Ordering');;echo '</label></td> 
                    <td><input name="ordering" type="text" class="text_area" id="ordering" value="';echo $row->ordering;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Description');;echo '</td> 
                    <td>';echo $editor->display( 'description',$row->description,'100%','300','60','20',false ) ;;echo '</td> 
                </tr> 
            </table> 
        </td> 
        <td valign="top"> 
         
        <table style="border: 1px dashed silver; padding: 5px; margin-bottom: 10px;" width="100%"> 
            <tbody> 
';
if ( $row->id != "") {
;echo '                <tr> 
                    <td> 
                        <strong>Book ID:</strong> 
                    </td> 
                    <td> 
                        ';echo $row->id;;echo '                    </td> 
                </tr> 
';
}
;echo '                <tr> 
                    <td> 
                        <strong>State</strong> 
                    </td> 
                    <td> 
';
if ( $row->published == 1 ) 
echo JText :: _('Published');
else 
echo JText :: _('Unpublished');
;echo '                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        <strong>Hits</strong> 
                    </td> 
                    <td> 
                        ';echo $row->hits;;echo '                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        <strong>Created</strong> 
                    </td> 
                    <td> 
                        ';echo JHTML::_('date',$row->created,JText::_('DATE_FORMAT_LC2'));;echo '                    </td> 
                </tr> 
                <tr> 
                    <td> 
                        <strong>Modified</strong> 
                    </td> 
                    <td> 
                        ';echo JHTML::_('date',$row->modified,JText::_('DATE_FORMAT_LC2'));;echo '                    </td> 
                </tr> 
            </tbody> 
        </table> 
';
echo $pane->startPane("menu-pane");
echo $pane->startPanel(JText :: _('Publishing'),"param-publishing");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key">';echo JText :: _('Published');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','published','class="inputbox"',$row->published );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText :: _('Show Book Title');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','show_book_title','class="inputbox"',$row->show_book_title );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Print Icon');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','printIcon','class="inputbox"',$row->printIcon );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Email Icon');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','emailIcon','class="inputbox"',$row->emailIcon );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText :: _('Show Book Description');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','show_book_description','class="inputbox"',$row->show_book_description );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText :: _('Show Pages Description');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','show_pages_description','class="inputbox"',$row->show_pages_description );;echo '</td> 
                </tr> 
            </table> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Parameters (Basic)'),"param-basic_parameters");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Pages Width');;echo '::';echo JText::_( 'Pages Width Description');;echo '">';echo JText :: _('Pages Width');;echo '</span></td> 
                    <td><input name="book_width" type="text" class="text_area" id="book_width" value="';echo $row->book_width;;echo '"/></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Pages Height');;echo '::';echo JText::_( 'Pages Height Description');;echo '">';echo JText :: _('Pages Height');;echo '</span></td> 
                    <td><input name="book_height" type="text" class="text_area" id="book_height" value="';echo $row->book_height;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Flash Width');;echo '::';echo JText::_( 'Flash Width Description');;echo '">';echo JText :: _('Flash Width');;echo '</span></td> 
                    <td><input name="flash_width" type="text" class="text_area" id="flash_width" value="';echo $row->flash_width;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Flash Height');;echo '::';echo JText::_( 'Flash Height Description');;echo '">';echo JText :: _('Flash Height');;echo '</span></td> 
                    <td><input name="flash_height" type="text" class="text_area" id="flash_height" value="';echo $row->flash_height;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Hardcover');;echo '::';echo JText::_( 'Hardcover Description');;echo '">';echo JText :: _('Hardcover');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','hardcover','class="inputbox"',$row->hardcover );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Book Direction');;echo '::';echo JText::_( 'Book Direction Description');;echo '">';echo JText :: _('Book Direction');;echo '</span></td> 
                    <td>';echo $lists['bookDirection'];;echo '</td> 
                </tr> 
            </table> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Parameters (Advanced)'),"param-advanced_parameters");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Center Book');;echo '::';echo JText::_( 'Center Book Description');;echo '">';echo JText :: _('Center Book');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','center_book','class="inputbox"',$row->center_book );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Scale Content');;echo '::';echo JText::_( 'Scale Content Description');;echo '">';echo JText :: _('Scale Content');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','scale_content','class="inputbox"',$row->scale_content );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Always Opened');;echo '::';echo JText::_( 'Always Opened Description');;echo '">';echo JText :: _('Always Opened');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','always_opened','class="inputbox"',$row->always_opened );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Transparent Pages');;echo '::';echo JText::_( 'Transparent Pages Description');;echo '">';echo JText :: _('Transparent Pages');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','transparent_pages','class="inputbox"',$row->transparent_pages );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Frame Width');;echo '::';echo JText::_( 'Frame Width Description');;echo '">';echo JText :: _('Frame Width');;echo '</span></td> 
                    <td nowrap="nowrap"><input name="frame_width" type="text" class="text_area" id="frame_width" value="';echo $row->frame_width;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Frame Color');;echo '::';echo JText::_( 'Frame Color Description');;echo '">';echo JText :: _('Frame Color');;echo '</span></td> 
                    <td nowrap="nowrap"><input name="frame_color" type="text" maxlength="6" id="frame_color" value="';echo $row->frame_color;;echo '" />&nbsp;<a href="javascript:onclick=colorSelector(\'frame_color\',\'none\');"><img src="components/com_flippingbook/images/icon_colors.png" alt="Select coor" align="top" border="0" width="16" height="16"></a></td>
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Fullscreen Hint');;echo '::';echo JText::_( 'Fullscreen Hint Description');;echo '">';echo JText :: _('Fullscreen Hint');;echo '</span></td> 
                    <td><input name="fullscreen_hint" type="text" class="text_area" id="fullscreen_hint" value="';echo $row->fullscreen_hint;;echo '"/></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'First Page Number');;echo '::';echo JText::_( 'First Page Number Description');;echo '">';echo JText :: _('First Page Number');;echo '</span></td> 
                    <td><input name="first_page" type="text" class="text_area" id="first_page" value="';echo $row->first_page;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Flip Area');;echo '::';echo JText::_( 'Flip Area Description');;echo '">';echo JText :: _('Flip Area');;echo '</span></td> 
                    <td><input name="auto_flip_size" type="text" class="text_area" id="auto_flip_size" value="';echo $row->auto_flip_size;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Static Shadow Depth');;echo '::';echo JText::_( 'Static Shadow Depth Description');;echo '">';echo JText :: _('Static Shadow Depth');;echo '</span></td> 
                    <td><input name="static_shadows_depth" type="text" class="text_area" id="static_shadows_depth" value="';echo $row->static_shadows_depth;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Dynamic Shadow Depth');;echo '::';echo JText::_( 'Dynamic Shadow Depth Description');;echo '">';echo JText :: _('Dynamic Shadow Depth');;echo '</span></td> 
                    <td><input name="dynamic_shadows_depth" type="text" class="text_area" id="dynamic_shadows_depth" value="';echo $row->dynamic_shadows_depth;;echo '" /></td>
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Static Shadows Type');;echo '::';echo JText::_( 'Static Shadows Type Description');;echo '">';echo JText :: _('Static Shadows Type');;echo '</span></td> 
                    <td>';echo $lists['staticShadowsType'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Flip Corner Style');;echo '::';echo JText::_( 'Flip Corner Style Description');;echo '">';echo JText :: _('Flip Corner Style');;echo '</span></td> 
                    <td>';echo $lists['flipCornerStyle'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Allow Pages Unload');;echo '::';echo JText::_( 'Allow Pages Unload Description');;echo '">';echo JText :: _('Allow Pages Unload');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','allow_pages_unload','class="inputbox"',$row->allow_pages_unload );;echo '</td> 
                </tr> 
            </table> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Background'),"param-background");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Background Image');;echo '::';echo JText::_( 'Background Image Description');;echo '">';echo JText :: _('Background Image');;echo '</span></td> 
                    <td>';echo $lists['background_image'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Background Image Placement');;echo '</label></td> 
                    <td>';echo $lists['backgroundImagePlacement'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Background Color');;echo '::';echo JText::_( 'Background Color Description');;echo '">';echo JText :: _('Background Color');;echo '</span></td> 
                    <td><input name="background_color" type="text" maxlength="6" id="background_color" value="';echo $row->background_color;;echo '" />&nbsp;<a href="javascript:onclick=colorSelector(\'background_color\',\'none\');"><img src="components/com_flippingbook/images/icon_colors.png" alt="Select coor" align="top" border="0" width="16" height="16"></a></td>
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Page Background Color');;echo '::';echo JText::_( 'Page Background Color Description');;echo '">';echo JText :: _('Page Background Color');;echo '</span></td> 
                    <td><input name="page_background_color" type="text" maxlength="6" id="page_background_color" value="';echo $row->page_background_color;;echo '" />&nbsp;<a href="javascript:onclick=colorSelector(\'page_background_color\',\'none\');"><img src="components/com_flippingbook/images/icon_colors.png" alt="Select coor" align="top" border="0" width="16" height="16"></a></td>
                </tr> 
            </table> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Navigation Bar'),"param-navigationbar");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Navigation Bar File');;echo '::';echo JText::_( 'Navigation Bar File Description');;echo '">';echo JText :: _('Navigation Bar File');;echo '</span></td> 
                    <td>';echo $lists['navigationBarFiles'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Navigation Bar Placement');;echo '::';echo JText::_( 'Navigation Bar Placement Description');;echo '">';echo JText :: _('Navigation Bar Placement');;echo '</span></td> 
                    <td>';echo $lists['navigationBarPlacement'];;echo '</td> 
                </tr>   
                <tr> 
                    <td class="key">';echo JText::_( 'Show Fullscreen Button');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','fullscreen_enabled','class="inputbox"',$row->fullscreen_enabled );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Show "Go To Page" field');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','go_to_page_field','class="inputbox"',$row->go_to_page_field );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Show Slideshow Button');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','slideshow_button','class="inputbox"',$row->slideshow_button );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Show "First" and "Last" Buttons');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','first_last_buttons','class="inputbox"',$row->first_last_buttons );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Print Button');;echo '::';echo JText::_( 'Print Button Description');;echo '">';echo JText :: _('Print Button');;echo '</span></td> 
                    <td nowrap="nowrap">';echo JHTML::_( 'select.booleanlist','print_enabled','class="inputbox"',$row->print_enabled );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Show Sound Control Button');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','sound_control_button','class="inputbox"',$row->sound_control_button );;echo '</td> 
                </tr> 
            </table> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Zoom Settings'),"param-zooming");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zoom Enabled');;echo '::';echo JText::_( 'Zoom Enabled Description');;echo '">';echo JText :: _('Zoom Enabled');;echo '</span></td> 
                    <td>';echo JHTML::_( 'select.booleanlist','zoom_enabled','class="inputbox"',$row->zoom_enabled );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Show Zoom Hint');;echo '::';echo JText::_( 'Show Zoom Hint Description');;echo '">';echo JText :: _('Show Zoom Hint');;echo '</span></td> 
                    <td>';echo JHTML::_( 'select.booleanlist','show_zoom_hint','class="inputbox"',$row->show_zoom_hint );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zooming Method');;echo '::';echo JText::_( 'Zooming Method Description');;echo '">';echo JText :: _('Zooming Method');;echo '</span></td> 
                    <td>';echo $lists['zoomingMethod'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zoom Image Height');;echo '::';echo JText::_( 'Zoom Image Height Description');;echo '">';echo JText :: _('Zoom Image Height');;echo '</span></td> 
                    <td><input name="zoom_image_height" type="text" class="text_area" id="zoom_image_height" value="';echo $row->zoom_image_height;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zoom Image Width');;echo '::';echo JText::_( 'Zoom Image Width Description');;echo '">';echo JText :: _('Zoom Image Width');;echo '</span></td> 
                    <td><input name="zoom_image_width" type="text" class="text_area" id="zoom_image_width" value="';echo $row->zoom_image_width;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Zoom UI Color');;echo '::';echo JText::_( 'Zoom UI Color Description');;echo '">';echo JText :: _('Zoom UI Color');;echo '</span></td> 
                    <td><input name="zoom_ui_color" type="text" maxlength="6" id="zoom_ui_color" value="';echo $row->zoom_ui_color;;echo '" />&nbsp;<a href="javascript:onclick=colorSelector(\'zoom_ui_color\',\'none\');"><img src="components/com_flippingbook/images/icon_colors.png" alt="Select coor" align="top" border="0" width="16" height="16"></a></td>
                </tr> 
            </table> 
            <script language="javascript" type="text/javascript"> 
                var zoom_image_height_obj = document.getElementById("zoom_image_height"); 
                var zoom_image_width_obj = document.getElementById("zoom_image_width"); 
                var zooming_method_obj = document.getElementById("zooming_method"); 
                function check_method() { 
                    if (zooming_method_obj.selectedIndex == 1) { 
                        zoom_image_height_obj.disabled = true; 
                        zoom_image_width_obj.disabled = true; 
                    } else { 
                        zoom_image_height_obj.disabled = false; 
                        zoom_image_width_obj.disabled = false; 
                    } 
                } 
                check_method(); 
            </script> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Download Book'),"param-download");
;echo '            <table class="admintable"> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Download URL');;echo '::';echo JText::_( 'Download URL Description');;echo '">';echo JText :: _('Download URL');;echo '</span></td> 
                    <td><input name="download_url" type="text" class="text_area" id="download_url" value="';echo $row->download_url;;echo '"/></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Download Title');;echo '::';echo JText::_( 'Download Title Description');;echo '">';echo JText :: _('Download Title');;echo '</span></td> 
                    <td><input name="download_title" type="text" class="text_area" id="download_title" value="';echo $row->download_title;;echo '"/></td> 
                </tr> 
                <tr> 
                    <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'File Size');;echo '::';echo JText::_( 'File Size Description');;echo '">';echo JText :: _('File Size');;echo '</span></td> 
                    <td><input name="download_size" type="text" class="text_area" id="download_size" value="';echo $row->download_size;;echo '"/></td> 
                </tr> 
            </table> 
';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Slideshow'),"param-slideshow");
;echo ' 
<table class="admintable"> 
    <tr> 
        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Turn Slideshow On');;echo '::';echo JText::_( 'Turn Slideshow On Description');;echo '">';echo JText :: _('Turn Slideshow On');;echo '</span></td> 
        <td>';echo JHTML::_( 'select.booleanlist','slideshow_auto_play','class="inputbox"',$row->slideshow_auto_play );;echo '</label></td> 
    </tr> 
    <tr> 
        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Page Browsing Interval');;echo '::';echo JText::_( 'Page Browsing Interval Description');;echo '">';echo JText :: _('Page Browsing Interval');;echo '</span></td> 
        <td><input name="slideshow_display_duration" type="text" class="inputbox" id="slideshow_display_duration" style="width:130px;" value="';echo $row->slideshow_display_duration;;echo '" size="5" /></td> 
    </tr> 
</table> 

';
echo $pane->endPanel();
echo $pane->startPanel(JText :: _('Book Window'),"param-book_window");
;echo ' 
<table class="admintable"> 
    <tr> 
        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Book Link Target');;echo '::';echo JText::_( 'Book Link Target Description');;echo '">';echo JText :: _('Book Link Target');;echo '</span></td> 
        <td><select name="open_book_in" id="open_book_in" class="inputbox" size="3" onchange="check_window_target()"> 
            <option value="1" ';if ($row->open_book_in == 1) echo 'selected="selected"';;echo '>';echo JText::_( 'Parent Window With Browser Navigation');;echo '</option> 
            <option value="3" ';if ($row->open_book_in == 3) echo 'selected="selected"';;echo '>';echo JText::_( 'New Window Without Browser Navigation');;echo '</option> 
            <option value="4" ';if ($row->open_book_in == 4) echo 'selected="selected"';;echo '>';echo JText::_( 'Fullscreen Popup Window');;echo '</option> 
            </select> 
        </td> 
    </tr> 
    <tr> 
        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'New Window Width');;echo '::';echo JText::_( 'New Window Width Description');;echo '">';echo JText :: _('New Window Width');;echo '</span></td> 
        <td><input name="new_window_width" type="text" class="inputbox" id="new_window_width" style="width:130px;" value="';echo $row->new_window_width;;echo '"/></td> 
    </tr> 
    <tr> 
        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'New Window Height');;echo '::';echo JText::_( 'New Window Height Description');;echo '">';echo JText :: _('New Window Height');;echo '</span></td> 
        <td><input name="new_window_height" type="text" class="inputbox" id="new_window_height" style="width:130px;" value="';echo $row->new_window_height;;echo '"/></td> 
    </tr> 
</table> 
<script language="javascript" type="text/javascript"> 
var new_window_width_obj = document.getElementById("new_window_width"); 
var new_window_height_obj = document.getElementById("new_window_height"); 
var open_book_in_list = document.getElementById("open_book_in"); 
function check_window_target() { 
    if ((open_book_in_list.selectedIndex == 0)||(open_book_in_list.selectedIndex == 2)) { 
        new_window_width_obj.disabled = true; 
        new_window_height_obj.disabled = true; 
    } else { 
        new_window_width_obj.disabled = false; 
        new_window_height_obj.disabled = false; 
    } 
} 
check_window_target(); 
</script> 

';
echo $pane->endPanel();
echo $pane->endPane();
;echo '<script language="JavaScript" type="text/javascript"> 
function getScrollY() { 
    var scrOfX = 0,scrOfY=0; 
    if (typeof(window.pageYOffset) == \'number\') { 
        scrOfY=window.pageYOffset; 
        scrOfX=window.pageXOffset; 
    } else if(document.body&&(document.body.scrollLeft||document.body.scrollTop)) { 
        scrOfY=document.body.scrollTop; 
        scrOfX=document.body.scrollLeft; 
    } else if(document.documentElement&&(document.documentElement.scrollLeft||document.documentElement.scrollTop)) { 
        scrOfY=document.documentElement.scrollTop;scrOfX=document.documentElement.scrollLeft; 
    }  
    return scrOfY; 
} 

document.write("<style>.colorpicker301{text-align:center;visibility:hidden;display:none;position:absolute;background-color:#FFF;border:solid 1px #CCC;padding:4px;z-index:999;filter:progid:DXImageTransform.Microsoft.Shadow(color=#D0D0D0,direction=135);}.o5582brd{border-bottom:solid 1px #DFDFDF;border-right:solid 1px #DFDFDF;padding:0;width:8px;height:8px;}a.o5582n66,.o5582n66,.o5582n66a{font-family:arial,tahoma,sans-serif;line-height: 7px;text-decoration:underline;font-size:10px;color:#666;border:none;}.o5582n66,.o5582n66a{text-align:center;line-height: 7px;text-decoration:none;}a:hover.o5582n66{text-decoration:none;line-height: 7px;color:#FFA500;cursor:pointer;}.a01p3{padding:1px 4px 1px 2px;background:whitesmoke;border:solid 1px #DFDFDF;}</style>"); 

function gett6op6() { 
    csBrHt=0; 
    if (typeof(window.innerWidth)==\'number\') { 
            csBrHt=window.innerHeight; 
    } else if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)) { 
            csBrHt=document.documentElement.clientHeight; 
    } else if(document.body&&(document.body.clientWidth||document.body.clientHeight)) { 
            csBrHt=document.body.clientHeight; 
    } 
    ctop=((csBrHt/2)-132)+getScrollY(); 
    return ctop; 
} 

function getLeft6() { 
    var csBrWt=0; 
    if(typeof(window.innerWidth)==\'number\') { 
        csBrWt=window.innerWidth; 
    } else if (document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)) { 
        csBrWt=document.documentElement.clientWidth; 
    } else if (document.body&&(document.body.clientWidth||document.body.clientHeight)) { 
        csBrWt=document.body.clientWidth; 
    }  
    cleft=(csBrWt/2)-125; 
    return cleft; 
} 

var nocol1="&#78;&#79;&#32;&#67;&#79;&#76;&#79;&#82;", 
clos1="&#67;&#76;&#79;&#83;&#69;", 
tt6="&#70;&#82;&#69;&#69;&#45;&#67;&#79;&#76;&#79;&#82;&#45;&#80;&#73;&#67;&#75;&#69;&#82;&#46;&#67;&#79;&#77;", 
hm6="&#104;&#116;&#116;&#112;&#58;&#47;&#47;&#119;&#119;&#119;&#46;"; 
hm6+=tt6; 
tt6="&#80;&#79;&#87;&#69;&#82;&#69;&#68;&#32;&#98;&#121;&#32;&#70;&#67;&#80;"; 

function setCCbldID6(objID,val) { 
    document.getElementById(objID).value=val; 
} 

function setCCbldSty6(objID,prop,val) { 
    switch(prop) { 
        case "bc": 
            if(objID!=\'none\') { 
                document.getElementById(objID).style.backgroundColor=val; 
            } 
        break; 
        case "vs": 
            document.getElementById(objID).style.visibility=val; 
        break; 
        case "ds": 
            document.getElementById(objID).style.display=val; 
        break; 
        case "tp": 
            document.getElementById(objID).style.top=val; 
        break; 
        case "lf": 
            document.getElementById(objID).style.left=val; 
        break; 
    } 
} 

function putOBJxColor6(OBjElem,Samp,pigMent) { 
    if( pigMent!=\'x\') { 
        setCCbldID6(OBjElem,pigMent); 
        setCCbldSty6(Samp,\'bc\',pigMent); 
    } 
    setCCbldSty6(\'colorpicker301\',\'vs\',\'hidden\'); 
    setCCbldSty6(\'colorpicker301\',\'ds\',\'none\'); 
} 

function colorSelector(OBjElem,Sam){ 
    var objX=new Array(\'00\',\'33\',\'66\',\'99\',\'CC\',\'FF\'); 
    var c=0; 
    var z=\'"\'+OBjElem+\'","\'+Sam+\'",""\'; 
    var xl=\'"\'+OBjElem+\'","\'+Sam+\'","x"\'; 
    var mid=\'\'; 
    mid+=\'<center><table bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" style="border:solid 1px #F0F0F0;padding:2px;">\'; 
    mid+="<tr><td colspan=\'18\' align=\'center\' style=\'margin:0;padding:2px;height:14px;\' ><input class=\'o5582n66\' type=\'text\' size=\'10\' id=\'o5582n66\' value=\'FFFFFF\'><input class=\'o5582n66a\' type=\'text\' size=\'2\' style=\'width:14px;\' id=\'o5582n66a\' value=\'\' style=\'border:solid 1px #666;\'>&nbsp;&nbsp;&nbsp;<a class=\'o5582n66\' href=\'javascript:onclick=putOBJxColor6("+xl+")\'><span class=\'a01p3\'>"+clos1+"</span></a></td></tr><tr>";
    var br=1; 
    for (o=0;o<6;o++) { 
        mid+=\'</tr><tr>\'; 
        for(y=0;y<6;y++) { 
            if(y==3) { 
                mid+=\'</tr><tr>\'; 
            } 
            for(x=0;x<6;x++) { 
                var grid=\'\'; 
                grid=objX[o]+objX[y]+objX[x]; 
                var b="\'"+OBjElem+"\', \'"+Sam+"\',\'"+grid+"\'"; 
                mid+=\'<td class="o5582brd" style="background-color:#\'+grid+\'"><a class="o5582n66" href="javascript:onclick=putOBJxColor6(\'+b+\');" onmouseover=javascript:document.getElementById("o5582n66").value="\'+grid+\'";javascript:document.getElementById("o5582n66a").style.backgroundColor="#\'+grid+\'"; title="\'+grid+\'"><div style="width:8px;height:8px;"></div></a></td>\';
                c++; 
            } 
        } 
    } 
    mid+=\'</tr></table>\'; 
    var objX=new Array(\'0\',\'3\',\'6\',\'9\',\'C\',\'F\'); 
    var c=0; 
    var z=\'"\'+OBjElem+\'","\'+Sam+\'",""\'; 
    var xl=\'"\'+OBjElem+\'","\'+Sam+\'","x"\'; 
    mid+=\'<table bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" style="border:solid 1px #F0F0F0;padding:1px;"><tr>\'; 
    var br=0; 
    for(y=0;y<6;y++) { 
        for(x=0;x<6;x++) { 
            if(br==18) { 
                br=0;mid+=\'</tr><tr>\'; 
            } 
            br++; 
            var grid=\'\'; 
            grid=objX[y]+objX[x]+objX[y]+objX[x]+objX[y]+objX[x]; 
            var b="\'"+OBjElem+"\', \'"+Sam+"\',\'"+grid+"\'"; 
            mid+=\'<td class="o5582brd" style="background-color:#\'+grid+\'"><a class="o5582n66" href="javascript:onclick=putOBJxColor6(\'+b+\');" onmouseover=javascript:document.getElementById("o5582n66").value="\'+grid+\'";javascript:document.getElementById("o5582n66a").style.backgroundColor="#\'+grid+\'"; title="\'+grid+\'"><div style="width:8px;height:8px;"></div></a></td>\';
            c++; 
        } 
    } 
    mid+="</tr>"; 
    mid+=\'</table></center>\'; 
    setCCbldSty6(\'colorpicker301\',\'tp\',\'100px\'); 
    document.getElementById(\'colorpicker301\').style.top=gett6op6(); 
    document.getElementById(\'colorpicker301\').style.left=getLeft6(); 
    setCCbldSty6(\'colorpicker301\',\'vs\',\'visible\'); 
    setCCbldSty6(\'colorpicker301\',\'ds\',\'block\'); 
    document.getElementById(\'colorpicker301\').innerHTML=mid; 
} 
</script> 
<div id="colorpicker301" class="colorpicker301"></div> 
        </td> 
    </tr> 
</table> 

        <input type="hidden" name="created" value="';echo $row->created;;echo '" /> 
        <input type="hidden" name="task" value="" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
        <input type="hidden" name="id" value="';echo $row->id;;echo '" /> 
        <input type="hidden" name="cid[]" value="';echo $row->id;;echo '" /> 
</form> 
        ';
}
}
?>