<?php
/**
 * @version		$Id: generic.php 329 2010-01-15 19:39:21Z joomlaworks $
 * @package		K2
 * @author    JoomlaWorks http://www.joomlaworks.gr
 * @copyright	Copyright (c) 2006 - 2010 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

?>

<!-- Start K2 Generic Layout -->
<div id="k2Container" class="genericView<?php if($this->params->get('pageclass_sfx')) echo ' '.$this->params->get('pageclass_sfx'); ?>">

	<?php if($this->params->get('show_page_title')): ?>
	<!-- Page title -->
	<h1 class="componentheading<?php echo $this->params->get('pageclass_sfx')?>">
		<?php echo $this->escape($this->params->get('page_title')); ?>
	</h1>
	<?php endif; ?>

	<?php if($this->params->get('userFeed')): ?>
	<!-- RSS feed icon -->
	<div class="k2FeedIcon">
		<a href="<?php echo $this->feed; ?>" title="<?php echo JText::_('Subscribe to this RSS feed'); ?>">
			<span><?php echo JText::_('Subscribe to this RSS feed'); ?></span>
		</a>
	</div>
	<?php endif; ?>

	<?php if(count($this->items)): ?>
	<div class="genericItemList">
		<?php foreach($this->items as $item): ?>

		<!-- Start K2 Item Layout -->
		<div class="article_row clearfix">

			<div class="ItemHeader clearfix">
			
			  <?php if($item->params->get('genericItemTitle')): ?>
			  <!-- Item title -->
			  <h2 class="contentheading clearfix">
			  	<?php if ($item->params->get('genericItemTitleLinked')): ?>
					<a href="<?php echo $item->link; ?>">
			  		<?php echo $item->title; ?>
			  	</a>
			  	<?php else: ?>
			  	<?php echo $item->title; ?>
			  	<?php endif; ?>
			  </h2>
			  <?php endif; ?>
			  
				<?php if($item->params->get('genericItemDateCreated')): ?>
				<div class="article-tools clearfix">
				<div class="article-meta">
					<!-- Date created -->
					<span class="createdate">
						<?php echo JHTML::_('date', $item->created , JText::_('DATE_FORMAT_LC3')); ?>
					</span>
				</div>
				</div>
				<?php endif; ?>
		  </div>

		  <div class="ItemBody">
			  <?php if($item->params->get('genericItemImage') && !empty($item->imageGeneric)): ?>
			  <!-- Item Image -->
			  <div class="ItemImageBlock">
				  <span class="ItemImage">
				    <a href="<?php echo $item->link; ?>" title="<?php if(!empty($item->image_caption)) echo $item->image_caption; else echo $item->title; ?>">
				    	<img src="<?php echo $item->imageGeneric; ?>" alt="<?php if(!empty($item->image_caption)) echo $item->image_caption; else echo $item->title; ?>" style="width:<?php echo $item->params->get('itemImageGeneric'); ?>px; height:auto;" />
				    </a>
				  </span>
			  </div>
			  <?php endif; ?>
			  
			  <?php if($item->params->get('genericItemIntroText')): ?>
			  <!-- Item introtext -->
			  <div class="ItemIntroText">
			  	<?php echo $item->introtext; ?>
			  </div>
			  <?php endif; ?>

		  </div>
		  
		  <?php if($item->params->get('genericItemExtraFields') && count($item->extra_fields)): ?>
		  <!-- Item extra fields -->  
		  <div class="ItemExtraFields">
		  	<h4><?php echo JText::_('Additional Info'); ?></h4>
		  	<ul>
				<?php foreach ($item->extra_fields as $key=>$extraField): ?>
				<li class="<?php echo ($key%2) ? "odd" : "even"; ?> type<?php echo ucfirst($extraField->type); ?> group<?php echo $extraField->group; ?>">
					<span class="ItemExtraFieldsLabel"><?php echo $extraField->name; ?></span>
					<span class="ItemExtraFieldsValue"><?php echo $extraField->value; ?></span>
					<br class="clr" />		
				</li>
				<?php endforeach; ?>
				</ul>
		  </div>
		  <?php endif; ?>
		  
			<?php if($item->params->get('genericItemCategory')): ?>
			<!-- Item category name -->
			<div class="ItemLinks clearfix">
			<div class="ItemCategory">
				<span><?php echo JText::_('Published in'); ?></span>
				<a href="<?php echo $item->category->link; ?>"><?php echo $item->category->name; ?></a>
			</div>
			</div>
			<?php endif; ?>
			
			<?php if ($item->params->get('genericItemReadMore')): ?>
			<!-- Item "read more..." link -->
			<div class="ItemReadMore">
				<a class="readon" href="<?php echo $item->link; ?>">
					<span><?php echo JText::_('Read more...'); ?></span>
				</a>
			</div>
			<?php endif; ?>
		<div class="row_separator">&nbsp;</div>
		</div>
		<!-- End K2 Item Layout -->
		
		<?php endforeach; ?>
	</div>

	<!-- Pagination -->
	<?php if($this->pagination->getPagesLinks()): ?>
		<p class="counter"><?php echo $this->pagination->getPagesCounter(); ?></p>
		<div class="pagination">
			<?php echo $this->pagination->getPagesLinks(); ?>
		</div>
	<?php endif; ?>

	<?php endif; ?>
	
</div>
<!-- End K2 Generic Layout -->
