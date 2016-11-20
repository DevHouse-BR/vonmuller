<?
$cd_evento = $_GET["cd"];





$path = $_SERVER['DOCUMENT_ROOT'] . "/musicas/";
$dir=opendir($path);

$i=0;
while($imgfile=readdir($dir))
{
	 if ($imgfile != "." && $imgfile!=".." && $imgfile!="thumb.db" && $imgfile!=".svn")
		 {
		$imgarray[$i]=$imgfile;
		$i++;
		}
}
closedir($dir);
$num = intval(file_get_contents("musica.txt"));
$num++;
if($num > (count($imgarray)-1)) $num = 0;
file_put_contents("musica.txt", strval($num));
$musica = $imgarray[$num];









require("conectar_mysql.php");
$query = "SELECT cd, path, path_thumb, largura, altura FROM fotos WHERE cd_evento=" . $cd_evento . " ORDER BY cd";
$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-type: application/json');
echo('<?xml version="1.0" encoding="utf-8"?>

<!--
	Monoslideshow configuration file
	Please visit http://www.monoslideshow.com for more info
-->

<slideshow>
	
	<preferences kenBurnsMode = "random" />' . chr(10) . chr(13));
echo('	<album backgroundMusic="http://www.vonmuller.com/musicas/' . $musica . '" thumbnail="imagens/arquivo.gif" title="Evento Vonmuller" description="Evento Vonmuller" imagePath="fotos" thumbnailPath="fotos">
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