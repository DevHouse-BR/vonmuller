<?php
include("funcoes.php");
inicia_pagina();
$secao = $_GET["secao"];
$subsecao = $_GET["subsecao"];
if(strlen($secao) == 0) $secao = 1;
if(strlen($subsecao) == 0) $subsecao = 0;
require("conectar_mysql.php");
if($subsecao == 0) $query = "SELECT * FROM secoes WHERE nomedesecao=" . $secao . " ORDER BY titulo";
else $query = "SELECT * FROM secoes WHERE cd=" . $subsecao;
$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
?>
<table width="100%" class="conteudo"> <?
while($texto = mysql_fetch_array($result, MYSQL_ASSOC)){
	?>
	<tr>
		<td><a name="<?=$texto["cd"]?>">&nbsp;</a></td>
	</tr>
	<tr>
		<td><?=$texto["texto"]?></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<?
}
?> </table> <?
require("desconectar_mysql.php");
termina_pagina();
?>