<?php
	function verifica_nome_arquivo($teste){
		$CARACTERES_SEM_PERMISSAO = "��������������������@#$%&*���?�/' "; //caracteres que dever�o ser substituidos
		$TRADUZIDOS_PARA = "aonaonaeiouaeiouuucc______________"; //por estes caracteres.
		
		return strtolower(strtr($teste,$CARACTERES_SEM_PERMISSAO, $TRADUZIDOS_PARA));
	}
?>