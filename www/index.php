<?
require("funcoes.php");
inicia_pagina();


require("conectar_mysql.php");
$query = "SELECT conteudo FROM textos WHERE nome='home'";
$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
$text = mysql_fetch_row($result);
require("desconectar_mysql.php");
echo($text[0]); 
?>
<h3>Bem Vindo!</h3>
<p>A VonMuller fotografia preparou esse espaço para publicar as fotos de momentos inesquecíveis.</p>
<p>Aproveite!</p><br><br>
<hr>
<div class="titulosecao">&nbsp;&nbsp;<img align="absmiddle" src="imagens/bullet_silver.gif">&nbsp;<a class="menuesquerdo" href="<?=$agenda?>">Agenda</a></div><br>
<? constroi_destaque_agenda(3, 3); ?>
<br>
<hr>
<div class="titulosecao">&nbsp;&nbsp;<img align="absmiddle" src="imagens/bullet_silver.gif">&nbsp;<a class="menuesquerdo" href="<?=$eventos?>">Eventos</a></div><br>
<? constroi_destaque_eventos(3, 3); ?>
<br>

<? termina_pagina(); ?>