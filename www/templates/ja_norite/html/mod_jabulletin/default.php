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

defined('_JEXEC') or die('Restricted access'); ?>
<ul class="ja-bullettin<?php echo $params->get('moduleclass_sfx'); ?> clearfix">
<?php foreach ($list as $item) : ?>
	<li>
			<?php 
			$padding = ($params->get( 'show_image'))?"style=\"padding-left:".($params->get('width')+10)."px\"":"";
			if (isset($item->image)) : 
			?>
			<?php if( $item->image ) : ?>
				<a href="<?php echo $item->link; ?>" class="mostread<?php echo $params->get('moduleclass_sfx'); ?>-image">
					<?php echo $item->image; ?>
				</a>
			<?php endif; ?>
			<?php endif; ?>
			<div <?php echo $padding;?>>
			<a href="<?php echo $item->link; ?>" class="mostread<?php echo $params->get('moduleclass_sfx'); ?>"><?php echo $item->text; ?></a>
			<?php if (isset($item->date)) : ?>
			<br /><span><?php echo JHTML::_('date', $item->date, JText::_('DATE_FORMAT_LC2')); ?></span>
			<?php endif; ?>
			</div>

	</li>
<?php endforeach; ?>
</ul>