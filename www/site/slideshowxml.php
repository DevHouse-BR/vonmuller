<?
$galeria = $_GET["galeria"];
switch($galeria){
	case "casamentos":
		$titulo = "Casamentos";
		break;
	case "15_anos":
		$titulo = "15 Anos";
		break;
	case "making_of":
		$titulo = "Making Of";
		break;
}
echo('<?xml version="1.0" encoding="utf-8"?>' . chr(10));
?>
<slideshow>	
	<preferences kenBurnsMode="none" controlAlpha="50" controlAutoHide="false" controlDelay="3" controlLineWidth="2" controlRoundedCorners="10"/>
	<album randomizeImages="true" thumbnail="portifolio/album.jpg" title="<?=$titulo?>" description="VonMuller.com" imagePath="portifolio/<?=$galeria?>" thumbnailPath="portifolio/<?=$galeria?>">
<?	
$d = dir("portifolio/" . $galeria);
while (false !== ($arquivo = $d->read())) {
	if(($arquivo != ".") && ($arquivo != "..") && ($arquivo != "album.jpg"))
    echo(chr(9) . chr(9) . '<img src="' . $arquivo.'"/>' . chr(10));
}
$d->close();
?>	</album>	
</slideshow>