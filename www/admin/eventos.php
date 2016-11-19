<?php
require("permissao_documento.php");
include("../funcoes.php");
admin("inicia_pagina();");
$pagina = $_GET["pagina"];
if(strlen($pagina) == 0) $pagina = 1;
constroi_tabela_eventos_admin(12, 3, $pagina);
admin("termina_pagina();");
?>