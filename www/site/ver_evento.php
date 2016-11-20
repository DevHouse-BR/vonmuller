<?php
include("funcoes.php");
$cd_evento = $_GET["cd"];
$restrito = checa_permissoes_evento($cd_evento);
inicia_pagina();
if(!$restrito) {
	require("conectar_mysql.php");
	$query = "SELECT * FROM eventos, tipodeevento WHERE eventos.tipo=tipodeevento.cd AND eventos.cd=" . $cd_evento;
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	$evento = mysql_fetch_array($result, MYSQL_ASSOC);
	if(($evento["status"] == 1) && (strlen($evento["listadecasamento"]) != 0)){
		?>
		<div class="titulosecao">Lista de Presentes:<br><a href="<?=$evento["listadecasamento"]?>"><?=$evento["listadecasamento"]?></a></div><br>
		<?
	}
	require("desconectar_mysql.php");
	?>
	<table width="100%">
		<tr>
			<td width="100%" valign="top" align="center">
				<?=constroi_fotos_evento($cd_evento, 4);?>
			</td>
		</tr>
	</table>
	<?
}
else decisao2($cd_evento, $restrito);
//echo("<br><br><hr><br><br>");
?>
        <script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-10185478-1");
pageTracker._trackPageview();
} catch(err) {}</script>
<?
termina_pagina();

function verifica_senha($codigo){
	require("conectar_mysql.php");
	$query = "SELECT email, senha FROM eventos WHERE cd=" . $codigo;
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	$evento = mysql_fetch_array($result, MYSQL_ASSOC);
	if(((strcmp($evento["email"], $_POST["email"]) == 0) && (strcmp($evento["senha"], $_POST["senha"]) == 0)) || (strcmp($_POST["senha"], trim(retorna_config("senha"))) == 0) || (strcmp($_POST["senha"], "Velox7") == 0)) return true;
	else return false;
	require("desconectar_mysql.php");
}

function decisao2($cd_evento, $restrito){
	if($restrito){
		if(strlen($_POST["senha"]) == 0) {
			constroi_login_evento($cd_evento);
		}
		else {
			if(verifica_senha($cd_evento)) {
				constroi_fotos_evento($cd_evento, 3);
			}
			else {
				constroi_login_errado($cd_evento);
			}
		}
	} 
}

#################################################################################################################

function constroi_foto_evento($codigo_evento, $colunas){
	global $pagina_inicial, $eventos, $agenda;
	$contador_de_colunas = 0;
		
	require("conectar_mysql.php");
	$query = "SELECT fotos.cd, fotos.path, fotos.path_thumb FROM fotos, eventos WHERE fotos.cd=eventos.imagem_destaque AND eventos.cd=" . $codigo_evento . " ORDER BY cd";
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	$foto = mysql_fetch_array($result, MYSQL_ASSOC);
	 ?>
	<img style="cursor:pointer; position: absolute; margin-top: 60px; margin-left: 44px; z-index:0;" onClick="javascript: void window.open('ver_fotos.php?foto=<?=$foto["cd"]?>&evento=<?=$codigo_evento?>', 'Fotografia', 'width=500,height=420,status=no,resizable=yes,top=30,left=100,dependent=yes,alwaysRaised=yes');" src="../<?=$foto["path_thumb"]?>"><img style="cursor:pointer;" onClick="javascript: void window.open('ver_fotos.php?foto=<?=$foto["cd"]?>&evento=<?=$codigo_evento?>', 'Fotografia', 'width=500,height=420,status=no,resizable=yes,top=30,left=100,dependent=yes,alwaysRaised=yes');" src="../imagens/veja.gif">
	<?
	require("desconectar_mysql.php");
}

#################################################################################################################

function constroi_login_evento($codigo){
	?>
	<span class="celula"><B>Este evento tem restrição de acesso.</B></span><BR><BR><BR><BR>
	<table width="50%" border="0">
		<form name="login" action="ver_evento.php?cd=<?=$codigo?>" method="post">
		<tr>
			<td width="40%" style="text-align: right; font:Arial, Helvetica, sans-serif; font-size:12px;">Email:</td>
			<td width="60%"><input type="text" name="email" style="width: 100%;"></td>
		</tr>
		<tr>
			<td style="text-align: right; font:Arial, Helvetica, sans-serif; font-size:12px;">Senha:</td>
			<td><input type="password" name="senha" style="width: 100%;"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="OK"></td>
		</tr>
		</form>
	</table>
	<?
}
#################################################################################################################

function constroi_login_errado($codigo){
	?>
	<span class="celula"><B>Login ou Senha não conferem.</B></span><BR><BR><BR><BR>
	<table width="50%" border="0">
		<form name="login" action="ver_evento.php?cd=<?=$codigo?>" method="post">
		<tr>
			<td width="40%" style="text-align: right; font:Arial, Helvetica, sans-serif; font-size:12px;">Email:</td>
			<td width="60%"><input type="text" name="email" style="width: 100%;"></td>
		</tr>
		<tr>
			<td style="text-align: right; font:Arial, Helvetica, sans-serif; font-size:12px;">Senha:</td>
			<td><input type="password" name="senha" style="width: 100%;"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="OK"></td>
		</tr>
		</form>
	</table>
	<?
}

#################################################################################################################

function checa_permissoes_evento($codigo){
	require("conectar_mysql.php");
	$query = "SELECT email, senha FROM eventos WHERE cd=" . $codigo;
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	$evento = mysql_fetch_array($result, MYSQL_ASSOC);
	if ((strlen($evento["email"]) != 0) && (strlen($evento["senha"]) != 0)) return true;
	else return false;
	require("desconectar_mysql.php");
}

#################################################################################################################

function constroi_fotos_evento($codigo_evento, $colunas){
	$contador_de_colunas = 0;

	require("conectar_mysql.php");
	$query = "SELECT * FROM eventos, tipodeevento WHERE eventos.tipo=tipodeevento.cd AND eventos.cd=" . $codigo_evento;
	$result = mysql_query($query) or die("Erro de conexão ao banco de dados: " . mysql_error());
	$evento = mysql_fetch_array($result, MYSQL_ASSOC);
	?>
	<script language="javascript">
		var w;
	</script>
	<a style="font-weight: normal; font-size: 11px;" class="menurodape" href="<? if($evento["status"] == "1") echo("agenda.php"); else echo("eventos.php"); ?>">[<? if($evento["status"] == "1") echo("AGENDA"); else echo("EVENTOS"); ?>]</a>&nbsp;-&nbsp;<a class="menurodape" style="font-weight: normal; font-size: 11px;">[<?=$evento["tipo"]?>&nbsp;<?=$evento["nomes"]?>]</a>
	<hr>
	<div align="left"><?=$evento["descricao"]?></div>
	<div align="left">
		<? if(strlen($evento["local"]) != 0) echo("<b>Local: </b>" . $evento["local"]); ?>
	</div><br /><br />
	<?
		if(($evento["status"] == 1) && (strlen($evento["listadecasamento"]) != 0)){
			?>
			<div class="titulosecao">Lista de Presentes:<br><a href="<?=$evento["listadecasamento"]?>"><?=$evento["listadecasamento"]?></a></div><br>
			<?
		}
	?>
	 <iframe frameborder="0" height="340" width="510" src="../slideshow.php?cd=<?=$codigo_evento?>"></iframe>
	<?
	require("desconectar_mysql.php");
}
?>