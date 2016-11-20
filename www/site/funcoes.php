<?
//error_reporting(0);
function inicia_pagina(){
	?>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>VonMuller</title>
		<link href="estilo.css" type="text/css" rel="stylesheet" rev="stylesheet" />
	</head>
	<body>
	<?
}

###############################################################################################################

function termina_pagina(){
	?>
	</body>
</html>
	<?
}

###############################################################################################################

function altera_valor($chave, $valor){
	require("conectar_mysql.php");
	$query = "UPDATE config SET valor='" . $valor . "' WHERE chave='" . $chave . "'";
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	require("desconectar_mysql.php");
}
function retorna_config($chave){
	require("conectar_mysql.php");
	$query = "SELECT valor FROM config WHERE chave='" . $chave . "'";
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	$valor = mysql_fetch_assoc($result);
	return $valor["valor"];
	require("desconectar_mysql.php");
}
#################################################################################################################

function constroi_tabela_eventos_admin($numerodedestaques, $colunas, $pagina){
	$contador_de_colunas = 0;
	
	$limite = ($numerodedestaques * ($pagina -1));
	$query_limit = " LIMIT " . $limite . "," . $numerodedestaques;
	
	if($_GET["busca"] == "data") {
		$data = $_GET["data"];
		$filtro = "AND eventos.data=" . $data;
	}
	?><a href="javascript: void window.open('wizard_novo_evento.php', 'EVENTO', 'width=450,height=500,status=no,resizable=yes,top=20,left=100,dependent=no,alwaysRaised=yes');">[Novo Evento]</a><hr><?

	$query = "SELECT eventos.cd, eventos.nomes, eventos.data, eventos.imagem_destaque, eventos.status, tipodeevento.tipo FROM eventos, tipodeevento WHERE eventos.tipo=tipodeevento.cd " . $filtro . " ORDER BY data DESC" . $query_limit;
	require("../conectar_mysql.php");
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	if(mysql_num_rows($result) == 0){ 
		?>
		<table width="100%" cellspacing="5">
			<tr>
				<td align="center" valign="middle">Não há nenhum evento cadastrado.</td>
			</tr>
		</table>
		<?
	}
	else{
		?><table width="100%" cellspacing="5"><tr><?
		if($_GET["busca"] == "data") {
			$data = $_GET["data"];
			$filtro = "WHERE data=" . $data;
		}
		$query = "SELECT COUNT(*) FROM eventos " . $filtro;
		$tmp = mysql_fetch_row(mysql_query($query));
		$eof = $tmp[0];
		
		while($evento = mysql_fetch_array($result, MYSQL_ASSOC)){
			$query = "SELECT path_thumb FROM fotos WHERE cd=" . $evento["imagem_destaque"];
			$result2 = mysql_query($query);
			$imagem = mysql_fetch_row($result2);
			$desativado = "Desativado: ";
			if (($evento["status"] == 1) && ($evento["data"] < mktime())){
				$style = ' style="color: #FF0000;"';
				$desativado = "Agenda com Data Antiga: ";
			} 
			elseif (($evento["status"] == 0) && ($evento["data"] > mktime())) {
				$style = ' style="color: #FF0000;"';
				$desativado = "Evento com Data Adiantada: ";
			}
			elseif ($evento["status"] == 2) {
				$style = ' style="color: #FF0000;"';
				$desativado = "Desativado: ";
			}
			elseif ($evento["status"] == 3){
				$style = ' style="color: #FF0000;"';
				$desativado = "Em Aprovação: ";
			}
			else {
				$desativado = "";
				$style = "";
			}
			?>
			<td width="33%" align="center" valign="top">
				<table width="100%" height="200" border="0">
					<tr>
						<td align="center" valign="top" height="50%"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" src="../<?=$imagem[0]?>"></a></td>
					</tr>
					<tr>
						<td class="celula" valign="top"<?=$style?>><center><?=$desativado?><?=$evento["tipo"]?>&nbsp;de&nbsp;<b><?=$evento["nomes"]?></b><br><?=date("d/m/Y", $evento["data"])?></center></td>
					</tr>
				</table>
			</td>
			<?
			$contador_de_colunas++;
			if($contador_de_colunas >= $colunas){
				echo("</tr><tr>");
				$contador_de_colunas = 0;
			}
		}
		?></tr>
		<tr>
			<td align="left">
				<? 
				if($_GET["busca"] == "data") $busca = "&busca=data&data=" . $data;
				else $busca="";

				if($pagina != 1) echo('<a href="eventos.php?pagina=' . ($pagina-1) . $busca . '"><img border="0" src="../imagens/voltar.gif"></a>'); ?>
			</td>
			<td></td>
			<td align="right">
				<? if($limite + $numerodedestaques < $eof) echo('<a href="eventos.php?pagina=' . ($pagina+1) . $busca . '"><img border="0" src="../imagens/avancar.gif"></a>'); ?>
			</td>
		</tr>
		</table><?
	}
	require("../desconectar_mysql.php");
}

