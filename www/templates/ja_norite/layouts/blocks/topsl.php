<?php if( $this->countModules('top') ): ?>
<div id="ja-top" class="wrap">
<div class="main">
  <div class="inner clearfix">
  	<jdoc:include type="modules" name="top" style="JAxhtml" />
  </div>
</div></div>
<?php endif; ?>

<?php if ($this->countModules('breadcrumbs')) : ?>
<div class="ja-navhelper wrap">
<div class="main clearfix">
<div class="inner clearfix">

	<div class="ja-breadcrums">
		<strong><?php echo JText::_('Você está aqui:')?></strong> <jdoc:include type="module" name="breadcrumbs" />
	</div>
	
</div>
</div>
</div>
<?php endif; ?>

<?php
$spotlight = array ('user1','user2','user3','user4','user5');
$botsl = $this->calSpotlight ($spotlight,99.9);
if( $botsl ) :
?>
<!-- TOP SPOTLIGHT -->
<div id="ja-topsl" class="wrap">
<div class="main clearfix">

	<?php if( $this->countModules('user1') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user1']['class']; ?>" style="width: <?php echo $botsl['user1']['width']; ?>;">
		<jdoc:include type="modules" name="user1" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user2') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user2']['class']; ?>" style="width: <?php echo $botsl['user2']['width']; ?>;">
		<jdoc:include type="modules" name="user2" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user3') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user3']['class']; ?>" style="width: <?php echo $botsl['user3']['width']; ?>;">
		<jdoc:include type="modules" name="user3" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user4') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user4']['class']; ?>" style="width: <?php echo $botsl['user4']['width']; ?>;">
		<jdoc:include type="modules" name="user4" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user5') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user5']['class']; ?>" style="width: <?php echo $botsl['user5']['width']; ?>;">
		<jdoc:include type="modules" name="user5" style="JAxhtml" />
	</div>
	<?php endif; ?>

</div>
</div>
<!-- //TOP SPOTLIGHT -->
<?php endif; ?>