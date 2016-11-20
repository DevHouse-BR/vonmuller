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


var JA_Collapse_Mod = new Class({

	initialize: function(myElements) {
		options = Object.extend({
			transition: Fx.Transitions.quadOut
		}, {});
		this.myElements = myElements;
		var exModules = excludeModules.split(',');
		exModules.each(function(el,i){exModules[i]='Mod'+el});
		myElements.each(function(el, i){
			el.elmain = $E('.jamod-content',el);
			el.titleEl = $E('h3',el);
			if(!el.titleEl) return;

			if (exModules.contains(el.id)) {
				el.titleEl.className = '';
				return;
			}

			el.titleEl.className = rightCollapseDefault;
			el.status = rightCollapseDefault;
			el.openH = el.elmain.getStyle('height').toInt();
			el.elmain.setStyle ('overflow','hidden');

			el.titleEl.addEvent('click', function(e){
				e = new Event(e).stop();
				el.toggle();
			});

			el.toggle = function(){
				if (el.status=='hide') el.show();
				else el.hide();
			}

			el.show = function() {
				el.titleEl.className='show';
				var ch = el.elmain.getStyle('height').toInt();
				new Fx.Style(el.elmain,'height',{onComplete:el.toggleStatus}).start(ch,el.openH);
			}
			el.hide = function() {
				el.titleEl.className='hide';
				var ch = (rightCollapseDefault=='hide')?0:el.elmain.getStyle('height').toInt();
				new Fx.Style(el.elmain,'height',{onComplete:el.toggleStatus}).start(ch,0);
			}
			el.toggleStatus = function () {
				el.status=(el.status=='hide')?'show':'hide';
				Cookie.set(el.id,el.status,{duration:365});
			}

			if(!el.titleEl.className) el.titleEl.className=rightCollapseDefault;
			if(el.titleEl.className=='hide') el.hide();
		});
	}
});

window.addEvent ('load', function(e){
	var jamod = new JA_Collapse_Mod ($$('.ja-module'));
});
