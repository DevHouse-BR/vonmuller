<?
require("funcoes.php");
inicia_pagina();
?>
<style type="text/css">
<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
}
-->
</style>

<div id="slide"></div>
<script type="text/javascript" src="swfobject.js"></script>
<script type="text/javascript">
	var so = new SWFObject("imagens/portifolio.swf", "SOmonoSlideshow", "448", "298", "7", "#000000");
	so.write("slide");
</script>
<?
require("conectar_mysql.php");
$query = "SELECT conteudo FROM textos WHERE nome='home'";
$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
$text = mysql_fetch_row($result);
require("desconectar_mysql.php");
echo($text[0]); 
?>
<br />
<span class="style1">Agora com mais  formas de pagamento: </span><br />
<img src="img/cards2.jpg" width="213" height="40" />
<hr>
<div class="titulosecao">&nbsp;&nbsp;<img align="absmiddle" src="imagens/bullet_silver.gif">&nbsp;<a class="menuesquerdo" href="<?=$agenda?>">Agenda</a></div><br>
<? constroi_destaque_agenda(12, 4); ?>
<br>
<hr>
<div class="titulosecao">&nbsp;&nbsp;<img align="absmiddle" src="imagens/bullet_silver.gif">&nbsp;<a class="menuesquerdo" href="<?=$eventos?>">Eventos</a></div><br>
<? constroi_destaque_eventos(12, 4); ?>
<br>

<? termina_pagina(); ?>