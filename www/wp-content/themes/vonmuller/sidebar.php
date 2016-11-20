<?php
/**
 * @package WordPress
 * @subpackage Chocolate
 */
 
 global $options;
?>

  <div id="aside">
    <div id="aside_t"></div>
    <div id="aside_c">

      <div id="logo">
        <a href="<?php echo home_url( '/' ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>">
          <?php if (isset($options['logo']) && $options['logo']): ?>
             <img src="<?php
				$up_dir = wp_upload_dir();
				$dir = $up_dir['baseurl'].'/dt_uploads/';
				//$file = get_template_directory_uri()).'/cache/'.$options['logo'];
				$url = str_replace(site_url(), '', $dir.$options['logo']);
				echo esc_attr(get_template_directory_uri().'/thumb.php?src='.$url.'&w=220&zc=0&q=100&nores=1');
             ?>" alt="<?php wp_title(); ?>" />
          <?php else: ?>
             <img src="<?php echo get_template_directory_uri(); ?>/images/logo.png" alt="<?php wp_title(); ?>" width="181" />
          <?php endif; ?>
        </a>
      </div>
      
      <?php get_template_part( 'nav' ); ?>
      
      <?php
      if (!defined('GAL_HOME') && !is_page_template('home-video.php') && !is_page_template('home-slider.php') && !is_page_template('home-static.php') && !is_page_template('home-youtube.php'))
			get_template_part( 'widget_areas/primary-widget-area' );
      ?>
	<!--div class="widget">
		<div class="textwidget">
			<a href="/owm/client.php?locale=pt" target="_blank" onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('/owm/client.php?locale=pt&amp;url='+escape(document.location.href)+'&amp;referrer='+escape(document.referrer), 'webim', 'toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;"><img src="/owm/b.php?i=mblue&amp;lang=pt" border="0" width="177" height="61" alt=""/></a>
		</div>
	</div-->
    </div>
    <!--div id="aside_b">
    	
    </div-->
  </div>
