<?php
error_reporting  (E_ERROR | E_PARSE);

require("permissao_documento.php");

$passo = $_REQUEST["passo"];
$modo = $_REQUEST["modo"];
$secao = $_REQUEST["secao"];

if (strlen($passo) == 0) $passo = 0;

switch($passo){
	case 0: constroi_passo0();
			break;
	case 1: constroi_passo1();
			break;
}



##############################################################################################
function constroi_passo0(){
	global $modo, $secao;
	
	if($modo == "update"){
		$codigo = $_REQUEST["cd"];
		$update = true;
		require("../conectar_mysql.php");
		$query = "SELECT * FROM secoes where cd=" . $codigo;
		$result = mysql_query($query) or die("Erro de conex�o ao banco de dados: " . mysql_error() . $query);
		$registro = mysql_fetch_array($result, MYSQL_ASSOC);
        $titulo = $registro["titulo"];
		require("../desconectar_mysql.php");
	}
	?>
	<html>
		<head>
			<title>Cadastro de Texto da Se��o</title>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
			<style type="text/css">
				.label{
					font-family:Verdana, Arial, Helvetica, sans-serif;
					font-size:12px;
					text-align:right;
					vertical-align:top;				
				}
			</style>
		</head>
		<body>
			<table width="500">
				<form action="wizard_novo_texto_secao.php" method="post" name="novotexto">
				<tr>
					<td class="label">T�tulo:</td>
					<td><input type="text" name="titulo" maxlength="255" size="40"<? if($update) echo(' value="' . $titulo . '"');?>></td>
				</tr>
				<tr>
					<td colspan="2" class="label">
					<? 
						require("../editor_secao.php");
						$editor = new editorHTML("500px", "400px", "/estilo_editor.css", $codigo, 0);
					?>
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="label"><input type="button" onClick="save();" value="Salva"></td>
				</tr>
				<input type="hidden" name="texto" id="texto">
				<input type="hidden" name="passo" value="1">
				<input type="hidden" name="modo" value="<? if($update) echo("update"); else echo("add");?>">
				<input type="hidden" name="cd" value="<? if($update) echo($codigo);?>">
				<input type="hidden" name="secao" value="<?=$secao?>">
				</form>
			</table>
		</body>
	</html>
	<? 
}

##############################################################################################
function constroi_passo1(){
	
	$titulo = $_POST["titulo"];
	$texto = $_POST["texto"];
	$nomedesecao = $_POST["secao"];
	$modo = $_POST["modo"];
	
	if ($modo == "add")	{
		$query = "INSERT INTO secoes (titulo, texto, nomedesecao) VALUES ('";
		$query .= $titulo ."','";
		$query .= $texto ."', ";
		$query .= $nomedesecao .")";
	}
	if ($modo == "update") {
		$query = "UPDATE secoes SET ";
		$query .= "titulo='" . $titulo ."', ";
		$query .= "texto='" . $texto ."'";
		$query .= " WHERE cd='" . $_POST["cd"] . "'";
	}
	require("../conectar_mysql.php");
		$result = mysql_query($query) or die("Erro ao atualizar registros no Banco de dados: " . mysql_error());
	require("../desconectar_mysql.php");
	?>
	<html>
		<head>
			<title>Texto Salvo!</title>
		</head>
		<body>
			<h3>Texto Gravado com Sucesso!</h3>
			<br><br>
			<a href="wizard_novo_texto_secao.php?secao=<?=$nomedesecao?>">[Adicionar Novo Texto Para a Se��o]</a>
			<br><br>
			<a href="javascript: self.close(); opener.location = opener.location">[Fechar]</a>
		</body>
	</html>
	<?
}

?>
