<?php
/**
 * @version		$Id: category_item.php 329 2010-01-15 19:39:21Z joomlaworks $
 * @package		K2
 * @author    JoomlaWorks http://www.joomlaworks.gr
 * @copyright	Copyright (c) 2006 - 2010 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

// Define default image size (do not change)
K2HelperUtilities::setDefaultImage($this->item, 'itemlist', $this->params);

?>

<!-- Start K2 Item Layout -->
<div class="catItemView group<?php echo ucfirst($this->item->itemGroup); ?><?php if($this->item->params->get('pageclass_sfx')) echo ' '.$this->item->params->get('pageclass_sfx'); ?>">

	<!-- Plugins: BeforeDisplay -->
	<?php echo $this->item->event->BeforeDisplay; ?>
	
	<!-- K2 Plugins: K2BeforeDisplay -->
	<?php echo $this->item->event->K2BeforeDisplay; ?>

	<?php if(isset($this->item->editLink)): ?>
	<!-- Item edit link -->
	<span class="catItemEditLink">
		<a class="modal" rel="{handler:'iframe',size:{x:990,y:650}}" href="<?php echo $this->item->editLink; ?>">
			<?php echo JText::_('Edit item'); ?>
		</a>
	</span>
	<?php endif; ?>

	<div class="ItemHeader clearfix">
	
		<?php if($this->item->params->get('catItemTitle')): ?>
		<!-- Item title -->
		<h2 class="contentheading clearfix">
		<?php if ($this->item->params->get('catItemTitleLinked')): ?>
			<a href="<?php echo $this->item->link; ?>">
			<?php echo $this->item->title; ?>
		</a>
		<?php else: ?>
		<?php echo $this->item->title; ?>
		<?php endif; ?>

		<?php if($this->item->params->get('catItemFeaturedNotice') && $this->item->featured): ?>
		<!-- Featured flag -->
		<span>
			<sup>
				<?php echo JText::_('Featured'); ?>
			</sup>
		</span>
		<?php endif; ?>

		</h2>
		<?php endif; ?>
		
		<?php if(
				$this->item->params->get('catItemDateCreated') ||
				$this->item->params->get('catItemAuthor') ||
				($this->item->params->get('catItemCommentsAnchor') && ( ($this->item->params->get('comments') == '2' && !$this->user->guest) || ($this->item->params->get('comments') == '1')) )
		): ?>
		<div class="article-tools clearfix">
		<div class="article-meta">
		
			<?php if($this->item->params->get('catItemDateCreated')): ?>
			<!-- Date created -->
			<span class="createdate">
				<?php echo JHTML::_('date', $this->item->created , JText::_('DATE_FORMAT_LC3')); ?>
			</span>
			<?php endif; ?>

			<?php if($this->item->params->get('catItemAuthor')): ?>
			<!-- Item Author -->
			<span class="createby">
				<a href="<?php echo $this->item->author->link; ?>" title="<?php echo K2HelperUtilities::writtenBy($this->item->author->profile->gender)." ".$this->item->author->name; ?>" ><?php echo $this->item->author->name; ?></a>
			</span>
			<?php endif; ?>
  
			<?php if($this->item->params->get('catItemCommentsAnchor') && ( ($this->item->params->get('comments') == '2' && !$this->user->guest) || ($this->item->params->get('comments') == '1')) ): ?>
			<!-- Anchor link to comments below -->
			<span class="commentslink">
			
				<!-- K2 Plugins: K2CommentsCounter -->
				<?php echo $this->item->event->K2CommentsCounter; ?>
				<?php if(empty($this->item->event->K2CommentsCounter)):?>
					<?php if($this->item->numOfComments > 0): ?>
					<a href="<?php echo $this->item->link; ?>#itemCommentsAnchor">
						<?php echo $this->item->numOfComments; ?> <?php echo ($this->item->numOfComments>1) ? JText::_('comments') : JText::_('comment'); ?>
					</a>
					<?php else: ?>
					<a href="<?php echo $this->item->link; ?>#itemCommentsAnchor">
						<?php echo JText::_('0 Comment!'); ?>
					</a>
					<?php endif; ?>
				<?php endif;?>
			</span>
			<?php endif; ?>
	
		</div>
		</div>
		<?php endif; ?>
		
	</div>

  <!-- Plugins: AfterDisplayTitle -->
  <?php echo $this->item->event->AfterDisplayTitle; ?>
  
  <!-- K2 Plugins: K2AfterDisplayTitle -->
  <?php echo $this->item->event->K2AfterDisplayTitle; ?>

	<?php if($this->item->params->get('catItemRating')): ?>
	<!-- Item Rating -->
	<div class="ItemRatingBlock clearfix">
		<span><?php echo JText::_('Rate this item'); ?></span> 
		<div class="itemRatingForm">
			<ul class="ItemRatingList">
				<li class="itemCurrentRating" id="itemCurrentRating<?php echo $this->item->id; ?>" style="width:<?php echo $this->item->votingPercentage; ?>%;"></li>
				<li><a href="#" rel="<?php echo $this->item->id; ?>" title="<?php echo JText::_('1 star out of 5'); ?>" class="one-star">1</a></li>
				<li><a href="#" rel="<?php echo $this->item->id; ?>" title="<?php echo JText::_('2 stars out of 5'); ?>" class="two-stars">2</a></li>
				<li><a href="#" rel="<?php echo $this->item->id; ?>" title="<?php echo JText::_('3 stars out of 5'); ?>" class="three-stars">3</a></li>
				<li><a href="#" rel="<?php echo $this->item->id; ?>" title="<?php echo JText::_('4 stars out of 5'); ?>" class="four-stars">4</a></li>
				<li><a href="#" rel="<?php echo $this->item->id; ?>" title="<?php echo JText::_('5 stars out of 5'); ?>" class="five-stars">5</a></li>
			</ul>
			<div id="itemRatingLog<?php echo $this->item->id; ?>" class="itemRatingLog"><?php echo $this->item->numOfvotes; ?></div>
		</div>
	</div>
	<?php endif; ?>

  <div class="ItemBody">

	  <!-- Plugins: BeforeDisplayContent -->
	  <?php echo $this->item->event->BeforeDisplayContent; ?>
	  
	  <!-- K2 Plugins: K2BeforeDisplayContent -->
	  <?php echo $this->item->event->K2BeforeDisplayContent; ?>

	  <?php if($this->item->params->get('catItemImage') && !empty($this->item->image)): ?>
	  <!-- Item Image -->
	  <div class="ItemImageBlock">
		  <span class="ItemImage">
		    <a href="<?php echo $this->item->link; ?>" title="<?php if(!empty($this->item->image_caption)) echo $this->item->image_caption; else echo $this->item->title; ?>">
		    	<img src="<?php echo $this->item->image; ?>" alt="<?php if(!empty($this->item->image_caption)) echo $this->item->image_caption; else echo $this->item->title; ?>" style="width:<?php echo $this->item->imageWidth; ?>px; height:auto;" />
		    </a>
		  </span>
	  </div>
	  <?php endif; ?>
	  
	  <?php if($this->item->params->get('catItemIntroText')): ?>
	  <!-- Item introtext -->
	  <div class="ItemIntroText">
	  	<?php echo $this->item->introtext; ?>
	  </div>
	  <?php endif; ?>

	  <?php if($this->item->params->get('catItemExtraFields') && count($this->item->extra_fields)): ?>
	  <!-- Item extra fields -->  
	  <div class="ItemExtraFields">
	  	<h4><?php echo JText::_('Additional Info'); ?></h4>
	  	<ul>
			<?php foreach ($this->item->extra_fields as $key=>$extraField): ?>
			<li class="<?php echo ($key%2) ? "odd" : "even"; ?> type<?php echo ucfirst($extraField->type); ?> group<?php echo $extraField->group; ?>">
				<span class="ItemExtraFieldsLabel"><?php echo $extraField->name; ?></span>
				<span class="ItemExtraFieldsValue"><?php echo $extraField->value; ?></span>
				<br class="clr" />		
			</li>
			<?php endforeach; ?>
			</ul>
	  </div>
	  <?php endif; ?>
	  
	  <!-- Plugins: AfterDisplayContent -->
	  <?php echo $this->item->event->AfterDisplayContent; ?>
	  
	  <!-- K2 Plugins: K2AfterDisplayContent -->
	  <?php echo $this->item->event->K2AfterDisplayContent; ?>
  </div>

  <?php if(
  ($this->item->params->get('catItemDateModified')) ||
  $this->item->params->get('catItemHits') || 
  $this->item->params->get('catItemCategory') || 
  ($this->item->params->get('catItemTags') && count($this->item->tags)) ||  
  ($this->item->params->get('catItemAttachments') && count($this->item->attachments))
  ): ?>
  <div class="ItemLinks clearfix">
	
		<?php if($this->item->params->get('catItemDateModified')): ?>
		<!-- Item date modified -->
		<?php if($this->item->created != $this->item->modified): ?>
		<div class="modifydate">
			<?php echo JText::_('Last modified on'); ?> <?php echo JHTML::_('date', $this->item->modified, JText::_('DATE_FORMAT_LC2')); ?> 
		</div>
		<?php endif; ?>
		<?php endif; ?>

		<?php if($this->item->params->get('catItemHits')): ?>
		<!-- Item Hits -->
		<div class="ItemHitsBlock">
			<span class="ItemHits">
				<?php echo JText::_('Read'); ?> <b><?php echo $this->item->hits; ?></b> <?php echo JText::_('times'); ?>
			</span>
		</div>
		<?php endif; ?>

		<?php if($this->item->params->get('catItemCategory')): ?>
		<!-- Item category name -->
		<div class="ItemCategory">
			<span><?php echo JText::_('Published in'); ?></span>
			<a href="<?php echo $this->item->category->link; ?>"><?php echo $this->item->category->name; ?></a>
		</div>
		<?php endif; ?>
		
	  <?php if($this->item->params->get('catItemTags') && count($this->item->tags)): ?>
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

	  <?php if($this->item->params->get('catItemAttachments') && count($this->item->attachments)): ?>
	  <!-- Item attachments -->
	  <div class="ItemAttachmentsBlock">
		  <span><?php echo JText::_("Download attachments:"); ?></span>
		  <ul class="ItemAttachments">
		    <?php foreach ($this->item->attachments as $attachment): ?>
		    <li>
			    <a title="<?php echo htmlentities($attachment->titleAttribute, ENT_QUOTES, 'UTF-8'); ?>" href="<?php echo JRoute::_('index.php?option=com_k2&view=item&task=download&id='.$attachment->id); ?>">
			    	<?php echo $attachment->title ; ?>
			    </a>
			    <?php if($this->item->params->get('catItemAttachmentsCounter')): ?>
			    <span>(<?php echo $attachment->hits; ?> <?php echo (count($attachment->hits)==1) ? JText::_("download") : JText::_("downloads"); ?>)</span>
			    <?php endif; ?>
		    </li>
		    <?php endforeach; ?>
		  </ul>
	  </div>
	  <?php endif; ?>

  </div>
  <?php endif; ?>

  <?php if($this->item->params->get('catItemVideo') && !empty($this->item->video)): ?>
  <!-- Item video -->
  <div class="catItemVideoBlock clearfix">
  	<h3><?php echo JText::_('Related Video'); ?></h3>
  	<span class="catItemVideo<?php if($this->item->videoType=='embedded'): ?> embedded<?php endif; ?>"><?php echo $this->item->video; ?></span>
  </div>
  <?php endif; ?>
  
  <?php if($this->item->params->get('catItemImageGallery') && !empty($this->item->gallery)): ?>
  <!-- Item image gallery -->
  <div class="ItemImageGallery clearfix">
	  <h4><?php echo JText::_('Image Gallery'); ?></h4>
	  <?php echo $this->item->gallery; ?>
  </div>
  <?php endif; ?>

  <?php if($this->item->params->get('catItemNavigation') && !JRequest::getCmd('print') && (isset($this->item->nextLink) || isset($this->item->previousLink))): ?>
  <!-- Item navigation -->
  <div class="ItemNavigation clearfix">
  	<span class="ItemNavigationTitle"><?php echo JText::_('More in this category:'); ?></span>
	
		<?php if(isset($this->item->previousLink)): ?>
		<a class="catItemPrevious" href="<?php echo $this->item->previousLink; ?>" title="<?php echo $this->item->previousTitle; ?>" >
			&laquo; Prev
		</a>
		<?php endif; ?>
		
		<?php if(isset($this->item->nextLink)): ?>
		<a class="catItemNext" href="<?php echo $this->item->nextLink; ?>" title="<?php echo $this->item->nextTitle; ?>" >
			Next &raquo;
		</a>
		<?php endif; ?>
		
  </div>
  <?php endif; ?>
  
	<?php if ($this->item->params->get('catItemReadMore')): ?>
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
