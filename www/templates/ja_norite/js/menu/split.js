/*
# ------------------------------------------------------------------------
# JA Norite template for Joomla 1.5.x
# ------------------------------------------------------------------------
# Copyright (C) 2004-2010 JoomlArt.com. All Rights Reserved.
# @license - PHP files are GNU/GPL V2. CSS / JS are Copyrighted Commercial,
# bound by Proprietary License of JoomlArt. For details on licensing, 
# Please Read Terms of Use at http://www.joomlart.com/terms_of_use.html.
# Author: JoomlArt.com
# Websites:  http://www.joomlart.com -  http://www.joomlancers.com
# Redistribution, Modification or Re-licensing of this file in part of full, 
# is bound by the License applied. 
# ------------------------------------------------------------------------
*/
 

window.addEvent ('domready', function() {
	if (!$('ja-subnav') || !$('ja-subnav').getElement('ul')) return;
	var sfEls = $('ja-subnav').getElement('ul').getChildren();
	sfEls.each (function(li){
		li.addEvent('mouseenter', function(e) {
			clearTimeout(this.timer);
			if(this.className.indexOf(" hover") == -1)
				this.className+=" hover";
		});
		li.addEvent('mouseleave', function(e) {
			//this.className=this.className.replace(new RegExp(" hover\\b"), "");
			this.timer = setTimeout(jasdl_sub_mouseOut.bind(this), 100);
		});
	});
});

function jasdl_sub_mouseOut () {
	this.className=this.className.replace(new RegExp(" hover\\b"), "");
}
