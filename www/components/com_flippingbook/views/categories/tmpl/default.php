<?php  
defined('_JEXEC') or die('Restricted access');

$current_itemid = intval( @$Itemid );
if ( !$current_itemid ) 
$current_itemid = '';
else 
$current_itemid = '&amp;Itemid='.$current_itemid;

?>
<table width="800" style="margin-left:100px;" class="fb_book_list_table">
	<?php foreach($this->categories_list as $row){ ?>
		<tr>
			<td width="220">
				<a href="<?php echo JRoute::_("index.php?option=com_flippingbook&amp;view=category&amp;id=".$row->slug .$current_itemid); ?>">
					<img src="images/flippingbook/<?php echo $row->preview_image; ?>" border="0" alt="<?php echo $row->title; ?>" />
				</a>
			</td>
			<td>
				<a href="<?php echo JRoute::_("index.php?option=com_flippingbook&amp;view=category&amp;id=".$row->slug .$current_itemid); ?>"><?php echo $row->title; ?></a>
				<br/>
				<?php if(strlen(trim($row->description))>0){
						echo $row->description;
				} ?>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	<?php } ?>
</table>