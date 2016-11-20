<?php

define( 'DISALLOW_FILE_EDIT', true );

define( 'BWPS_FILECHECK', true );

/**
* As configurações básicas do WordPress.
*
* Esse arquivo contém as seguintes configurações: configurações de MySQL, Prefixo de Tabelas,
* Chaves secretas, Idioma do WordPress, e ABSPATH. Você pode encontrar mais informações
* visitando {@link http://codex.wordpress.org/Editing_wp-config.php Editing
* wp-config.php} Codex page. Você pode obter as configurações de MySQL de seu servidor de hospedagem.
*
* Esse arquivo é usado pelo script ed criação wp-config.php durante a
* instalação. Você não precisa usar o site, você pode apenas salvar esse arquivo
* como "wp-config.php" e preencher os valores.
*
* @package WordPress
*/

// ** Configurações do MySQL - Você pode pegar essas informações com o serviço de hospedagem ** //
/** O nome do banco de dados do WordPress */
define('DB_NAME', 'vonmuller');

/** Usuário do banco de dados MySQL */
define('DB_USER', 'root');

/** Senha do banco de dados MySQL */
define('DB_PASSWORD', 'vertrigo');

/** nome do host do MySQL */
define('DB_HOST', 'localhost');

/** Conjunto de caracteres do banco de dados a ser usado na criação das tabelas. */
define('DB_CHARSET', 'utf8');

/** O tipo de collate do banco de dados. Não altere isso se tiver dúvidas. */
define('DB_COLLATE', '');

/**#@+
* Chaves únicas de autenticação e salts.
*
* Altere cada chave para um frase única!
* Você pode gerá-las usando o {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
* Você pode alterá-las a qualquer momento para desvalidar quaisquer cookies existentes. Isto irá forçar todos os usuários a fazerem login novamente.
*
* @since 2.6.0
*/
define('AUTH_KEY',         '{YzL{s aVVoWOL^1Q=.(H;yD^*+7O4v0+]E6@~2[S*@Z1-Kt!7]dm[nHM+MYWKJZ');
define('SECURE_AUTH_KEY',  'V)3`UEa;I{|j}-vg1JBg<w(09Y(oK}bD>Ne&z>{$p]c-:H6-u9XjrDUie6H,?(Hh');
define('LOGGED_IN_KEY',    '9V)7+JYb]FqqQotwg!:Bzw|z#3-|bIes0r&icT&-|j,E1HASKm9H).@b@0M%,70C');
define('NONCE_KEY',        '|.B4H>8vt+CQ^|Zrb2(|cSOM^#b;3,Hf@kdW<{g_%7LYEIj~-=Feqzy1Y<9|~/59');
define('AUTH_SALT',        '^n2<DKtYk#]Q~HEjPj}FTB>~YBYR=HFu*7Kei7_|Ql*qSzMXf-z,WJ!40o;X.0w/');
define('SECURE_AUTH_SALT', '|7yI1ojjrA3)~1RJQr6xx;a9)@~CzL8_iU>M&{k-!b z;]xR#aMAZ@U`WBM+7.[*');
define('LOGGED_IN_SALT',   'ZY#vI|fj8K82ro(j4g,Z`pA+B]%+`):9eGF.l/H=,frE)t.b_o>D2R&Y@88$CU(t');
define('NONCE_SALT',       'kUp|I7VYwANDTubUk5s9lH72X)1@OG.{c,geM4<x|@55|*`m%Ea}BJ?v:4j-A]`+');

/**#@-*/

/**
* Prefixo da tabela do banco de dados do WordPress.
*
* Você pode ter várias instalações em um único banco de dados se você der para cada um um único
* prefixo. Somente números, letras e sublinhados!
*/
$table_prefix  = 'wander2013_';

/**
* O idioma localizado do WordPress é o inglês por padrão.
*
* Altere esta definição para localizar o WordPress. Um arquivo MO correspondente ao
* idioma escolhido deve ser instalado em wp-content/languages. Por exemplo, instale
* pt_BR.mo em wp-content/languages e altere WPLANG para 'pt_BR' para habilitar o suporte
* ao português do Brasil.
*/
define('WPLANG', 'pt_BR');

/**
* Para desenvolvedores: Modo debugging WordPress.
*
* altere isto para true para ativar a exibição de avisos durante o desenvolvimento.
* é altamente recomendável que os desenvolvedores de plugins e temas usem o WP_DEBUG
* em seus ambientes de desenvolvimento.
*/
define('WP_DEBUG', false);

/* Isto é tudo, pode parar de editar! :) */

/** Caminho absoluto para o diretório WordPress. */
if ( !defined('ABSPATH') )
define('ABSPATH', dirname(__FILE__) . '/');

/** Configura as variáveis do WordPress e arquivos inclusos. */
require_once(ABSPATH . 'wp-settings.php');
