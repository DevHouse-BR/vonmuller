<div id="ja-header" class="wrap">
<div class="main">
<div class="inner clearfix">

	<?php
	$siteName = $this->sitename();
	?>
	<div style="text-align:center"><img style="" alt="<?php echo $siteName;?>" src="images/logo.png" /></div>
	<!-- MAIN NAVIGATION -->
	<?php $this->loadBlock('mainnav') ?>
	<!-- //MAIN NAVIGATION -->
	
	<?php $this->loadBlock('usertools/screen') ?>
	<?php $this->loadBlock('usertools/font') ?>

</div>

<?php if ($this->hasSubmenu() && ($jamenu = $this->loadMenu())) : ?>
<div id="ja-subnav" class="clearfix">
<div class="inner">
	<?php $jamenu->genMenu (1); ?>
</div>
</div>
<?php endif;?>

</div>
</div>
