<?php /* Template Name: Homepage - Youtube */ ?>
<?php get_header(); ?>
<?php get_sidebar(); ?>
<?php
	global $post;
	$box_name = 'youtube';
	$homepage_data = get_post_meta( $post->ID, 'dt_'. $box_name. '_options', true );
	if ( $homepage_data ) {
		$loop = $homepage_data['dt_youtube_loop'];
		$auto = $homepage_data['dt_youtube_autoplay'];
		$video = $homepage_data['dt_youtube_id'];
	}
?>
<div class="pg_content video">
	<object id="vm_video_object" height="350" width="425">
		<param name="movie" value="http://www.youtube.com/v/<?=$video?>&autoplay=<?=$auto?>&loop=<?=$loop?>&controls=0&playlist=<?=$video?>" />
		<param wmode="transparent" />
		<embed id="vm_video" height="350" src="http://www.youtube.com/v/<?=$video?>&autoplay=<?=$auto?>&loop=<?=$loop?>&controls=0&playlist=<?=$video?>" type="application/x-shockwave-flash" width="425" wmode="transparent"></embed>
	</object>
</div>

<script type="text/javascript">
	$(document).ready( function(){
		var w = $(window).width();
		var h = $(window).height();
		
		$('#vm_video_object').width(w);
		$('#vm_video_object').height(h);
		
		$('#vm_video').width(w);
		$('#vm_video').height(h);
		
	});
</script>

<?php if(!$hide_masc): ?>
	<div id="big-mask"></div>
<?php endif; ?>

<?php get_footer(); ?>