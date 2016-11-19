<?
require("funcoes.php");
inicia_pagina();
if($_GET["modo"] == "enviar") envia_mensagem();
else{
	?>
	<br /><br />
	<div class="titulosecao">&nbsp;Fale Conosco</div><br>
	<table width="80%" class="conteudo">
		<form action="contato.php?modo=enviar" method="post">
		<tr>
			<th align="right" valign="top" width="10%">Nome</td>
			<td><input style="width:99%" type="text" name="nome" class="caixa_texto"></td>
		</tr>
		<tr>
			<th align="right" valign="top">Telefone</td>
			<td><input style="width:99%" type="text" name="telefone" class="caixa_texto"></td>
		</tr>
		<tr>
			<th align="right" valign="top">Email</td>
			<td><input style="width:99%" type="text" name="email" class="caixa_texto"></td>
		</tr>
		<tr>
			<th align="right" valign="top">Mensagem</td>
			<td><textarea style="width:99%" cols="40" rows="15" name="mensagem"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right" valign="top"><input type="submit" value="enviar"></td>
		</tr>
		</form>
	</table>
	<?
}
termina_pagina();


function envia_mensagem(){
	$nome = $_POST["nome"];
	$telefone = $_POST["telefone"];
	$email = $_POST["email"];
	$mensagem = $_POST["mensagem"];
	$destino = retorna_config("email");
	?>
	<div class="titulosecao"><img align="bottom" src="imagens/bullet_silver.gif">&nbsp;Fale Conosco!</div><br>
	<?
	$cMail = new COM("Persits.MailSender"); 

	// dados para autenticacao no servidor SMTP 
	$cMail->Host = "mail.vonmuller.com"; 
	$cMail->Username = "faleconosco@vonmuller.com"; 
	$cMail->Password = "3l3630ax"; 
	
	// caso queira enviar o email no formato HTML adicione a linha 
	$cMail->IsHTML = false; 
	
	// email de origem 
	$cMail->From = $email; 
	$cMail->FromName = $nome; 
	
	//email de destino 
	$cMail->AddAddress("faleconosco@vonmuller.com"); 
	
	 // assunto da mensagem 
	$cMail->Subject = "Formulário de Contato - vonmuller.com"; 
	
	// conteudo da mensagem mensagem 
	$cMail->Body = $mensagem . "\n\n\nNome: " . $nome . "\nTelefone: " . $telefone; 
	
	// enviar a mensagem com msg de sucesso ou nao 
	if($cMail->Send()) { ?>
		<table width="100%" class="conteudo">
			<tr>
				<td>A mensagem foi enviada com sucesso!</td>
			</tr>
			<tr>
				<td><br><br><br><br><br><a href="contato.php">[Nova Mensagem]</a></td>
			</tr>
		</table>
<?	}
	else{ ?>
		<table width="100%" class="conteudo">
			<tr>
				<td>Problemas no envio da mensagem</td>
			</tr>
			<tr>
				<td><br><br><br><br><br><a href="javascript: history.back();">[Tentar Novamente]</a></td>
			</tr>
		</table>
<?	}
}
?>