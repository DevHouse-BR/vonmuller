<div id="ja-mainnav" class="clearfix">
<div class="inner">
	<?php if (($jamenu = $this->loadMenu())) $jamenu->genMenu ($this->getParam('startlevel',0), $this->getParam('endlevel',-1)); ?>	
</div>
</div>

<ul class="no-display">
    <li><a href="<?php echo $this->getCurrentURL();?>#ja-content" title="<?php echo JText::_("Skip to content");?>"><?php echo JText::_("Skip to content");?></a></li>
</ul>
