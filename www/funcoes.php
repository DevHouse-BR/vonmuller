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
		<script language="javascript">
			var saiu = 0;
			var intervalo;
			var count = 0;
			var intervalofade;
	
			function start(){
				count = 0;
				saiu = 0;
				intervalo = setInterval(checamouse, 500);
			}
			function checamouse(){
				if (saiu != 0){
					escondemenu();
					clearInterval(intervalo);
					saiu = 0;
					count = 0;
				}
			}
			function escondemenu(){
			<?
			$counter = 6;
			require("conectar_mysql.php");
			$result = mysql_query("SELECT cd FROM nomedesecao");
			while($secao = mysql_fetch_assoc($result)){
				?>
				document.getElementById("menu_<?=$counter?>").innerHTML = "";
				document.getElementById("menu_<?=$counter?>").style.visibility = "hidden";
				<?
				$counter++;
			}
			require("desconectar_mysql.php");
			?>
			}
		<?
		$counter = 6;
		require("conectar_mysql.php");
		$result = mysql_query("SELECT * FROM nomedesecao ORDER BY nome");
		while($secao = mysql_fetch_assoc($result)){
			?>
			function mostramenu<?=$counter?>(){
				escondemenu();
				var html = 	'<table border="0" width="190" bgcolor="#E4D4BA">'<?
				require("conectar_mysql.php");
				$result2 = mysql_query("SELECT cd, titulo FROM secoes WHERE nomedesecao=" . $secao["cd"] . " ORDER BY titulo");
				while($subsecao = mysql_fetch_assoc($result2)){
					if($secao["pgseparadas"] == "n") echo("+ '<tr><td width=\"5\">&nbsp;</td><td><li><a class=\"menuesquerdo\" href=\"secao.php?secao=" . $secao["cd"] . "#" . $subsecao["cd"] . "\">" . ucwords(strtolower($subsecao["titulo"])) . "</a></li></td></tr>'");
					else echo("+ '<tr><td width=\"5\">&nbsp;</td><td><li><a class=\"menuesquerdo\" href=\"secao.php?secao=" . $secao["cd"] . "&subsecao=" . $subsecao["cd"] . "\">" . ucwords(strtolower($subsecao["titulo"])) . "</a></li></td></tr>'");
				}
				echo(";" . "\n");
				require("desconectar_mysql.php");
				if(mysql_num_rows($result2) != 0) echo('document.getElementById("menu_' . $counter . '").innerHTML = html;');
				echo("\n");
				?>
				document.getElementById("menu_<?=$counter?>").style.position = "absolute";
				document.getElementById("menu_<?=$counter?>").style.zIndex = "99999";
				document.getElementById("menu_<?=$counter?>").style.visibility = "visible";
				document.getElementById("menu_<?=$counter?>").style.filter = "progid:DXImageTransform.Microsoft.Shadow(color=#333333, Direction=135, Strength=5), filter: progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=88)";
			}
			<?
			$counter++;
		}
		?>
		</script>
	</head>
	<body>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="43" height="60" background="imagens/filme1.jpg">&nbsp;</td>
			</tr>
			<tr>
				<td height="100%" align="center" valign="top">
					<table>
						<tr>
							<td width="147" valign="top"><img align="absmiddle" src="imagens/logo.jpg" />
								<table width="147" cellpadding="0" cellspacing="0">
									<tr>
										<td width="147" height="31" background="imagens/cabecalho_menu.jpg">&nbsp;</td>
									</tr>
									<tr>
										<td background="imagens/fundo_menu.jpg" align="left" style="padding-left:25px;">
											<a class="menuesquerdo" href="/">Home</a><br />
											<a class="menuesquerdo" href="agenda.php">Agenda</a><br />
											<a class="menuesquerdo" href="eventos.php">Eventos</a><br />
											<?
											$counter = 6;
											require("conectar_mysql.php");
											$result = mysql_query("SELECT * FROM nomedesecao ORDER BY nome");
											while($secao = mysql_fetch_assoc($result)){
												if($secao["pgseparadas"] == "n"){?>
													<a class="menuesquerdo" onMouseOver="mostramenu<?=$counter?>();" href="secao.php?secao=<?=$secao["cd"]?>"><?=$secao["nome"]?></a><br />
												<? }
												else echo('<span class="menuesquerdo">' . $secao["nome"] . '</span><br>'); ?>
												<span id="menu_<?=$counter?>" onMouseOver="start();" onMouseOut="saiu = 1;"></span>
												<?
												$counter++;
											}
											require("desconectar_mysql.php");
											?>
										</td>
									</tr>
									<tr>
										<td width="147" height="34" background="imagens/rodape_menu.jpg">&nbsp;</td>
									</tr>
								</table>
							</td>
							<td width="770">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td colspan="3" height="80" style="font-family:Arial, Helvetica, sans-serif; color:#FFFFFF; font-size:20px; font-weight:bold;">Wander Von Muller - Fotógrafo Profissional</td>
									</tr>
									<tr>
										<td colspan="3"><img src="imagens/cabecalho.jpg" /></td>
									</tr>
									<tr>
										<td width="72" background="imagens/esq.jpg">&nbsp;</td>
										<td width="600" background="imagens/fundo.jpg">
	<?
}