#################################################################################################################

function constroi_destaque_eventos($numerodedestaques, $colunas){
	$contador_de_colunas = 0;

	$query = "SELECT * FROM eventos WHERE (DATA < " . mktime() . ") AND (status = 0) ORDER BY data DESC LIMIT " . $numerodedestaques;
	require("conectar_mysql.php");
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	if(mysql_num_rows($result) == 0){
		?>
		<table width="100%" cellspacing="5">
			<tr>
				<td align="center" valign="middle">Não há nenhum evento cadastrado.</td>
			</tr>
		</table>
		<?
	}
	else{
		?><table width="100%" cellspacing="5" border="0"><tr><?
		while($evento = mysql_fetch_array($result, MYSQL_ASSOC)){
			$query = "SELECT path_thumb FROM fotos WHERE cd=" . $evento["imagem_destaque"];
			$result2 = mysql_query($query);
			$imagem = mysql_fetch_row($result2);
			?>
			<td align="center" valign="top">
				<table width="100%" border="0" height="120" style="border: solid 1px #808080;" bgcolor="#DDDDDD">
					<tr>
						<td height="93" align="center" valign="top"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" src="<?=$imagem[0]?>"></a></td>
					</tr>
					<tr>
						<td class="celula" valign="top">
							<?=date("d/m/Y",$evento["data"])?>
						</td>
					</tr>
					<!--<tr>
						<td align="center" valign="bottom"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" align="bottom" src="imagens/avancar.gif"></a></td>
					</tr>-->
				</table>
			</td>
			<?
			$contador_de_colunas++;
			if($contador_de_colunas >= $colunas){
				echo("</tr><tr>");
				$contador_de_colunas = 0;
			}
		}
		?></tr></table><?
	}
	require("desconectar_mysql.php");
}

#################################################################################################################

function constroi_destaque_agenda($numerodedestaques, $colunas){
	$contador_de_colunas = 0;

	$query = "SELECT * FROM eventos WHERE (data > " . mktime() . ") AND (status = 1) ORDER BY data ASC LIMIT " . $numerodedestaques;
	require("conectar_mysql.php");
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	if(mysql_num_rows($result) == 0){
		?>
		<table width="100%" cellspacing="5">
			<tr>
				<td align="center" valign="middle">Não há nenhum evento cadastrado.</td>
			</tr>
		</table>
		<?
	}
	else{
		?><table width="100%" cellspacing="5" border="0"><tr><?
		while($evento = mysql_fetch_array($result, MYSQL_ASSOC)){
			$query = "SELECT path_thumb FROM fotos WHERE cd=" . $evento["imagem_destaque"];
			$result2 = mysql_query($query);
			$imagem = mysql_fetch_row($result2);
			?>
			<td align="center" valign="top" <?=$style?>>
				<table width="100%" border="0" height="120" style="border: solid 1px #808080;" bgcolor="#DDDDDD">
					<tr>
						<td height="93" align="center" valign="top"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" src="<?=$imagem[0]?>"></a></td>
					</tr>
					<tr>
						<td class="celula" valign="top">
							<?=date("d/m/Y",$evento["data"])?>
						</td>
					</tr>
					<!--<tr>
						<td align="center" valign="bottom"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" align="bottom" src="imagens/avancar.gif"></a></td>
					</tr>-->
				</table>
			</td>
			<?
			$contador_de_colunas++;
			if($contador_de_colunas >= $colunas){
				echo("</tr><tr>");
				$contador_de_colunas = 0;
			}
		}
		?></tr></table><?
	}
	require("desconectar_mysql.php");
}

?>
