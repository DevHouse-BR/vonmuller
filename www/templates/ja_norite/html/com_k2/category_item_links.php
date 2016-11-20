<?php
/**
 * @version		$Id: category_item_links.php 303 2010-01-07 02:56:33Z joomlaworks $
 * @package		K2
 * @author    JoomlaWorks http://www.joomlaworks.gr
 * @copyright	Copyright (c) 2006 - 2010 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

// Define default image size (do not change)
$image = 'image'.$this->item->params->get($this->item->itemGroup.'ImgSize');

?>

<!-- Start K2 Item Layout (links) -->
	  <?php if($this->item->params->get('catItemTitle')): ?>
	  <!-- Item title -->
	  	<?php if ($this->item->params->get('catItemTitleLinked')): ?>
			<a href="<?php echo $this->item->link; ?>" class="group<?php echo ucfirst($this->item->itemGroup); ?><?php if($this->item->params->get('pageclass_sfx')) echo ' '.$this->item->params->get('pageclass_sfx'); ?>">
	  		<?php echo $this->item->title; ?>
	  	</a>
	  	<?php else: ?>
	  	<span class="class="group<?php echo ucfirst($this->item->itemGroup); ?><?php if($this->item->params->get('pageclass_sfx')) echo ' '.$this->item->params->get('pageclass_sfx'); ?>""><?php echo $this->item->title; ?></span>
	  	<?php endif; ?>
	  <?php endif; ?>
<!-- End K2 Item Layout (links) -->