###############################################################################################################

function termina_pagina(){
	?>
								</td>
										<td width="98" background="imagens/dir.jpg">&nbsp;</td>
									</tr>
									<tr>
										<td colspan="3"><img src="imagens/rodape.jpg" /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>					
				</td>
			</tr>
			<tr>
				<td width="43" height="60" background="imagens/filme2.jpg">&nbsp;</td>
			</tr>
		</table>
	</body>
</html>
	<?
}

###############################################################################################################

function admin($funcao){
	ob_start();
	eval($funcao);
	$html = ob_get_contents();
	ob_clean();
	$html = str_replace("estilo.css", "../estilo.css", $html);
	$html = str_replace("imagens/", "../imagens/", $html);
	$html = str_replace("img/", "../img/", $html);
	$html = str_replace("fotos/", "../fotos/", $html);
	echo(str_replace('<a class="menuesquerdo" href="agenda.php">Agenda</a><br />
											<a class="menuesquerdo" href="eventos.php">Eventos</a><br />', '<a class="menuesquerdo" href="eventos.php">Agenda e Eventos</a><br><a class="menuesquerdo" href="secoes.php">Gerenciar Seções</a>', $html));
	flush();
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
			<td width="33%" align="center" valign="top">
				<table width="100%" border="0" height="180" style="border: solid 1px #808080;" bgcolor="#E4D4BA">
					<tr>
						<td height="93" align="center" valign="top"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" src="<?=$imagem[0]?>"></a></td>
					</tr>
					<tr>
						<td class="celula" valign="top">
							<?
							if(strlen($evento["pginicial"] == 0)) echo(substr($evento["descricao"], 0, 150) . "...");
							else echo(substr($evento["pginicial"], 0, 150) . "...");
							?>
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
			<td width="33%" align="center" valign="top" <?=$style?>>
				<table width="100%" border="0" height="180" style="border: solid 1px #808080;" bgcolor="#E4D4BA">
					<tr>
						<td height="93" align="center" valign="top"><a href="ver_evento.php?cd=<?=$evento["cd"]?>"><img border="0" src="<?=$imagem[0]?>"></a></td>
					</tr>
					<tr>
						<td class="celula" valign="top">
							<span style="font-weight: bold; color: #000000;"><?=date("d/m/Y", $evento["data"])?></span><br>
							<?
							if(strlen($evento["pginicial"] == 0)) echo(substr($evento["descricao"], 0, 150) . "...");
							else echo(substr($evento["pginicial"], 0, 150) . "...");
							?>
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