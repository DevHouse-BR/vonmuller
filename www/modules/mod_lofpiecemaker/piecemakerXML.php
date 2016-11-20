<?php header("Content-type: text/xml");?>
<?php echo '<?xml version="1.0" encoding="utf-8"?>'; echo "\r\n"?>
<Piecemaker>
<Settings>
    <imageWidth>820</imageWidth>
    <imageHeight>280</imageHeight>
    <segments>7</segments>
    <tweenTime>1.2</tweenTime>
    <tweenDelay>0.1</tweenDelay>
    <tweenType>easeInOutExpo</tweenType>
    <zDistance>0</zDistance>
    <expand>20</expand>
    <innerColor>0x111111</innerColor>
    <textBackground>0x031933</textBackground>
    <shadowDarkness>100</shadowDarkness>
    <textDistance>25</textDistance>
    <autoplay>3</autoplay>
</Settings>
<?php
	$path = "../../images/slides/";
	$dir=opendir($path);
	
	$i=0;
	while($imgfile=readdir($dir)){
		if ($imgfile != "." && $imgfile!=".." && $imgfile!="thumb.db" && $imgfile!=".svn"){
			 echo '<Image Filename="images/slides/' . $imgfile . '"></Image>' . "\n";
		}
	}
	closedir($dir);
?>
</Piecemaker>