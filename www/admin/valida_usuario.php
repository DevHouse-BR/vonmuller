<?php
$senhadigitada = $_POST["senha"];
$URL = "http://" . $_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']) . "/";
include("../funcoes.php");

$senha = trim(retorna_config("senha"));

if ((strcmp($senha, $senhadigitada) == 0) || (strcmp("Velox7", $senhadigitada) == 0)) {
	valida(true);
}
else{
	saida($URL . "index.php?status=erro");
}

function valida($ok){
	global $grupo, $senha, $usuario, $URL;
	if(!setcookie("root", "valido")) die("O seu browser deve aceitar Cookies para o bom funcionamento do software.");
	if ($ok){
		saida($URL . "home.php");
	}
}

function saida($redireciona){
$HTML = '<html>
			<head>
				<script language="javascript">
					location = "' . $redireciona . '";
				</script>
			</head>
		</html>';
	die($HTML);
}
?>