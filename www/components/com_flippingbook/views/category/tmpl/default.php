<?php
defined( '_JEXEC') or die( 'Restricted access');
?>
<table width="800" style="margin-left:100px;" class="fb_book_list_table">
	<?php foreach($this->books as $row){ ?>
		<tr>
			<td width="220">
				<a href="<?php echo JRoute::_("index.php?option=com_flippingbook&amp;view=book&amp;id=".$row->slug ."&amp;catid=".$this->category->catslug ); ?>">
					<img src="images/flippingbook/<?php echo $row->preview_image; ?>" border="0" alt="<?php echo $row->title; ?>" />
				</a>
			</td>
			<td>
				<a href="<?php echo JRoute::_("index.php?option=com_flippingbook&amp;view=book&amp;id=".$row->slug ."&amp;catid=".$this->category->catslug ); ?>"><?php echo $row->title; ?></a>
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