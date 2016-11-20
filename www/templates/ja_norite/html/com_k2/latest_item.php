<?php
/**
 * @version		$Id: latest_item.php 329 2010-01-15 19:39:21Z joomlaworks $
 * @package		K2
 * @author    JoomlaWorks http://www.joomlaworks.gr
 * @copyright	Copyright (c) 2006 - 2010 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

?>

<!-- Start K2 Item Layout -->
<div class="latestItemView">

	<!-- Plugins: BeforeDisplay -->
	<?php echo $this->item->event->BeforeDisplay; ?>

	<!-- K2 Plugins: K2BeforeDisplay -->
	<?php echo $this->item->event->K2BeforeDisplay; ?>

	  <?php if($this->item->params->get('latestItemTitle')): ?>
	  <!-- Item title -->
	  <h2 class="contentheading clearfix">
	  	<?php if ($this->item->params->get('latestItemTitleLinked')): ?>
			<a href="<?php echo $this->item->link; ?>">
	  		<?php echo $this->item->title; ?>
	  	</a>
	  	<?php else: ?>
	  	<?php echo $this->item->title; ?>
	  	<?php endif; ?>
	  </h2>
	  <?php endif; ?>
  
	<?php if(
			$this->item->params->get('latestItemDateCreated') ||
			($this->item->params->get('latestItemCommentsAnchor') && ( ($this->item->params->get('comments') == '2' && !$this->user->guest) || ($this->item->params->get('comments') == '1')) )
	): ?>
	<div class="article-tools clearfix">
	<div class="article-meta">
	
		<?php if($this->item->params->get('latestItemDateCreated')): ?>
		<!-- Date created -->
		<span class="createdate">
			<?php echo JHTML::_('date', $this->item->created , JText::_('DATE_FORMAT_LC3')); ?>
		</span>
		<?php endif; ?>

		<?php if($this->item->params->get('latestItemCommentsAnchor') && ( ($this->item->params->get('comments') == '2' && !$this->user->guest) || ($this->item->params->get('comments') == '1')) ): ?>
		<!-- Anchor link to comments below -->
		<span class="commentslink">
			<?php if($this->item->numOfComments > 0): ?>
			<a href="<?php echo $this->item->link; ?>#itemCommentsAnchor">
				<?php echo $this->item->numOfComments; ?> <?php echo ($this->item->numOfComments>1) ? JText::_('comments') : JText::_('comment'); ?>
			</a>
			<?php else: ?>
			<a href="<?php echo $this->item->link; ?>#itemCommentsAnchor">
				<?php echo JText::_('0 Comment'); ?>
			</a>
			<?php endif; ?>
		</span>
		<?php endif; ?>
	
	</div>
	</div>
	<?php endif; ?>

  <!-- Plugins: AfterDisplayTitle -->
  <?php echo $this->item->event->AfterDisplayTitle; ?>

  <!-- K2 Plugins: K2AfterDisplayTitle -->
  <?php echo $this->item->event->K2AfterDisplayTitle; ?>

  <div class="ItemBody">

	  <!-- Plugins: BeforeDisplayContent -->
	  <?php echo $this->item->event->BeforeDisplayContent; ?>

	  <!-- K2 Plugins: K2BeforeDisplayContent -->
	  <?php echo $this->item->event->K2BeforeDisplayContent; ?>

	  <?php if($this->item->params->get('latestItemImage') && !empty($this->item->image)): ?>
	  <!-- Item Image -->
	  <div class="ItemImageBlock">
		  <span class="ItemImage">
		    <a href="<?php echo $this->item->link; ?>" title="<?php if(!empty($this->item->image_caption)) echo $this->item->image_caption; else echo $this->item->title; ?>">
		    	<img src="<?php echo $this->item->image; ?>" alt="<?php if(!empty($this->item->image_caption)) echo $this->item->image_caption; else echo $this->item->title; ?>" style="width:<?php echo $this->item->imageWidth; ?>px;height:auto;" />
		    </a>
		  </span>
	  </div>
	  <?php endif; ?>

	  <?php if($this->item->params->get('latestItemIntroText')): ?>
	  <!-- Item introtext -->
	  <div class="ItemIntroText">
	  	<?php echo $this->item->introtext; ?>
	  </div>
	  <?php endif; ?>

		

	  <!-- Plugins: AfterDisplayContent -->
	  <?php echo $this->item->event->AfterDisplayContent; ?>

	  <!-- K2 Plugins: K2AfterDisplayContent -->
	  <?php echo $this->item->event->K2AfterDisplayContent; ?>
  </div>

  <?php if($this->item->params->get('latestItemCategory') || $this->item->params->get('latestItemTags')): ?>
  <div class="ItemLinks clearfix">

		<?php if($this->item->params->get('latestItemCategory')): ?>
		<!-- Item category name -->
		<div class="ItemCategory">
			<span><?php echo JText::_('Published in'); ?></span>
			<a href="<?php echo $this->item->category->link; ?>"><?php echo $this->item->category->name; ?></a>
		</div>
		<?php endif; ?>

	  <?php if($this->item->params->get('latestItemTags') && count($this->item->tags)): ?>
	  <!-- Item tags -->
	  <div class="ItemTagsBlock">
		  <span><?php echo JText::_("Tagged under"); ?></span>
		  <ul class="ItemTags">
		    <?php foreach ($this->item->tags as $tag): ?>
		    <li><a href="<?php echo $tag->link; ?>"><?php echo $tag->name; ?></a></li>
		    <?php endforeach; ?>
		  </ul>
	  </div>
	  <?php endif; ?>
  </div>
  <?php endif; ?>

  <?php if($this->params->get('latestItemVideo') && !empty($this->item->video)): ?>
  <!-- Item video -->
  <div class="latestItemVideoBlock clearfix">
  	<h3><?php echo JText::_('Related Video'); ?></h3>
	  <span class="latestItemVideo<?php if($this->item->videoType=='embedded'): ?> embedded<?php endif; ?>"><?php echo $this->item->video; ?></span>
  </div>
  <?php endif; ?>

	<?php if ($this->item->params->get('latestItemReadMore')): ?>
	<!-- Item "read more..." link -->
	<div class="ItemReadMore clearfix">
		<a class="readon" href="<?php echo $this->item->link; ?>">
			<span><?php echo JText::_('Read more...'); ?></span>
		</a>
	</div>
	<?php endif; ?>

  <!-- Add button use JA Comment -->
  <?php if(!JRequest::getInt('print') && file_exists(JPATH_SITE.DS.'components'.DS.'com_jacomment'.DS.'jacomment.php') && file_exists(JPATH_SITE.DS.'plugins'.DS.'system'.DS.'jacomment.php')){
		echo '{jacomment_addbutton link="'.$this->item->link.'"}';
		echo '{jacomment_count contentid='. $this->item->id.' option=com_k2 contenttitle='.$this->item->title.'}';
	}?>
   <!-- end button use JA Comment -->
    
  <!-- Plugins: AfterDisplay -->
  <?php echo $this->item->event->AfterDisplay; ?>

  <!-- K2 Plugins: K2AfterDisplay -->
  <?php echo $this->item->event->K2AfterDisplay; ?>
</div>
<!-- End K2 Item Layout -->
