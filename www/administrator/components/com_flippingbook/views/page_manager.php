<?php
defined( '_JEXEC') or die( 'Restricted access');
class PageManager {
function showPages( &$rows,&$pageNav,$option,&$lists ) {
$user =&JFactory::getUser();
$ordering = ($lists['order'] == 'm.book_id'||$lists['order'] == 'b.title');
JHTML::_('behavior.tooltip');
;echo '        <form action="index.php?option=com_flippingbook" method="post" name="adminForm"> 
            <table width="100%"> 
                <tr> 
                    <td align="left"> 
                        ';echo JText::_( 'Filter (File, Link URL, Zoom file)');;echo ': 
                        <input type="text" name="search" id="search" value="';echo $lists['search'];;echo '" class="text_area" onchange="document.adminForm.submit();" /> 
                        <button onclick="this.form.submit();">';echo JText::_( 'Go');;echo '</button> 
                        <button onclick="document.getElementById(\'search\').value=\'\';this.form.submit();">';echo JText::_( 'Reset');;echo '</button></td> 
                    <td align="center" nowrap="nowrap"> 
                        ';echo JText::_( 'Book Filter');;echo ':';
echo $lists['book'];
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
                        <th width="1%" nowrap="NOWRAP">';echo JHTML::_('grid.sort','ID','m.id',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th> 
                        <th nowrap="nowrap" class="title">';echo JHTML::_('grid.sort','File','m.file',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Book ID','m.book_id',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th>
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Book Title','b.title',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Published','m.published',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Link URL','m.link_url',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th> 
                        <th align="center" nowrap="nowrap">';echo JHTML::_('grid.sort','Zoom file','m.zoom_url',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '</th> 
                        <th colspan="3" nowrap="NOWRAP">';echo JHTML::_('grid.sort','Ordering','m.ordering',@$lists['order_Dir'],@$lists['order'],'page_manager');;echo '';echo JHTML::_('grid.order',$rows,'filesave.png','savepageorder');;echo '</th> 
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
$link         = 'index.php?option=com_flippingbook&task=edit_page&cid[]='.$row->id ;
$checked     = JHTML::_('grid.checkedout',$row,$i );
$published     = JHTML::_('grid.published',$row,$i );
;echo '                <tr class="';echo "row$k";;echo '"> 
                    <td>';echo $pageNav->getRowOffset( $i );;echo '</td> 
                    <td>';echo $checked;;echo '</td> 
                    <td align="center">';echo $row->id;;echo '</td> 
                    <td>';if ( JTable::isCheckedOut($user->get ('id'),$row->checked_out ) ) {
echo $row->title;
}else {;echo '                        <a href="';echo JRoute::_( $link );;echo '" title="';echo JText::_( 'Edit Page');;echo '">';echo $row->file;;echo '</a> 
                    ';};echo '</td> 
                    <td width="1%" align="center">';echo $row->book_id;;echo '</td> 
                    <td align="left">';echo $row->title;;echo '</td> 
                    <td align="center">';echo $published;;echo '</td> 
                    <td align="center">';echo $row->link_url;;echo '</td> 
                    <td>';echo $row->zoom_url;;echo '</td> 
                    <td width="1%" align="center">';echo $pageNav->orderUpIcon( $i,($row->book_id == @$rows[$i-1]->book_id) ,'orderup_page','Move Up',$ordering);;echo '</td> 
                    <td width="1%" align="center">';echo $pageNav->orderDownIcon( $i,$n,($row->book_id == @$rows[$i+1]->book_id),'orderdown_page','Move Down',$ordering );;echo '</td> 
                    <td width="1%" align="center" nowrap="nowrap">';$disabled = $ordering ?'': 'disabled="disabled"';;echo '<input type="text" name="order[]" size="5" value="';echo $row->ordering;;echo '" ';echo $disabled;;echo ' class="text_area" style="text-align: center" /></td> 
                </tr> 
                ';
$k = 1 -$k;
}
;echo '            </tbody> 
            </table> 
        </div> 

