<div class="ja-navhelper main clearfix">
	<div class="inner clearfix">
		<div class="ja-breadcrums">
			<strong><?php echo JText::_('You are here:')?></strong> <jdoc:include type="module" name="breadcrumbs" />
		</div>
		
		<ul class="ja-links">
			<li class="layout-switcher"><?php $this->loadBlock('usertools/layout-switcher') ?>&nbsp;</li>
			<li class="top"><a href="<?php echo $this->getCurrentURL();?>#Top" title="Back to Top" onclick="javascript:scroll(0,0)">Top</a></li>
		</ul>
	</div>
</div>

<div id="ja-footer" class="main clearfix">
	<div class="inner clearfix">
		<div class="ja-copyright">
			<jdoc:include type="modules" name="footer" />
		</div>
	</div>
</div>
</div>

