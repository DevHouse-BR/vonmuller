<?php
error_reporting(E_ALL);
$THUMB_ROOT = "thumb/";
$IMG_ROOT = "fotos";
$evento = $_GET["evento"];
$fotografo = $_GET["fotografo"];
if(strlen($evento) == 0) die("Informe o codigo do evento.");
$numero = rand();
$LARGURA_IMG_FINAL = 500;
$ALTURA_IMG_FINAL = 333;
$LARGURA_THUMB = 120;
$ALTURA_THUMB = 90;
$JPG_QUALITY = 90;

$HTML_RETORNO1 = "<h3>Já existe uma imagem com este nome. Mude-o e tente novamente.</h3></body></html>";
$HTML_RETORNO2 = "<h3>São permitidos uploads de imagens apenas do tipo jpg.</h3></body></html>";
$HTML_RETORNO3 = "<h3>Erro ao utilizar função imagecreate().</h3></body></html>";
$HTML_RETORNO4 = "<h3>Erro ao utilizar função imagecopyresized(). Talvez arquivo corrompido no envio.</h3></body></html>";



include("funcoes_strings.php");
echo('<html><body onUnload="self.opener.location.reload();">');


$arrayArquivos = array();


if ($handle = opendir('../caixa_entrada')) {
    while (false !== ($arquivo = readdir($handle))) { 
        if ($arquivo != "." && $arquivo != "..") { 
			
			$arrayArquivos[] = $arquivo;
			
		}
	}
}

natcasesort($arrayArquivos);


if (count($arrayArquivos) > 0) {
    foreach ($arrayArquivos as $arquivo){		
		$imagem_arquivo = "../caixa_entrada/" . $arquivo;
		$imagem_info = getimagesize($imagem_arquivo);
		$imagem_largura = $imagem_info[0];
		$imagem_altura = $imagem_info[1];
		$imagem_tipo = $imagem_info[2];
		$nome = $evento . "_" . $numero . ".jpg";
		

		$nome_da_imagem = verifica_nome_arquivo($nome);
		
		if ($imagem_tipo == "2"){
			
			if(file_exists( $IMG_ROOT . "/" . $nome_da_imagem)){
				if(file_exists($IMG_ROOT . "/" . str_replace(".jpg", "_b.jpg", $nome_da_imagem))){
					if(file_exists( $IMG_ROOT . "/" . str_replace(".jpg", "_c.jpg", $nome_da_imagem))) die($HTML_RETORNO1);
					else $nome_da_imagem = str_replace(".jpg", "_c.jpg", $nome_da_imagem);
				}
				else $nome_da_imagem = str_replace(".jpg", "_b.jpg", $nome_da_imagem);
			}
			
			$imagem_original = imagecreatefromjpeg($imagem_arquivo);
			
			########################## Imagem Grande ###################################################
			
			if($imagem_largura > $imagem_altura) $fator_proporcao = $LARGURA_IMG_FINAL / $imagem_largura;
			else $fator_proporcao = $ALTURA_IMG_FINAL / $imagem_altura;
			if ($fator_proporcao > 1) $fator_proporcao = 1;
			
			$nova_largura_img = $imagem_largura * $fator_proporcao;
			$nova_altura_img = $imagem_altura * $fator_proporcao;
			
			$nova_imagem = imagecreatetruecolor($nova_largura_img,$nova_altura_img) or die($HTML_RETORNO3); 
			imagecopyresampled($nova_imagem, $imagem_original, 0, 0, 0, 0, $nova_largura_img, $nova_altura_img, $imagem_largura, $imagem_altura) or die($HTML_RETORNO4 . " - Posicao 1 = Nome do arquivo: " . $arquivo); 
			

			switch($fotografo){
				case '0':
					$watermark = imagecreatefrompng("../imagens/watermark-wander.png");
					imagecopy($nova_imagem, $watermark, ($nova_largura_img - 455), ($nova_altura_img - 44), 0, 0, 455, 44);
					break;
				case '1':
					$watermark = imagecreatefrompng("../imagens/watermark-vilson.png");
					imagecopy($nova_imagem, $watermark, ($nova_largura_img - 455), ($nova_altura_img - 44), 0, 0, 455, 44);
					break;
				case '2':
					$watermark = imagecreatefrompng("../imagens/watermark.png");
					imagecopy($nova_imagem, $watermark, ($nova_largura_img - 122), ($nova_altura_img - 57), 0, 0, 122, 57);
					break;
			}
						
			$nova_imagem_grande = $IMG_ROOT . "/" . $nome_da_imagem;
			
			imagejpeg($nova_imagem, "../" . $nova_imagem_grande, $JPG_QUALITY);
			
			#############################################################################################
		
			############################### Thumbnail ###################################################
			
			if($imagem_largura > $imagem_altura) $fator_proporcao = $LARGURA_THUMB / $imagem_largura;
			else $fator_proporcao = $ALTURA_THUMB / $imagem_altura;
			
			$nova_largura_thumb = $imagem_largura * $fator_proporcao;
			$nova_altura_thumb = $imagem_altura * $fator_proporcao;
			
			
			if($imagem_largura > $imagem_altura){
				$nova_imagem = imagecreatetruecolor(120, 90) or die($HTML_RETORNO3); 
				imagecopyresampled($nova_imagem, $imagem_original, 0, 0, 0, 0, 120, 90, $imagem_largura, $imagem_altura) or die($HTML_RETORNO4 . " - Posicao 2"); 
			}
			else{
				$nova_imagem = imagecreatetruecolor(120, 90) or die($HTML_RETORNO3); 
				imagecopyresampled($nova_imagem, $imagem_original, 0, 0, 0, 0, 120, 90, $imagem_largura, ($imagem_altura/2)) or die($HTML_RETORNO4 . " - Posicao 3");
			}
			
			$nova_imagem_thumb = $IMG_ROOT . "/" . $THUMB_ROOT . "thumb_" . $nome_da_imagem;
			
			imagejpeg($nova_imagem, "../" . $nova_imagem_thumb, $JPG_QUALITY);
			
			#############################################################################################
			require("../conectar_mysql.php");
			$query = "INSERT INTO fotos (path, path_thumb, cd_evento, bytes, largura, altura) VALUES ('";
			$query .= $nova_imagem_grande ."','";
			$query .= $nova_imagem_thumb. "',";
			$query .= $evento . ","; 
			$query .= "0,"; 
			$query .= $nova_largura_img. ",";
			$query .= $nova_altura_img . ")";
			mysql_query($query) or die("erro ao gravar imagem no banco de dados." . mysql_error());
			require("../desconectar_mysql.php");
		}

		echo('<img src="../' . $nova_imagem_grande . '"><br>');
		$numero++;
		flush();
	}
}

if ($handle = opendir('../caixa_entrada')) {
    while (false !== ($arquivo = readdir($handle))) { 
        if ($arquivo != "." && $arquivo != "..") {
			unlink('../caixa_entrada/' . $arquivo);
		}
	}
	closedir($handle); 
}
echo("</body></html>");
?>