        <input type="hidden" name="option" value="';echo $option;;echo '" /> 
        <input type="hidden" name="task" value="page_manager" /> 
        <input type="hidden" name="section" value="page_manager" /> 
        <input type="hidden" name="boxchecked" value="0" /> 
        <input type="hidden" name="filter_order" value="';echo $lists['order'];;echo '" /> 
        <input type="hidden" name="filter_order_Dir" value="" /> 
        </form> 
        ';
}
function editPage( &$row,&$lists ) {
if (JRequest::getCmd('task') == 'add_page') {
$row->file = '';
$row->book_id = '';
$row->description = '';
$row->ordering = '0';
$row->published = '1';
$row->link_url = '';
$row->link_url_target = '';
$row->link_window_height = '600';
$row->link_window_width = '800';
$row->zoom_url = '';
$row->zoom_url_target = '';
$row->zoom_window_height = '600';
$row->zoom_window_width = '800';
}
JRequest::setVar( 'hidemainmenu',1 );
$editor =&JFactory::getEditor();
jimport('joomla.filter.output');
JFilterOutput::objectHTMLSafe( $row,ENT_QUOTES );
JHTML::_('behavior.tooltip');
;echo '<script language="javascript" type="text/javascript"> 
    function submitbutton(pressbutton) { 
        var form = document.adminForm; 
        if (pressbutton == \'cancel_page\') { 
            submitform( pressbutton ); 
            return; 
        } 
        // do field validation 
        /*if (form.title.value == "") { 
            alert( "" ); 
        }*/  
        else { 
            submitform( pressbutton ); 
        } 
    } 
     
</script> 
<form action="index.php" method="post" name="adminForm"> 
    <table class="admintable" width="100%"> 
        <tr> 
            <td valign="top"> 
                <table class="adminform"> 
                    <tr> 
                        <td class="key">';echo JText::_( 'Page ID');;echo '</td> 
                        <td>';echo $row->id ;;echo '</td> 
                    </tr> 
                    <tr> 
                        <td class="key">';echo JText :: _('Published');;echo '</td> 
                        <td>';echo JHTML::_( 'select.booleanlist','published','class="inputbox"',$row->published );;echo '</td> 
                    </tr> 
                    <tr> 
                        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Book');;echo '::';echo JText::_( 'Book Page Description');;echo '">';echo JText::_( 'Book');;echo '</span></td> 
                        <td>';echo $lists['books'];;echo '</td> 
                    </tr> 
                        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'File');;echo '::';echo JText::_( 'File Page Description');;echo '">';echo JText::_( 'File');;echo '</span></td> 
                        <td>';echo $lists['files'];;echo '</td> 
                    </tr> 
                    <tr> 
                        <td class="key"> 
                          <span class="editlinktip hasTip" title="';echo JText::_( 'Zoomed Image');;echo '::';echo JText::_( 'Zoomed Image Description');;echo '">';echo JText::_( 'Zoomed Image');;echo '</span></td> 
                        <td><table border="0" cellspacing="0" cellpadding="0"> 
                            <tr> 
                              <td>';echo $lists['zoomed_image'];;echo '</td> 
                              <td><span class="editlinktip hasTip" title="';echo JText::_( 'SWF File Width and Height');;echo '::';echo JText::_( 'SWF File Width and Height Description');;echo '">';echo JText::_( 'SWF File');;echo '</span> 
                              ';echo JText::_( 'Width');;echo ' <input name="zoom_width" type="text" class="text_area" id="zoom_width" value="';echo $row->zoom_width;;echo '" size="6" /></td> 
                              <td>';echo JText::_( 'Height');;echo ' <input name="zoom_height" type="text" class="text_area" id="zoom_height" value="';echo $row->zoom_height;;echo '" size="6" /></td> 
                            </tr> 
                          </table></td> 
                    </tr> 
                    <tr> 
                        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'Ordering');;echo '::';echo JText::_( 'Order Page Description');;echo '">';echo JText::_( 'Ordering');;echo '</span></td> 
                        <td><input name="ordering" type="text" class="text_area" id="ordering" value="';echo $row->ordering;;echo '" /></td> 
                    </tr> 
                    <tr> 
                        <td class="key"><span class="editlinktip hasTip" title="';echo JText::_( 'URL');;echo '::';echo JText::_( 'URL Description');;echo '">';echo JText::_( 'URL');;echo '</span></td> 
                        <td><input name="link_url" type="text" class="text_area" id="link_url" value="';echo $row->link_url;;echo '" size="50" /></td> 
                    </tr> 
                    <tr> 
                        <td class="key" style="text-align:left"><span class="key" style="text-align:left">';echo JText::_( 'Description');;echo '</span>:</td> 
                        <td></td> 
                    </tr> 
                    <tr> 
                        <td colspan="2">';echo $editor->display( 'description',$row->description,'100%','300','60','20',false ) ;;echo '</td> 
                    </tr> 
                </table> 
            </td> 
    </tr> 
</table> 

<script language="javascript" type="text/javascript"> 
var zoom_height_obj = document.getElementById("zoom_height"); 
var zoom_width_obj = document.getElementById("zoom_width"); 
var zoom_url_list = document.getElementById("zoom_url"); 

function update_fields_state() { 
    var file_ext = zoom_url_list.value.substring(zoom_url_list.value.length-3,zoom_url_list.value.length); 
     if (( file_ext == \'swf\')||(file_ext == \'SWF\')) { 
        zoom_height_obj.disabled = false; 
        zoom_width_obj.disabled = false; 
    } else { 
        zoom_height_obj.disabled = true; 
        zoom_width_obj.disabled = true; 
    } 
} 
update_fields_state(); 
</script> 
        <input type="hidden" name="task" value="" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
        <input type="hidden" name="id" value="';echo $row->id;;echo '" /> 
        <input type="hidden" name="cid[]" value="';echo $row->id;;echo '" /> 
</form> 
        ';
}
}
?>