<?php 
defined( '_JEXEC') or die( 'Restricted access');
class CategoryManager {
function showCategories( &$rows,&$pageNav,$option,&$lists ) {
$user =&JFactory::getUser();
$ordering = ($lists['order'] == 'm.ordering');
JHTML::_('behavior.tooltip');;echo '<form action="index.php?option=com_flippingbook" method="post" name="adminForm"> 
    <div id="tablecell"> 
        <table class="adminlist"> 
            <thead> 
                <tr> 
                    <th width="5"> 
                        ';echo JText::_( 'NUM');;echo '</th> 
                    <th width="20"> 
                        <input type="checkbox" name="toggle" value="" onclick="checkAll(';echo count( $rows );;echo ');" /></th> 
                    <th width="1%" nowrap="nowrap">';echo JHTML::_('grid.sort','ID','m.id',@$lists['order_Dir'],@$lists['order'],'category_manager');;echo '</th> 
                    <th class="title"> 
                        ';echo JHTML::_('grid.sort','Title','m.title',@$lists['order_Dir'],@$lists['order'],'category_manager');;echo '</th> 
                    <th align="center">';echo JHTML::_('grid.sort','Books','numoptions',@$lists['order_Dir'],@$lists['order'],'category_manager');;echo '</th> 
                    <th align="center"> 
                        ';echo JHTML::_('grid.sort','Published','m.published',@$lists['order_Dir'],@$lists['order'],'category_manager');;echo '</th> 
                    <th align="center"> 
                        ';echo JText::_( 'Description');;echo '</th> 
                    <th colspan="3" nowrap="nowrap"> 
                        ';echo JHTML::_('grid.sort','Ordering','m.ordering',@$lists['order_Dir'],@$lists['order'],'category_manager');;echo '';echo JHTML::_('grid.order',$rows,'filesave.png','savecategoryorder');;echo '</th> 
                </tr> 
            </thead> 
            <tfoot> 
                <tr> 
                    <td colspan="10">';echo $pageNav->getListFooter();;echo '</td> 
                </tr> 
            </tfoot> 
            <tbody> 
            ';
$k = 0;
for ($i=0,$n=count( $rows );$i <$n;$i++) {
$row = &$rows[$i];
$link         = 'index.php?option=com_flippingbook&task=edit_category&cid[]='.$row->id ;
$checked     = JHTML::_('grid.checkedout',$row,$i );
$published     = JHTML::_('grid.published',$row,$i );;echo '                <tr class="';echo "row$k";;echo '"> 
                    <td> 
                        ';echo $pageNav->getRowOffset( $i );;echo '                    </td> 
                    <td> 
                        ';echo $checked;;echo '                    </td> 
                    <td align="center">';echo $row->id;;echo '</td> 
                    <td>';if ( JTable::isCheckedOut($user->get ('id'),$row->checked_out ) ) {
echo $row->title;
}else {
;echo '                        <a href="';echo JRoute::_( $link );;echo '" title="';echo JText::_( 'Edit Category');;echo '"> 
                        ';echo $row->title;;echo '</a> 
                        ';
};echo '                    </td> 
                    <td align="center">';echo $row->numoptions;;echo '</td> 
                    <td align="center"> 
                        ';echo $published;;echo '                    </td> 
                    <td> 
                        ';echo $row->description;;echo '                    </td> 
                    <td width="1%" align="center">';echo $pageNav->orderUpIcon( $i,true,'orderup_category','Move Down',$ordering );;echo '</td> 
                    <td width="1%" align="center">';echo $pageNav->orderDownIcon( $i,$n,true,'orderdown_category','Move Down',$ordering );;echo '</td> 
                    <td width="1%" align="center">';$disabled = $ordering ?'': 'disabled="disabled"';;echo '                    <input type="text" name="order[]" size="5" value="';echo $row->ordering;;echo '" ';echo $disabled;;echo ' class="text_area" style="text-align: center" /></td> 
                </tr> 
                ';
$k = 1 -$k;
}
;echo '            </tbody> 
        </table> 
    </div> 

    <input type="hidden" name="option" value="';echo $option;;echo '" /> 
    <input type="hidden" name="task" value="category_manager" /> 
    <input type="hidden" name="section" value="category_manager" /> 
    <input type="hidden" name="boxchecked" value="0" /> 
    <input type="hidden" name="filter_order" value="';echo $lists['order'];;echo '" /> 
    <input type="hidden" name="filter_order_Dir" value="" /> 
</form> 
';
}
function editCategory( &$row,&$lists ) {
if (JRequest::getCmd('task') == 'add_category') {
$row->title = 'New category';
$row->description = '';
$row->published = 1;
$row->ordering = 0;
$row->emailIcon = 1;
$row->printIcon = 1;
$row->colums = 2;
$row->style = "blog";
$row->preview_image = '';
}
JRequest::setVar( 'hidemainmenu',1 );
$editor =&JFactory::getEditor();
jimport('joomla.filter.output');
JFilterOutput::objectHTMLSafe( $row,ENT_QUOTES );
jimport('joomla.html.pane');
$pane =&JPane::getInstance('sliders');
JHTML::_('behavior.tooltip');
;echo '         
<script language="javascript" type="text/javascript"> 
    function submitbutton(pressbutton) { 
        var form = document.adminForm; 
        if (pressbutton == \'cancel_category\') { 
            submitform( pressbutton ); 
            return; 
        } 
        // do field validation 
        if (form.title.value == "") { 
            alert( "';echo JText::_( 'Category must have a title',true );;echo '" ); 
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
                <tr> 
                    <td class="key"><label for="title">';echo JText::_( 'Title');;echo '</label></td> 
                    <td><input class="inputbox" type="text" name="title" id="title" size="60" value="';echo $row->title;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key"><label for="alias">';echo JText::_( 'Alias');;echo '</label></td> 
                    <td><input class="inputbox" type="text" name="alias" id="alias" size="60" value="';echo $row->alias;;echo '" /></td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText :: _('Show Title');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','show_title','class="inputbox"',$row->show_title );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText :: _('Published');;echo '</td> 
                    <td>';echo JHTML::_( 'select.booleanlist','published','class="inputbox"',$row->published );;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Columns In Book List');;echo '</td> 
                    <td>';echo $lists['columns'];;echo '</td> 
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
                    <td class="key">';echo JText :: _('Preview Image');;echo '</td> 
                    <td>';echo $lists['preview_image'];;echo '</td> 
                </tr> 
                <tr> 
                    <td class="key">';echo JText::_( 'Description');;echo '</td> 
                    <td>';echo $editor->display( 'description',$row->description,'100%','300','60','20',false ) ;;echo '</td> 
                </tr> 
            </table> 
        </td> 
        <td valign="top"> 
        </td> 
    </tr> 
</table> 
        <input type="hidden" name="task" value="" /> 
        <input type="hidden" name="option" value="com_flippingbook" /> 
        <input type="hidden" name="id" value="';echo $row->id;;echo '" /> 
        <input type="hidden" name="cid[]" value="';echo $row->id;;echo '" /> 
        <input type="hidden" name="ordering" value="';echo $row->ordering;;echo '" /> 
</form> 
        ';
}
}
?>