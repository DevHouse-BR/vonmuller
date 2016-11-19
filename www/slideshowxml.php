<?
$cd_evento = $_GET["cd"];

require("conectar_mysql.php");
$query = "SELECT cd, path, path_thumb, largura, altura FROM fotos WHERE cd_evento=" . $cd_evento . " ORDER BY cd";
$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
echo('<?xml version="1.0" encoding="utf-8"?>

<!--
	Monoslideshow configuration file
	Please visit http://www.monoslideshow.com for more info
-->

<slideshow>
	
	<preferences kenBurnsMode = "random" />' . chr(10) . chr(13));
echo('	<album backgroundMusic="http://www.vonmuller.com/aerosmith.mp3" thumbnail="imagens/arquivo.gif" title="Evento Vonmuller" description="Evento Vonmuller" imagePath="fotos" thumbnailPath="fotos">
');
while($foto = mysql_fetch_array($result, MYSQL_ASSOC)){
	if($foto["largura"]>$foto["altura"]){
	?>
	<img src="<?=str_replace("fotos/", "", $foto['path'])?>"/>
	<? }
}
require("desconectar_mysql.php");
echo('</album>
	
</slideshow>');
?>