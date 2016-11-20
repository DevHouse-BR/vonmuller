<?php 
/*
  # ------------------------------------------------------------------------
# JA Norite template for Joomla 1.5.x
# ------------------------------------------------------------------------
# Copyright (C) 2004-2010 JoomlArt.com. All Rights Reserved.
# @license - PHP files are GNU/GPL V2. CSS / JS are Copyrighted Commercial,
# bound by Proprietary License of JoomlArt. For details on licensing, 
# Please Read Terms of Use at http://www.joomlart.com/terms_of_use.html.
# Author: JoomlArt.com
# Websites:  http://www.joomlart.com -  http://www.joomlancers.com
# Redistribution, Modification or Re-licensing of this file in part of full, 
# is bound by the License applied. 
# ------------------------------------------------------------------------
*/
// no direct access
defined('_JEXEC') or die('Restricted access');
?>
<div class="ja-sidenews-list clearfix">
	<?php foreach( $list as $item ) : 
		if( $showdate) {
			$item->date =  strtotime ( $item->modified ) ? $item->created : $item->modified;
		}
		$item->text = $item->introtext . $item->fulltext;
	?>
		<div class="ja-slidenews-item">
			 
		  <?php if( $showimage ):  ?>
  		  	<?php echo $helper->renderImage ($item, $params, $descMaxChars, $iwidth, $iheight ); ?>
		  <?php endif; ?>

		  <a class="ja-title" href="<?php echo  $helper->getLink($item); ?>"><?php echo  $helper->trimString( $item->title, $titleMaxChars );?></a>
		  <?php if (isset($item->date)) : ?>
				<span class="ja-createdate"><?php echo JHTML::_('date', $item->date, JText::_('DATE_FORMAT_LC2')); ?></span>
		  <?php endif; ?>
			
		  <?php echo $helper->trimString( strip_tags($item->introtext), $descMaxChars); ?>
			
		  <?php if( $showMoredetail ) : ?>
		  <a class="readon" href="<?php echo  $helper->getLink($item); ?>"> <?php echo JTEXT::_("READ MORE..."); ?></a>
		  <?php endif;?>
		  
		</div>
  <?php endforeach; ?>
</div>