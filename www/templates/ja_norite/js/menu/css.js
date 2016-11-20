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
	var sfEls = $$('#ja-cssmenu li');
	sfEls.each (function(li) {
		if ((a = li.getElement('a')) && li.hasChild (a)) li.a = a;
		else li.a = null;
	});	
	sfEls.each (function(li){
		li.addEvent('mouseenter', function(e) {
			clearTimeout(this.timer);
			if(this.hasClass("havechild")) this.addClass('havechildsfhover').removeClass('havechild');
			else if(this.hasClass("havesubchild")) this.addClass('havesubchildsfhover').removeClass('havesubchild');
			this.addClass ('sfhover');
			if (this.a) this.a.addClass ('sfhover');
		});
		li.addEvent('mouseleave', function(e) {
			this.timer = setTimeout(sfHoverOut.bind(this, e), 100);
		});
	});
});

function sfHoverOut() {
	clearTimeout(this.timer);
	if(this.hasClass("havechildsfhover")) this.addClass('havechild').removeClass('havechildsfhover');
	else if(this.hasClass("havesubchildsfhover")) this.addClass('havesubchild').removeClass('havesubchildsfhover');
	this.removeClass ('sfhover');
	if (this.a) this.a.removeClass ('sfhover');
}
