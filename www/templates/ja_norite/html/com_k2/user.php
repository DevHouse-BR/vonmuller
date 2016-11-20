<?php
/**
 * @version		$Id: user.php 329 2010-01-15 19:39:21Z joomlaworks $
 * @package		K2
 * @author    JoomlaWorks http://www.joomlaworks.gr
 * @copyright	Copyright (c) 2006 - 2010 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

// Get user stuff (do not change)
$user = &JFactory::getUser();

?>

<!-- Start K2 User Layout -->

<div id="k2Container" class="userView<?php if($this->params->get('pageclass_sfx')) echo ' '.$this->params->get('pageclass_sfx'); ?>">

	<?php if($this->params->get('show_page_title') && $this->params->get('page_title')!=$this->user->name): ?>
	<!-- Page title -->
	<div class="componentheading<?php echo $this->params->get('pageclass_sfx')?>">
		<?php echo $this->escape($this->params->get('page_title')); ?>
	</div>
	<?php endif; ?>

	<?php if($this->params->get('userFeed')): ?>
	<!-- RSS feed icon -->
	<div class="k2FeedIcon">
		<a href="<?php echo $this->feed; ?>" title="<?php echo JText::_('Subscribe to this RSS feed'); ?>">
			<span><?php echo JText::_('Subscribe to this RSS feed'); ?></span>
		</a>
	</div>
	<?php endif; ?>

	<?php if ($this->params->get('userImage') || $this->params->get('userName') || ($this->params->get('userDescription') && isset($this->user->profile->description)) || $this->params->get('userURL') || $this->params->get('userEmail')): ?>
	<div class="userBlock">
	
		<?php if(isset($this->addLink) && JRequest::getInt('id')==$user->id): ?>
		<!-- Item add link -->
		<span class="userItemAddLink">
			<a class="modal" rel="{handler:'iframe',size:{x:990,y:650}}" href="<?php echo $this->addLink; ?>">
				<?php echo JText::_('Post a new item'); ?>
			</a>
		</span>
		<?php endif; ?>
	
		<?php if ($this->params->get('userImage') && !empty($this->user->avatar)): ?>
		<img src="<?php echo $this->user->avatar; ?>" alt="<?php echo $this->user->name; ?>" style="width:<?php echo $this->params->get('userImageWidth'); ?>px; height:auto;" />
		<?php endif; ?>
		
		<?php if ($this->params->get('userName')): ?>
		<h2><?php echo $this->user->name; ?></h2>
		<?php endif; ?>
		
		<?php if ($this->params->get('userDescription') && isset($this->user->profile->description)): ?>
		<p class="userDescription"><?php echo $this->user->profile->description; ?></p>
		<?php endif; ?>
		
		<?php if ($this->params->get('userURL') || $this->params->get('userEmail')): ?>
		<p class="userAdditionalInfo">
			<?php if ($this->params->get('userURL') && isset($this->user->profile->url)): ?>
			<span class="userURL">
				<?php echo JText::_("Website URL"); ?>: <a href="<?php echo $this->user->profile->url; ?>" target="_blank"><?php echo $this->user->profile->url; ?></a>
			</span>
			<?php endif; ?>

			<?php if ($this->params->get('userEmail')): ?>
			<span class="userEmail">
				<?php echo JText::_("E-mail"); ?>: <?php echo JHTML::_('Email.cloak', $this->user->email); ?>
			</span>
			<?php endif; ?>	
		</p>
		<?php endif; ?>
		
		<?php echo $this->user->event->K2UserDisplay; ?>
	</div>
	<?php endif; ?>



	<?php if(count($this->items)): ?>
	<!-- Item list -->
	<div class="userItemList">
		<?php foreach ($this->items as $item): ?>
		
		<!-- Start K2 Item Layout -->
		<div class="article_row clearfix<?php if(!$item->published) echo ' userItemViewUnpublished'; ?>">
		
			<!-- Plugins: BeforeDisplay -->
			<?php echo $item->event->BeforeDisplay; ?>
			
			<!-- K2 Plugins: K2BeforeDisplay -->
			<?php echo $item->event->K2BeforeDisplay; ?>
		
			<?php if(isset($item->editLink)): ?>
			<!-- Item edit link -->
			<span class="userItemEditLink">
				<a class="modal" rel="{handler:'iframe',size:{x:990,y:650}}" href="<?php echo $item->editLink; ?>">
					<?php echo JText::_('Edit item'); ?>
				</a>
			</span>
			<?php endif; ?>
		
			<div class="ItemHeader clearfix">
			
			  <?php if($item->params->get('userItemTitle')): ?>
			  <!-- Item title -->
			  <h2 class="contentheading clearfix">
			  	<?php if ($item->params->get('userItemTitleLinked') && $item->published): ?>
					<a href="<?php echo $item->link; ?>">
			  		<?php echo $item->title; ?>
			  	</a>
			  	<?php else: ?>
			  	<?php echo $item->title; ?>
			  	<?php endif; ?>
			  	<?php if(!$item->published):?>
			  	<span>
		  			<sup>
		  				<?php echo JText::_('Unpublished'); ?>
		  			</sup>
	  			</span>
	  			<?php endif;?>
			  </h2>
			  <?php endif; ?>			  
			  
				<?php if (
						$item->params->get('userItemDateCreated') ||
						$item->params->get('userItemCommentsAnchor') && ( ($item->params->get('comments') == '2' && !$this->user->guest) || ($item->params->get('comments') == '1'))
				) : ?>
				<div class="article-tools clearfix">
				<div class="article-meta">
					<?php if ($item->params->get('userItemDateCreated')) : ?>
					<!-- Date created -->
					<span class="createdate">
						<?php echo JHTML::_('date', $item->created , JText::_('DATE_FORMAT_LC3')); ?>
					</span>
					<?php endif; ?>

					<?php if($item->params->get('userItemCommentsAnchor') && ( ($item->params->get('comments') == '2' && !$this->user->guest) || ($item->params->get('comments') == '1')) ): ?>
					<!-- Anchor link to comments below -->
					<span class="commentslink">
						
						<!-- K2 Plugins: K2CommentsCounter -->
						<?php echo $item->event->K2CommentsCounter; ?>
						<?php if(empty($item->event->K2CommentsCounter)):?>		
							<?php if($item->numOfComments > 0): ?>
							<a href="<?php echo $item->link; ?>#itemCommentsAnchor">
								<?php echo $item->numOfComments; ?> <?php echo ($item->numOfComments>1) ? JText::_('comments') : JText::_('comment'); ?>
							</a>
							<?php else: ?>
							<a href="<?php echo $item->link; ?>#itemCommentsAnchor">
								<?php echo JText::_('0 Comment!'); ?>
							</a>
							<?php endif; ?>
						<?php endif; ?>
					</span>
					<?php endif; ?>
			
				</div>
				</div>
				<?php endif; ?>
		  </div>
		
		  <!-- Plugins: AfterDisplayTitle -->
		  <?php echo $item->event->AfterDisplayTitle; ?>
		  
		  <!-- K2 Plugins: K2AfterDisplayTitle -->
		  <?php echo $item->event->K2AfterDisplayTitle; ?>

		  <div class="ItemBody">
		
			  <!-- Plugins: BeforeDisplayContent -->
			  <?php echo $item->event->BeforeDisplayContent; ?>
			  
			  <!-- K2 Plugins: K2BeforeDisplayContent -->
			  <?php echo $item->event->K2BeforeDisplayContent; ?>
		
			  <?php if($item->params->get('userItemImage') && !empty($item->imageGeneric)): ?>
			  <!-- Item Image -->
			  <div class="ItemImageBlock">
				  <span class="ItemImage">
				    <a href="<?php echo $item->link; ?>" title="<?php if(!empty($item->image_caption)) echo $item->image_caption; else echo $item->title; ?>">
				    	<img src="<?php echo $item->imageGeneric; ?>" alt="<?php if(!empty($item->image_caption)) echo $item->image_caption; else echo $item->title; ?>" style="width:<?php echo $item->params->get('itemImageGeneric'); ?>px; height:auto;" />
				    </a>
				  </span>
			  </div>
			  <?php endif; ?>
			  
			  <?php if($item->params->get('userItemIntroText')): ?>
			  <!-- Item introtext -->
			  <div class="ItemIntroText">
			  	<?php echo $item->introtext; ?>
			  </div>
			  <?php endif; ?>

			  <!-- Plugins: AfterDisplayContent -->
			  <?php echo $item->event->AfterDisplayContent; ?>
			  
			  <!-- K2 Plugins: K2AfterDisplayContent -->
			  <?php echo $item->event->K2AfterDisplayContent; ?>
		  </div>
		
		  <?php if($item->params->get('userItemCategory') || $item->params->get('userItemTags')): ?>
		  <div class="ItemLinks">

				<?php if($item->params->get('userItemCategory')): ?>
				<!-- Item category name -->
				<div class="ItemCategory clearfix">
					<span><?php echo JText::_('Published in'); ?></span>
					<a href="<?php echo $item->category->link; ?>"><?php echo $item->category->name; ?></a>
				</div>
				<?php endif; ?>
				
			  <?php if($item->params->get('userItemTags') && count($item->tags)): ?>
			  <!-- Item tags -->
			  <div class="ItemTagsBlock clearfix">
				  <span><?php echo JText::_("Tagged under"); ?></span>
				  <ul class="ItemTags">
				    <?php foreach ($item->tags as $tag): ?>
				    <li><a href="<?php echo $tag->link; ?>"><?php echo $tag->name; ?></a></li>
				    <?php endforeach; ?>
				  </ul>
			  </div>
			  <?php endif; ?>
		  </div>
		  <?php endif; ?>
		  
			<?php if ($item->params->get('userItemReadMore')): ?>
			<!-- Item "read more..." link -->
			<div class="ItemReadMore">
				<a class="readon" href="<?php echo $item->link; ?>">
					<span><?php echo JText::_('Read more...'); ?></span>
				</a>
			</div>
			<?php endif; ?>

		  <!-- Plugins: AfterDisplay -->
		  <?php echo $item->event->AfterDisplay; ?>
		  
		  <!-- K2 Plugins: K2AfterDisplay -->
		  <?php echo $item->event->K2AfterDisplay; ?>
		  		  
			<div class="row_separator">&nbsp;</div>
		</div>
		<!-- End K2 Item Layout -->
		
		<?php endforeach; ?>
	</div>

	<!-- Pagination -->
	<?php if($this->pagination->getPagesLinks()): ?>	
		<p class="counter"><span><?php echo $this->pagination->getPagesCounter(); ?></span></p>
		<div class="pagination">
			<?php echo $this->pagination->getPagesLinks(); ?>
		</div>
	<?php endif; ?>
	
	<?php endif; ?>

</div>

<!-- End K2 User Layout -->
