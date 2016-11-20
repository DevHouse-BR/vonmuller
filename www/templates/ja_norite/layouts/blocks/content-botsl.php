<?php
$spotlight = array ('user11','user12','user13');
$botsl = $this->calSpotlight ($spotlight,99.9);
if( $botsl ) :
?>
<!-- CONTENT BOTTOM SPOTLIGHT 1 -->
<div id="ja-content-botsl1" class="clearfix">

	<?php if( $this->countModules('user11') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user11']['class']; ?>" style="width: <?php echo $botsl['user11']['width']; ?>;">
		<jdoc:include type="modules" name="user11" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user12') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user12']['class']; ?>" style="width: <?php echo $botsl['user12']['width']; ?>;">
		<jdoc:include type="modules" name="user12" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user13') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user13']['class']; ?>" style="width: <?php echo $botsl['user13']['width']; ?>;">
		<jdoc:include type="modules" name="user13" style="JAxhtml" />
	</div>
	<?php endif; ?>

</div>
<!-- //CONTENT BOTTOM SPOTLIGHT 1 -->
<?php endif; ?>

<?php
$spotlight = array ('user14','user15','user16');
$botsl = $this->calSpotlight ($spotlight,99.9);
if( $botsl ) :
?>
<!-- CONTENT BOTTOM SPOTLIGHT 2 -->
<div id="ja-content-botsl2" class="clearfix">

	<?php if( $this->countModules('user14') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user14']['class']; ?>" style="width: <?php echo $botsl['user14']['width']; ?>;">
		<jdoc:include type="modules" name="user14" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user15') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user15']['class']; ?>" style="width: <?php echo $botsl['user15']['width']; ?>;">
		<jdoc:include type="modules" name="user15" style="JAxhtml" />
	</div>
	<?php endif; ?>

	<?php if( $this->countModules('user16') ): ?>
	<div class="ja-box column ja-box<?php echo $botsl['user16']['class']; ?>" style="width: <?php echo $botsl['user16']['width']; ?>;">
		<jdoc:include type="modules" name="user16" style="JAxhtml" />
	</div>
	<?php endif; ?>

</div>
<!-- //CONTENT BOTTOM SPOTLIGHT 2 -->
<?php endif; ?>