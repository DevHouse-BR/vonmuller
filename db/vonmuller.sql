-- phpMyAdmin SQL Dump
-- version 3.0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Nov 19, 2016 as 11:13 PM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `vonmuller`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_ak_profiles`
--

CREATE TABLE IF NOT EXISTS `jos_ak_profiles` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_ak_profiles`
--

INSERT INTO `jos_ak_profiles` (`id`, `description`, `configuration`, `filters`) VALUES
(1, 'Default Backup Profile', '[global]\n[akeeba]\nbasic.output_directory="C:\\ServidorWEB\\www\\vonmuller\\administrator\\components\\com_akeeba\\backup"\nbasic.temporary_directory="C:\\ServidorWEB\\www\\vonmuller\\tmp"\nbasic.log_level="4"\nbasic.archive_name="site-[HOST]-[DATE]-[TIME]"\nbasic.backup_type="full"\nadvanced.dump_engine="native"\nadvanced.scan_engine="smart"\nadvanced.archiver_engine="zip"\nadvanced.proc_engine="none"\nadvanced.writer_engine="direct"\nadvanced.embedded_installer="abi"\nadvanced.virtual_folder="external_files"\nquota.enable_size_quota="0"\nquota.size_quota="15728640"\nquota.enable_count_quota="0"\nquota.count_quota="3"\ntuning.min_exec_time="2000"\ntuning.max_exec_time="14"\ntuning.run_time_bias="75"\n[engine]\narchiver.directftp.host=""\narchiver.directftp.port="21"\narchiver.directftp.user=""\narchiver.directftp.pass=""\narchiver.directftp.initial_directory=""\narchiver.directftp.ftps="0"\narchiver.directftp.passive_mode="1"\narchiver.directftp.ftp_test="0"\narchiver.common.dereference_symlinks="0"\narchiver.common.part_size="0"\narchiver.common.chunk_size="1048576"\narchiver.common.big_file_threshold="1048576"\narchiver.zip.cd_glue_chunk_size="1048576"\ndump.common.mysql_compatibility="0"\ndump.common.extended_inserts="0"\ndump.common.packet_size="131072"\ndump.common.splitsize="524288"\ndump.common.batchsize="1000"\ndump.native.advanced_entitites="0"\nscan.smart.large_dir_threshold="100"\n', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_ak_stats`
--

CREATE TABLE IF NOT EXISTS `jos_ak_stats` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL default '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL default '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL default 'run',
  `origin` enum('backend','frontend','cli') NOT NULL default 'backend',
  `type` enum('full','dbonly','extradbonly','alldb','fileonly') NOT NULL default 'full',
  `profile_id` bigint(20) NOT NULL default '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_ak_stats`
--

INSERT INTO `jos_ak_stats` (`id`, `description`, `comment`, `backupstart`, `backupend`, `status`, `origin`, `type`, `profile_id`, `archivename`, `absolute_path`, `multipart`) VALUES
(1, 'Tomadas de Backup Quarta, 01 Setembro 2010 22:56', '', '2010-09-01 22:56:32', '2010-09-01 22:57:35', 'complete', 'backend', 'full', 1, 'site-localhost-20100901-225632.zip', 'C:/ServidorWEB/www/vonmuller/administrator/components/com_akeeba/backup/site-localhost-20100901-225632.zip', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_banner`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'von muler', '(47)3465-2943', 'wanderfotografias@hotmail.com', 'hgdkjhdjfhdhkjdh;', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'VonMuller', '', 'vonmuller', '', 'com_contact_details', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(2, 0, 'Blog', '', 'blog', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Extraindo dados da tabela `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, 'site=pt-BR\nadministrator=pt-BR\n\n', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(34, 'JCE', 'option=com_jce', 0, 0, 'option=com_jce', 'JCE', 'com_jce', 0, 'components/com_jce/img/logo.png', 0, '\npackage=1', 1),
(35, 'JCE MENU CPANEL', '', 0, 34, 'option=com_jce', 'JCE MENU CPANEL', 'com_jce', 0, 'templates/khepri/images/menu/icon-16-cpanel.png', 0, '', 1),
(36, 'JCE MENU CONFIG', '', 0, 34, 'option=com_jce&type=config', 'JCE MENU CONFIG', 'com_jce', 1, 'templates/khepri/images/menu/icon-16-config.png', 0, '', 1),
(37, 'JCE MENU GROUPS', '', 0, 34, 'option=com_jce&type=group', 'JCE MENU GROUPS', 'com_jce', 2, 'templates/khepri/images/menu/icon-16-user.png', 0, '', 1),
(38, 'JCE MENU PLUGINS', '', 0, 34, 'option=com_jce&type=plugin', 'JCE MENU PLUGINS', 'com_jce', 3, 'templates/khepri/images/menu/icon-16-plugin.png', 0, '', 1),
(39, 'JCE MENU INSTALL', '', 0, 34, 'option=com_jce&type=install', 'JCE MENU INSTALL', 'com_jce', 4, 'templates/khepri/images/menu/icon-16-install.png', 0, '', 1),
(40, 'Akeeba Backup', 'option=com_akeeba', 0, 0, 'option=com_akeeba', 'Akeeba Backup', 'com_akeeba', 0, 'components/com_akeeba/assets/images/akeeba-16.png', 0, 'siteurl=http://premiere.devhouse.com.br/vonmuller/\njversion=1.5\n\n', 1),
(41, 'BACKUP_NOW', '', 0, 40, 'option=com_akeeba&view=backup', 'BACKUP_NOW', 'com_akeeba', 0, 'components/com_akeeba/assets/images/backup-16.png', 0, '', 1),
(42, 'CONFIGURATION', '', 0, 40, 'option=com_akeeba&view=config', 'CONFIGURATION', 'com_akeeba', 1, 'components/com_akeeba/assets/images/config-16.png', 0, '', 1),
(43, 'ADMINISTER_BACKUP_FILES', '', 0, 40, 'option=com_akeeba&view=buadmin', 'ADMINISTER_BACKUP_FILES', 'com_akeeba', 2, 'components/com_akeeba/assets/images/bufa-16.png', 0, '', 1),
(44, 'eXtplorer', 'option=com_extplorer', 0, 0, 'option=com_extplorer', 'eXtplorer', 'com_extplorer', 0, '../administrator/components/com_extplorer/images/joomla_x_icon.png', 0, '', 1),
(56, 'Phoca Gallery', 'option=com_phocagallery', 0, 0, 'option=com_phocagallery', 'Phoca Gallery', 'com_phocagallery', 0, 'components/com_phocagallery/assets/images/icon-16-pg-menu.png', 0, 'categories_columns=1\nequal_percentage_width=1\ndisplay_image_categories=2\ncategories_box_width=220\nimage_categories_size=0\ncategories_image_ordering=1\ncategories_display_avatar=0\ndisplay_subcategories=1\ndisplay_empty_categories=0\nhide_categories=\nshow_categories=\ndisplay_access_category=0\ndefault_pagination_categories=0\npagination_categories=5;10;15;20;50\nfont_color=#000000\nbackground_color=#202020\nbackground_color_hover=#202020\nimage_background_color=#202020\nimage_background_shadow=none\nborder_color=#202020\nborder_color_hover=#202020\nmargin_box=0\npadding_box=0\ndisplay_new=0\ndisplay_hot=0\ndisplay_name=2\ndisplay_icon_detail=0\ndisplay_icon_download=0\ndisplay_icon_folder=0\nfont_size_name=12\nchar_length_name=15\ncategory_box_space=0\ndisplay_categories_sub=0\ndisplay_subcat_page=0\ndisplay_category_icon_image=0\ncategory_image_ordering=1\ndisplay_back_button=0\ndisplay_categories_back_button=1\ndefault_pagination_category=9999\npagination_category=5;10;15;20;50\ndisplay_img_desc_box=0\nfont_size_img_desc=10\nimg_desc_box_height=30\nchar_length_img_desc=300\ndisplay_categories_cv=0\ndisplay_subcat_page_cv=0\ndisplay_category_icon_image_cv=0\ncategory_image_ordering_cv=9\ndisplay_back_button_cv=1\ndisplay_categories_back_button_cv=1\ncategories_columns_cv=1\ndisplay_image_categories_cv=1\nimage_categories_size_cv=4\ndetail_window=3\ndetail_window_background_color=#ffffff\nmodal_box_overlay_color=#000000\nmodal_box_overlay_opacity=0.3\nmodal_box_border_color=#6b6b6b\nmodal_box_border_width=2\nsb_slideshow_delay=5\nsb_lang=br\nhighslide_class=rounded-white\nhighslide_opacity=0\nhighslide_outline_type=rounded-white\nhighslide_fullimg=0\nhighslide_close_button=0\nhighslide_slideshow=1\njak_slideshow_delay=5\njak_orientation=none\njak_description=1\njak_description_height=10\ndisplay_description_detail=0\ndisplay_title_description=0\nfont_size_desc=11\nfont_color_desc=#333333\ndescription_detail_height=16\ndescription_lightbox_font_size=12\ndescription_lightbox_font_color=#ffffff\ndescription_lightbox_bg_color=#000000\nslideshow_delay=3000\nslideshow_pause=0\nslideshow_random=0\ndetail_buttons=1\nphocagallery_width=\nphocagallery_center=0\ncategory_ordering=1\nimage_ordering=1\ngallery_metadesc=\ngallery_metakey=\nalt_value=1\nenable_user_cp=0\nenable_upload_avatar=1\nenable_avatar_approve=0\nenable_usercat_approve=0\nenable_usersubcat_approve=0\nuser_subcat_count=5\nmax_create_cat_char=1000\nenable_userimage_approve=0\nmax_upload_char=1000\nupload_maxsize=3145728\nupload_maxres_width=3072\nupload_maxres_height=2304\nuser_images_max_size=20971520\nenable_java=0\nenable_java_admin=1\njava_resize_width=-1\njava_resize_height=-1\njava_box_width=480\njava_box_height=480\ndisplay_rating=0\ndisplay_rating_img=0\ndisplay_comment=0\ndisplay_comment_img=0\ncomment_width=500\nmax_comment_char=1000\nexternal_comment_system=0\nenable_piclens=0\nstart_piclens=0\npiclens_image=1\nswitch_image=1\nswitch_width=640\nswitch_height=480\nswitch_fixed_size=0\nenable_overlib=0\nol_bg_color=#666666\nol_fg_color=#f6f6f6\nol_tf_color=#000000\nol_cf_color=#ffffff\noverlib_overlay_opacity=0.7\noverlib_image_rate=\ncreate_watermark=2\nwatermark_position_x=right\nwatermark_position_y=bottom\ndisplay_icon_vm=0\ndisplay_category_statistics=0\ndisplay_main_cat_stat=1\ndisplay_lastadded_cat_stat=1\ncount_lastadded_cat_stat=3\ndisplay_mostviewed_cat_stat=1\ncount_mostviewed_cat_stat=3\ndisplay_camera_info=0\nexif_information=FILE.FileName;FILE.FileDateTime;FILE.FileSize;FILE.MimeType;COMPUTED.Height;COMPUTED.Width;COMPUTED.IsColor;COMPUTED.ApertureFNumber;IFD0.Make;IFD0.Model;IFD0.Orientation;IFD0.XResolution;IFD0.YResolution;IFD0.ResolutionUnit;IFD0.Software;IFD0.DateTime;IFD0.Exif_IFD_Pointer;IFD0.GPS_IFD_Pointer;EXIF.ExposureTime;EXIF.FNumber;EXIF.ExposureProgram;EXIF.ISOSpeedRatings;EXIF.ExifVersion;EXIF.DateTimeOriginal;EXIF.DateTimeDigitized;EXIF.ShutterSpeedValue;EXIF.ApertureValue;EXIF.ExposureBiasValue;EXIF.MaxApertureValue;EXIF.MeteringMode;EXIF.LightSource;EXIF.Flash;EXIF.FocalLength;EXIF.SubSecTimeOriginal;EXIF.SubSecTimeDigitized;EXIF.ColorSpace;EXIF.ExifImageWidth;EXIF.ExifImageLength;EXIF.SensingMethod;EXIF.CustomRendered;EXIF.ExposureMode;EXIF.WhiteBalance;EXIF.DigitalZoomRatio;EXIF.FocalLengthIn35mmFilm;EXIF.SceneCaptureType;EXIF.GainControl;EXIF.Contrast;EXIF.Saturation;EXIF.Sharpness;EXIF.SubjectDistanceRange;GPS.GPSLatitudeRef;GPS.GPSLatitude;GPS.GPSLongitudeRef;GPS.GPSLongitude;GPS.GPSAltitudeRef;GPS.GPSAltitude;GPS.GPSTimeStamp;GPS.GPSStatus;GPS.GPSMapDatum;GPS.GPSDateStamp\ndisplay_categories_geotagging=0\ncategories_lng=\ncategories_lat=\ncategories_zoom=2\ncategories_map_width=\ncategories_map_height=500\ndisplay_icon_geotagging=0\ndisplay_category_geotagging=0\ncategory_map_width=\ncategory_map_height=400\npagination_thumbnail_creation=0\nclean_thumbnails=0\nenable_thumb_creation=1\ncrop_thumbnail=5\njpeg_quality=85\nenable_picasa_loading=1\npicasa_load_pagination=20\nicon_format=gif\nlarge_image_width=640\nlarge_image_height=480\nmedium_image_width=100\nmedium_image_height=100\nsmall_image_width=200\nsmall_image_height=135\nfront_modal_box_width=680\nfront_modal_box_height=560\nadmin_modal_box_width=680\nadmin_modal_box_height=520\nfolder_permissions=0755\njfile_thumbs=1\n\n', 1),
(57, 'Control Panel', '', 0, 56, 'option=com_phocagallery', 'Control Panel', 'com_phocagallery', 0, 'components/com_phocagallery/assets/images/icon-16-pg-control-panel.png', 0, '', 1),
(65, 'Users', '', 0, 56, 'option=com_phocagallery&view=phocagalleryusers', 'Users', 'com_phocagallery', 8, 'components/com_phocagallery/assets/images/icon-16-pg-menu-users.png', 0, '', 1),
(64, 'Image Comments', '', 0, 56, 'option=com_phocagallery&view=phocagallerycoimgs', 'Image Comments', 'com_phocagallery', 7, 'components/com_phocagallery/assets/images/icon-16-pg-menu-comment-img.png', 0, '', 1),
(63, 'Category Comments', '', 0, 56, 'option=com_phocagallery&view=phocagallerycos', 'Category Comments', 'com_phocagallery', 6, 'components/com_phocagallery/assets/images/icon-16-pg-menu-comment.png', 0, '', 1),
(62, 'Image Rating', '', 0, 56, 'option=com_phocagallery&view=phocagalleryraimg', 'Image Rating', 'com_phocagallery', 5, 'components/com_phocagallery/assets/images/icon-16-pg-menu-vote-img.png', 0, '', 1),
(61, 'Category Rating', '', 0, 56, 'option=com_phocagallery&view=phocagalleryra', 'Category Rating', 'com_phocagallery', 4, 'components/com_phocagallery/assets/images/icon-16-pg-menu-vote.png', 0, '', 1),
(60, 'Themes', '', 0, 56, 'option=com_phocagallery&view=phocagalleryt', 'Themes', 'com_phocagallery', 3, 'components/com_phocagallery/assets/images/icon-16-pg-menu-theme.png', 0, '', 1),
(59, 'Categories', '', 0, 56, 'option=com_phocagallery&view=phocagallerycs', 'Categories', 'com_phocagallery', 2, 'components/com_phocagallery/assets/images/icon-16-pg-menu-cat.png', 0, '', 1),
(58, 'Images', '', 0, 56, 'option=com_phocagallery&view=phocagallerys', 'Images', 'com_phocagallery', 1, 'components/com_phocagallery/assets/images/icon-16-pg-menu-gal.png', 0, '', 1),
(66, 'Info', '', 0, 56, 'option=com_phocagallery&view=phocagalleryin', 'Info', 'com_phocagallery', 9, 'components/com_phocagallery/assets/images/icon-16-pg-menu-info.png', 0, '', 1),
(67, 'FlippingBook', 'option=com_flippingbook', 0, 0, 'option=com_flippingbook', 'FlippingBook', 'com_flippingbook', 0, 'components/com_flippingbook/images/icon_fb.png', 0, '', 1),
(68, 'Configuration', '', 0, 67, 'option=com_flippingbook&task=configuration', 'Configuration', 'com_flippingbook', 0, 'components/com_flippingbook/images/icon_config.png', 0, '', 1),
(69, 'Manage Categories', '', 0, 67, 'option=com_flippingbook&task=category_manager', 'Manage Categories', 'com_flippingbook', 1, 'components/com_flippingbook/images/icon_cm.png', 0, '', 1),
(70, 'Manage Books', '', 0, 67, 'option=com_flippingbook&task=book_manager', 'Manage Books', 'com_flippingbook', 2, 'components/com_flippingbook/images/icon_bm.png', 0, '', 1),
(71, 'Manage Pages', '', 0, 67, 'option=com_flippingbook&task=page_manager', 'Manage Pages', 'com_flippingbook', 3, 'components/com_flippingbook/images/icon_pm.png', 0, '', 1),
(72, 'Batch Add Pages', '', 0, 67, 'option=com_flippingbook&task=batch_add_pages', 'Batch Add Pages', 'com_flippingbook', 4, 'components/com_flippingbook/images/icon_batch.png', 0, '', 1),
(73, 'Manage Files', '', 0, 67, 'option=com_flippingbook&task=file_manager', 'Manage Files', 'com_flippingbook', 5, 'components/com_flippingbook/images/icon_fm.png', 0, '', 1),
(74, 'Phoca Maps', 'option=com_phocamaps', 0, 0, 'option=com_phocamaps', 'Phoca Maps', 'com_phocamaps', 0, 'components/com_phocamaps/assets/images/icon-16-pmap-menu.png', 0, '', 1),
(75, 'Control Panel', '', 0, 74, 'option=com_phocamaps', 'Control Panel', 'com_phocamaps', 0, 'components/com_phocamaps/assets/images/icon-16-pmap-menu-cp.png', 0, '', 1),
(76, 'Maps', '', 0, 74, 'option=com_phocamaps&view=phocamapsmaps', 'Maps', 'com_phocamaps', 1, 'components/com_phocamaps/assets/images/icon-16-pmap-menu-map.png', 0, '', 1),
(77, 'Markers', '', 0, 74, 'option=com_phocamaps&view=phocamapsmarkers', 'Markers', 'com_phocamaps', 2, 'components/com_phocamaps/assets/images/icon-16-pmap-menu-marker.png', 0, '', 1),
(78, 'Info', '', 0, 74, 'option=com_phocamaps&view=phocamapsinfo', 'Info', 'com_phocamaps', 3, 'components/com_phocamaps/assets/images/icon-16-pmap-menu-info.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'VonMuller Estúdio Fotográfico', 'vonmuller-estudio-fotografico', '', 'Rua Santo Agostinho, 96 - Guanabara', 'Joinville', 'Santa Catarina', 'Brasil', '', '(47) 3465-2943', '', '', '', NULL, 'faleconosco@vonmuller.com', 0, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\nshow_position=1\nshow_email=1\nshow_street_address=1\nshow_suburb=1\nshow_state=1\nshow_postcode=1\nshow_country=1\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nshow_webpage=1\nshow_misc=1\nshow_image=1\nallow_vcard=1\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_email_form=1\nemail_description=\nshow_email_copy=1\nbanned_email=\nbanned_subject=\nbanned_text=', 0, 1, 0, '', 'http://www.vonmuller.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', '', '<p><img style="margin: 6px; float: left;" alt="casamento" src="images/flippingbook/gestante.jpg" />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum metus tellus, pulvinar non gravida vel, ultricies non odio. Sed dui libero, pellentesque at dapibus in, tristique in ipsum. Pellentesque vestibulum dolor sit amet mauris dictum sed volutpat tellus bibendum. Ut vel velit quam, vel hendrerit dolor. Duis fermentum vestibulum turpis sed ultrices. Nam dui orci, laoreet ut pellentesque id, pellentesque nec tortor. Suspendisse potenti.</p>\r\n', '\r\nSuspendisse sit amet elit nec nibh elementum semper. Duis interdum laoreet dignissim. Nam nec pulvinar est. Praesent venenatis tincidunt lorem, auctor ultrices sapien aliquet nec. In hac habitasse platea dictumst. Nam lectus lorem, pharetra sollicitudin dignissim sit amet, cursus ut turpis. Suspendisse ultrices imperdiet lacus, sed venenatis turpis fermentum ac. Vivamus purus velit, luctus vitae convallis ac, euismod et libero. Curabitur sit amet leo vitae est pretium placerat. Sed eget sagittis arcu. Nam venenatis est ut est rutrum pellentesque et eu orci.\r\n<p> </p>\r\n<p>Integer at dictum risus. Cras venenatis mattis arcu. Nam est odio, dapibus at elementum sit amet, bibendum id est. Sed eget sem in felis mattis sodales sed sed dolor. Suspendisse nec eleifend ante. Etiam id sem vitae erat congue dapibus at id tellus. Maecenas tincidunt cursus nunc, a pellentesque urna bibendum vel. Nulla volutpat vulputate cursus. Cras metus ante, lacinia vel faucibus ullamcorper, auctor vitae ipsum. Sed nec mauris purus, eu porta orci. Vivamus libero lorem, volutpat et blandit a, mattis at erat. Cras eu erat enim. Morbi eu sapien eu orci aliquam molestie. Morbi pellentesque nibh turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque nisi tellus, convallis ac laoreet non, pellentesque id neque. In sit amet adipiscing ligula.</p>\r\n<p>Fusce laoreet, ipsum ac volutpat interdum, arcu nisi dignissim enim, sed ullamcorper dolor dui et arcu. Praesent consequat, arcu nec placerat lobortis, enim risus aliquam augue, id malesuada magna erat ut neque. Morbi tincidunt dui nulla, a hendrerit nisi. Praesent ut augue neque. Nunc placerat fermentum lacus id feugiat. In hac habitasse platea dictumst. Aliquam mollis auctor justo eu accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Morbi ornare nunc ut ipsum pharetra euismod. Morbi viverra, felis ut luctus ornare, nisi lorem porta ante, ac egestas orci nisi nec ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In imperdiet viverra eros id posuere. Nullam tortor neque, adipiscing id aliquet et, laoreet a felis. Nam vel nunc nunc, id scelerisque dolor. Nulla sodales, dui et aliquam posuere, lacus odio ullamcorper nisl, vel tristique eros ante a dui. Suspendisse tincidunt quam nec sem tincidunt mollis. Aenean ornare viverra sem a malesuada. Vestibulum aliquet fringilla rhoncus. Nunc laoreet blandit varius.</p>\r\n<p>Etiam vel lorem a augue pharetra rhoncus. Duis condimentum libero sed orci tristique in varius tellus lacinia. Fusce condimentum varius turpis. Suspendisse feugiat dictum magna, eu tempus felis volutpat non. Aenean libero velit, vulputate vitae pharetra vel, placerat sit amet tortor. Sed vitae arcu dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed non felis justo, ullamcorper vestibulum nunc. Vivamus placerat ullamcorper velit vel pulvinar. Ut dapibus justo vel elit vehicula imperdiet. Vestibulum ac dolor sed dolor consectetur interdum. In pharetra velit vitae risus ultrices lacinia. Maecenas dictum ante tristique arcu pulvinar at consectetur nisl faucibus. Proin lectus enim, tristique sed pellentesque nec, imperdiet a tortor. Aenean eu bibendum metus. Etiam ullamcorper dictum magna, id tempor risus mollis id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla tortor dui, varius at faucibus at, dapibus ac ante. Vestibulum ac dolor in sem condimentum consequat id a mauris.</p>\r\n<p>Sed eu mauris tortor. Nulla vehicula placerat lorem, ac venenatis felis feugiat vel. Ut lorem lectus, facilisis a viverra ac, ornare at felis. Maecenas id justo vitae mi tempor auctor in sed neque. Donec vitae ultrices dui. Sed blandit urna nec dolor congue at faucibus purus sagittis. Nulla congue scelerisque pulvinar. Integer purus nisl, viverra eget fringilla eget, egestas a nisi. Maecenas a enim quis nisl lacinia molestie eu nec lorem. Nullam volutpat erat in diam molestie a egestas tellus euismod. Vivamus sodales lacinia quam a suscipit. Suspendisse mauris nunc, tempus facilisis interdum in, mollis quis mauris. Cras aliquam cursus nisi eget rhoncus. Cras placerat euismod hendrerit. Maecenas porttitor dolor et ipsum suscipit sit amet gravida velit iaculis. Integer eget leo leo, in condimentum leo. Curabitur eget ultricies diam. Etiam vitae ultricies turpis.</p>', -2, 1, 0, 2, '2010-07-07 00:00:00', 62, '', '2010-09-11 22:24:39', 62, 0, '0000-00-00 00:00:00', '2010-09-09 20:41:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 2, 'robots=\nauthor='),
(2, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', '', '<p><img style="margin: 6px; float: left;" alt="casamento" src="images/phocagallery/casamento_joao_e_maria/thumbs/phoca_thumb_s_img_8523b.jpg" />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum metus tellus, pulvinar non gravida vel, ultricies non odio. Sed dui libero, pellentesque at dapibus in, tristique in ipsum. Pellentesque vestibulum dolor sit amet mauris dictum sed volutpat tellus bibendum. Ut vel velit quam, vel hendrerit dolor. Duis fermentum vestibulum turpis sed ultrices. Nam dui orci, laoreet ut pellentesque id, pellentesque nec tortor. Suspendisse potenti.\r\n', '\r\nSuspendisse sit amet elit nec nibh elementum semper. Duis interdum laoreet dignissim. Nam nec pulvinar est. Praesent venenatis tincidunt lorem, auctor ultrices sapien aliquet nec. In hac habitasse platea dictumst. Nam lectus lorem, pharetra sollicitudin dignissim sit amet, cursus ut turpis. Suspendisse ultrices imperdiet lacus, sed venenatis turpis fermentum ac. Vivamus purus velit, luctus vitae convallis ac, euismod et libero. Curabitur sit amet leo vitae est pretium placerat. Sed eget sagittis arcu. Nam venenatis est ut est rutrum pellentesque et eu orci.</p>\r\n<p>Integer at dictum risus. Cras venenatis mattis arcu. Nam est odio, dapibus at elementum sit amet, bibendum id est. Sed eget sem in felis mattis sodales sed sed dolor. Suspendisse nec eleifend ante. Etiam id sem vitae erat congue dapibus at id tellus. Maecenas tincidunt cursus nunc, a pellentesque urna bibendum vel. Nulla volutpat vulputate cursus. Cras metus ante, lacinia vel faucibus ullamcorper, auctor vitae ipsum. Sed nec mauris purus, eu porta orci. Vivamus libero lorem, volutpat et blandit a, mattis at erat. Cras eu erat enim. Morbi eu sapien eu orci aliquam molestie. Morbi pellentesque nibh turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque nisi tellus, convallis ac laoreet non, pellentesque id neque. In sit amet adipiscing ligula.</p>\r\n<p>Fusce laoreet, ipsum ac volutpat interdum, arcu nisi dignissim enim, sed ullamcorper dolor dui et arcu. Praesent consequat, arcu nec placerat lobortis, enim risus aliquam augue, id malesuada magna erat ut neque. Morbi tincidunt dui nulla, a hendrerit nisi. Praesent ut augue neque. Nunc placerat fermentum lacus id feugiat. In hac habitasse platea dictumst. Aliquam mollis auctor justo eu accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Morbi ornare nunc ut ipsum pharetra euismod. Morbi viverra, felis ut luctus ornare, nisi lorem porta ante, ac egestas orci nisi nec ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In imperdiet viverra eros id posuere. Nullam tortor neque, adipiscing id aliquet et, laoreet a felis. Nam vel nunc nunc, id scelerisque dolor. Nulla sodales, dui et aliquam posuere, lacus odio ullamcorper nisl, vel tristique eros ante a dui. Suspendisse tincidunt quam nec sem tincidunt mollis. Aenean ornare viverra sem a malesuada. Vestibulum aliquet fringilla rhoncus. Nunc laoreet blandit varius.</p>\r\n<p>Etiam vel lorem a augue pharetra rhoncus. Duis condimentum libero sed orci tristique in varius tellus lacinia. Fusce condimentum varius turpis. Suspendisse feugiat dictum magna, eu tempus felis volutpat non. Aenean libero velit, vulputate vitae pharetra vel, placerat sit amet tortor. Sed vitae arcu dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed non felis justo, ullamcorper vestibulum nunc. Vivamus placerat ullamcorper velit vel pulvinar. Ut dapibus justo vel elit vehicula imperdiet. Vestibulum ac dolor sed dolor consectetur interdum. In pharetra velit vitae risus ultrices lacinia. Maecenas dictum ante tristique arcu pulvinar at consectetur nisl faucibus. Proin lectus enim, tristique sed pellentesque nec, imperdiet a tortor. Aenean eu bibendum metus. Etiam ullamcorper dictum magna, id tempor risus mollis id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla tortor dui, varius at faucibus at, dapibus ac ante. Vestibulum ac dolor in sem condimentum consequat id a mauris.</p>\r\n<p>Sed eu mauris tortor. Nulla vehicula placerat lorem, ac venenatis felis feugiat vel. Ut lorem lectus, facilisis a viverra ac, ornare at felis. Maecenas id justo vitae mi tempor auctor in sed neque. Donec vitae ultrices dui. Sed blandit urna nec dolor congue at faucibus purus sagittis. Nulla congue scelerisque pulvinar. Integer purus nisl, viverra eget fringilla eget, egestas a nisi. Maecenas a enim quis nisl lacinia molestie eu nec lorem. Nullam volutpat erat in diam molestie a egestas tellus euismod. Vivamus sodales lacinia quam a suscipit. Suspendisse mauris nunc, tempus facilisis interdum in, mollis quis mauris. Cras aliquam cursus nisi eget rhoncus. Cras placerat euismod hendrerit. Maecenas porttitor dolor et ipsum suscipit sit amet gravida velit iaculis. Integer eget leo leo, in condimentum leo. Curabitur eget ultricies diam. Etiam vitae ultricies turpis.</p>', -2, 1, 0, 2, '2010-09-09 20:41:13', 62, '', '2010-09-09 20:55:30', 62, 0, '0000-00-00 00:00:00', '2010-09-09 20:41:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 0, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(3, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', '', '<p><img src="images/flippingbook/book1.jpg" alt="casamento" style="margin: 6px; float: left;" /></p>\r\n<p>Aqui, gostaria de abrir uma pequena reflexão. Com o barateamento da fotografia digital, muitas pessoas que se viram sem emprego ou que estavam atrás de uma complementação de renda, começaram a investir no mercado de cobertura de eventos e confecção de books. Pessoas sem o mínimo conhecimento de fotografia que acharam que era só comprar uma câmera, apontar e disparar. O problema é que essas pessoas encontraram um grande retorno, principalmente das camadas mais pobres da população aonde o preço vem acima da qualidade. O resultado pode ser visto em ações como essa. O mercado fotográfico tem espaço para mais gente, principalmente os talentosos, mas é necessário ter o mínimo de conhecimento do que se está fazendo.</p>\r\n<p>Por outro lado, a reclamação da qualidade das fotos eu entendo que não é cabível nessa situação. O atraso é imperdoável, ainda mais em um casamento, onde não se podem repetir as cenas em outro dia porque não deu certo da primeira vez. O fotógrafo é sempre o primeiro a chegar. Mas, a questão da qualidade das fotos está ligada ao valor pago por elas. A empresa de cobertura fotográfica possui um portfólio no&nbsp;<strong>Picasa </strong>que deve ter sido mostrado aos reclamantes. É nítida em todas as fotos a falta de conhecimento fotográfico e intimidade com o equipamento que se está usando. Tudo está errado, desde os enquadramentos até o uso da luz. Pergunto-me se depois de ter visto a capacidade da fotógrafa e ter aceitado o valor cobrado pelo serviço ainda existe a possibilidade de reclamação pelo que se recebeu. Infelizmente, cobertura fotográfica de casamentos é uma coisa cara, pois depende de investimento em conhecimento fotográfico e equipamento. Procurar pelo mais barato pode ser um erro nessas horas.</p>\r\n<p>Mas, por que estou falando disso aqui? Bem, a fotografia é uma arte e uma técnica ao mesmo tempo. Trabalhar com isso é muito bacana e pode render algum dinheiro bem como uma incrível fonte de diversão. Olhando para o&nbsp;<a href="http://www.flickr.com/groups/meiobit/">grupo do flickr</a> notei que muitos aqui possuem potencial para entrar nessa área, desde que tenham vontade de aprender um pouco mais. Por isso, vou iniciar uma série de artigos onde vou dar alguns toques de áreas que podem ser desenvolvidas sem a necessidade de grandes investimentos em equipamentos ou abrir um estúdio fotográfico. Quando comecei não tive nenhum tipo de indicação sobre o que fazer ou como proceder no início. Tudo que aprendi foi quebrando a cabeça. Hoje existem vários textos na net falando sobre isso, mas poucos são realmente objetivos. Então, espero poder trazer um pouco de conhecimento para quem está começando e mostrar que existem caminhos que podem unir o hobby, a diversão, o prazer de fotografar e a possibilidade de ter algum rendimento.</p>', '', -2, 1, 0, 2, '2010-09-09 20:41:13', 62, '', '2010-10-19 21:06:49', 63, 0, '0000-00-00 00:00:00', '2010-09-09 20:41:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 1, 'robots=\nauthor='),
(14, 'Bodas de Prata ', 'bodas-de-prata-', '', '<p><img width="200" src="images/stories/Bodassolenirecelso/Imagem_087_Small_2_Custom.jpg" alt="Imagem_087_Small_2_Custom" height="133" style="float: left; margin: 6px;" />No dia 06 de Janeiro de 2011 o casal Solenir&nbsp;e Celso Nieues comemorou 25 anos de casamento bodas de prata</p>\r\n<p>A cerimônia foi celebrada na igreja Matriz de Joinville São Francisco Xavier.</p>\r\n<p>Após a cerimônia os convidados foram recepcionados no salão principal do BKR Eventos.</p>\r\n', '\r\n<p>Veja mais fotos abaixo:</p>\r\n<p> </p>\r\n<p>{phocagallery view=category|categoryid=6|limitstart=0|limitcount=0|enableswitch=1}</p>\r\n<p> </p>\r\n<p><br style="clear: left;" />&nbsp;</p>', 1, 1, 0, 2, '2011-01-29 17:39:19', 63, '', '2011-01-31 13:43:53', 63, 0, '0000-00-00 00:00:00', '2011-01-29 17:39:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 3, '', '', 0, 33, 'robots=\nauthor='),
(15, 'teste', 'teste', '', '<p>ghjhgjh</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<p>{phocagallery view=category|categoryid=6|limitstart=0|limitcount=0|enableswitch=1}</p>', -2, 1, 0, 2, '2011-01-29 19:37:35', 62, '', '2011-01-29 19:42:31', 62, 0, '0000-00-00 00:00:00', '2011-01-29 19:37:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 0, '', '', 0, 3, 'robots=\nauthor='),
(16, 'Simone e Zeno', 'simone-e-zeno', '', '<img style="float: left; margin: 6px;" alt="IMG_9945_Custom" height="133" width="200" src="images/stories/Simone_e_Zeno/IMG_9945_Custom.jpg" />\r\n<div></div>\r\n<div>Simone e Zeno uniram-se em Matrimônio no dia 08 de Janeiro de 2011.</div>\r\n<p>Na igreja Nossa Senhora de Fátima, na rua xv de novembro.</p>\r\n<div>Após a Cerimônia os convidados farão recepcionados no salão príncipe na BKR Eventos.</div>\r\n<div></div>\r\n<div></div>\r\n<div>\r\n', '\r\n</div>\r\n<div></div>\r\n<div></div>\r\n<div><br /><br />Veja as fotos abaixo:<br /><br />&nbsp;</div>\r\n<div>{phocagallery view=category|categoryid=8|limitstart=0|limitcount=0|enableswitch=1}</div>', 1, 1, 0, 2, '2011-01-29 21:27:37', 63, '', '2011-01-29 21:47:12', 63, 63, '2011-01-29 21:47:12', '2011-01-29 21:27:37', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 2, '', '', 0, 9, 'robots=\nauthor='),
(4, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', '', '<p><img src="images/flippingbook/juliana.jpg" alt="casamento" style="margin: 6px; float: left;" /></p>\r\n<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n<tbody>\r\n<tr>\r\n<td width="70%" valign="top">\r\n<p>1-Para fazer um ensaio&nbsp;<b>você   só precisa ligar para os telefones  (47)   3465-2943 ou 3028-2943</b></p>\r\n<p><b> </b></p>\r\n<p><b> </b>E agendar um horário.   Estaremos tirando eventuais dúvidas &nbsp;e   lhe passando datas disponíveis para seu ensaio  fotográfico!<br /> <br /> 2- No link<a href="http://www.fashionbooks.com.br/pacoteskitsprecosp.html"> Valores</a>, você encontra nossos pacotes prontos.   No caso de escolher Book Profissional (o completo), solicitamos que envie   foto e medidas para produção do figurino. <br /> <br /> 3- Chegado o dia marcado, começamos a prepará-la (o) para a sessão de fotos. Não   precisa se preocupar com nada, apenas traga as suas roupas (em caso de book   simples - pessoal). Temos maquiadores profissionais para fazer diversos   penteados, maquiagens, escova. <br /> <br /> Caso seu pacote não inclua figurino, é recomendável você trazer aquele seu   vestido preferido, ou alguma roupa que lhe agrade. Normalmente três peças são   suficientes: Procure tons diferentes, sem muito exagero e também não traga   roupas com marca aparente. O enfoque será a pessoa e não a roupa. Nós temos   algumas produções no estúdio como complemento. <br /> <br /> 4 - Modelo produzida, tudo pronto, começamos o ensaio fotográfico. Trabalhamos   com grande oportunidade de escolhas, serão tiradas várias fotos para que   possamos escolher as melhores. <br /> <br /> 5-Feito o ensaio, dentro de dois dias úteis você receberá por</p>\r\n<p>E-MAIL as provinha do ensaio em versão colorida e Preto e Branco,   para que possa escolher as fotos a serem ampliadas.O prazo para preparação é   de 10 dias após a escolha das fotos.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n<tbody>\r\n</tbody>\r\n</table>', '', -2, 1, 0, 2, '2010-09-09 20:41:13', 62, '', '2010-10-19 21:05:16', 63, 0, '0000-00-00 00:00:00', '2010-09-09 20:41:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(17, 'Karine e Glauber', 'karina-e-glauber', '', '<img width="200" src="images/stories/Karine_e_Glauber/Imagem_271_Custom.jpg" alt="Imagem_271_Custom" height="133" style="float: left; margin: 6px;" />\r\n<div>\r\n<p>&nbsp;Glauber Guise de Bitencout e Kanine Hengler casarão no dia 18 de dezembro de 2010.</p>\r\n<p>A cerimônia foi realizada na igreja nossa senhora de Alexandria, os convidados foram recepcinados no clube Grêmio&nbsp;<b>whirlpool.</b></p>\r\n<p> </p>\r\n', '\r\n</div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div>Vejas mais fotos deste evento.<br /><br /><br /></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div></div>\r\n<div>{phocagallery view=category|categoryid=7|limitstart=0|limitcount=0}</div>', 1, 1, 0, 2, '2011-01-31 13:05:21', 63, '', '2011-01-31 13:38:32', 63, 0, '0000-00-00 00:00:00', '2011-01-31 13:05:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 1, '', '', 0, 10, 'robots=\nauthor='),
(5, 'Encanto e beleza da modelo Julia  em ensaio fotográfico', 'ensaio-fotografico', '', '<p><img style="margin: 6px; float: left;" alt="casamento" src="images/flippingbook/feminino.jpg" /></p>\r\n<p style="line-height: 15.9pt;">A magia da fotografia aplicada a um bom profissional altamente qualificado e devidamente equipamento fás as imagens parecem mágica.<o:p></o:p></p>\r\n<p style="line-height: 15.9pt;">O segredo da boa imagem, acima de tudo aplica se ao talento visão e perspicácia.&nbsp;<o:p></o:p></p>\r\n<p style="line-height: 15.9pt;">Inindo em uma só imagem beleza encanto, técnica e conhecimento.<o:p></o:p></p>\r\n<p style="line-height: 15.9pt;">Luzes e sombras expressão fotogenia e a beleza da mulher brasileira traduzidas em belas imagens fotográfica.<o:p></o:p></p>\r\n<p style="line-height: 15.9pt;">Foto by: Wander Von Muller.<o:p></o:p></p>\r\n<p style="line-height: 15.9pt;"><o:p> </o:p></p>', '', -2, 1, 0, 2, '2010-09-09 20:41:13', 62, '', '2010-10-19 21:11:27', 63, 0, '0000-00-00 00:00:00', '2010-09-09 20:41:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(12, 'Making of.', 'ensaio', '', 'fsdfsdfsffdsf', '', -2, 1, 0, 2, '2010-10-20 16:18:16', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-10-20 16:18:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 1, 'robots=\nauthor='),
(13, 'Teste', 'teste', '', '<img style="border-width: 0px; margin: 6px; float: left;" alt="IMG_9798_Custom" src="images/stories/IMG_9798_Custom.jpg" width="203" height="135" />hjkhkhkLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at sapien purus. Cras massa dui, semper sit amet elementum ac, pretium et nisl. Nullam ut mattis ligula. Nulla in odio ut dolor suscipit tincidunt. In hac habitasse platea dictumst. Nullam mattis feugiat elit, non volutpat enim facilisis posuere. Proin tristique molestie felis et imperdiet. Sed venenatis lobortis tellus a consequat. Ut eleifend nulla eget risus placerat sit amet hendrerit risus vestibulum.&nbsp; Maecenas egestas, nibh at vehicula viverra, massa urna convallis massa, vitae sollicitudin risus massa id mauris. Maecenas euismod urna urna, consectetur congue enim. Etiam dictum eros id velit ultricies non lobortis arcu consequat. Pellentesque egestas lacinia magna, sed aliquet urna tincidunt nec. Fusce viverra pellentesque nunc, quis blandit orci sagittis at. Fusce at dapibus diam. Phasellus tincidunt augue feugiat sapien tempus dignissim rhoncus felis fermentum.&nbsp;     \r\n', '\r\n<p> </p>\r\n<p>Mauris luctus magna vel leo mattis auctor. Mauris viverra, ante vitae commodo lobortis, arcu tellus vehicula nisi, nec ullamcorper mi nibh at mauris. Suspendisse odio risus, rutrum ut convallis in, semper dapibus sem. Integer fringilla viverra dignissim. Praesent molestie, justo iaculis semper tincidunt, nibh magna scelerisque felis, quis tristique mi odio id ipsum. In ut nibh a dolor semper egestas in ut diam. Sed a est sit amet enim blandit posuere eget id lectus. Morbi nec ante nulla, vulputate gravida lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque et ante lorem. Phasellus rutrum tellus risus, et imperdiet elit. Vivamus tempus lobortis malesuada.</p>\r\n<p>Fusce a massa sit amet nisl mollis bibendum. Nunc eleifend, tortor id placerat eleifend, nulla neque vestibulum nibh, quis dictum ipsum libero ac nulla. Ut libero eros, tincidunt eu accumsan vitae, dignissim et neque. Duis vel iaculis libero. Maecenas tempus, nisi a imperdiet imperdiet, metus enim consequat lacus, et tempor eros libero quis lorem. Vivamus nisi risus, ullamcorper vel viverra ut, volutpat ut odio. Curabitur quam lacus, accumsan eu congue vehicula, semper in tortor. Vestibulum ultricies eros vel velit laoreet sit amet auctor quam tincidunt. Mauris libero enim, mollis et commodo ut, adipiscing et eros. Aenean sit amet auctor felis. Integer vulputate venenatis urna, et posuere dolor rhoncus quis. Praesent sed enim quam, at egestas leo. Nam bibendum erat interdum leo congue quis luctus arcu imperdiet. Mauris adipiscing ultrices nunc, eget tincidunt ipsum faucibus et. Curabitur neque dolor, rutrum ut porta vitae, convallis vitae orci. Phasellus vehicula sodales pharetra.<img style="margin: 6px; border-width: 0px; float: right;" alt="articles" src="images/stories/articles.jpg" width="128" height="96" /></p>\r\n<p>Praesent accumsan, lacus non tristique eleifend, nisl quam viverra diam, a pretium odio tellus ut quam. Cras scelerisque libero in metus tristique ut blandit quam facilisis. In dui tortor, iaculis a suscipit tempor, convallis at ipsum. Integer nec velit nec nisi sodales rutrum. Nullam ultrices nibh sit amet velit lacinia pellentesque. Aliquam mattis volutpat rhoncus. Aenean sodales, dolor id tempor egestas, mi nisi interdum leo, quis rhoncus massa lorem vitae nibh. Quisque ultrices mollis urna quis tincidunt. Aliquam lobortis orci non lorem porttitor at interdum ipsum ultricies. Integer imperdiet suscipit odio elementum vulputate. Nullam ut ipsum sed elit porta fringilla. Nullam non massa ipsum. Aenean pulvinar pellentesque purus. Mauris eu lorem elementum quam pulvinar scelerisque molestie non neque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed rutrum lacinia interdum. Aenean elementum lectus eget augue pretium nec ultricies diam commodo. Cras quis elit et nulla sagittis molestie. Aenean id dictum justo.</p>\r\n<p>Nullam eget nibh ante. Quisque nec orci eu ligula pharetra volutpat ac nec orci. Duis quis faucibus mi. Donec pellentesque erat at tellus volutpat facilisis. Proin eget mattis risus. Fusce rhoncus eros id justo ultrices vehicula. Proin dolor purus, semper nec porttitor nec, condimentum sit amet quam. Maecenas vitae condimentum dolor. Nullam varius mauris ut libero iaculis volutpat. Sed tincidunt tincidunt lectus, a vestibulum neque pulvinar et. Maecenas gravida, mi nec bibendum vulputate, urna magna consequat augue, nec egestas mi leo in massa.</p>\r\n<p> </p>\r\n<p>{phocagallery view=category|categoryid=9|limitstart=0|limitcount=0}</p>\r\n\r\n\r\n\r\n<iframe title="YouTube video player" class="youtube-player" type="text/html" width="480" height="390" src="http://www.youtube.com/embed/XTmA6Xx7eFw" frameborder="0" allowFullScreen></iframe>', -2, 1, 0, 2, '2011-01-20 22:59:11', 62, '', '2011-01-20 23:44:17', 62, 0, '0000-00-00 00:00:00', '2011-01-20 22:59:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 4, 'robots=\nauthor='),
(6, 'A Empresa', 'a-empresa', '', '<h3><strong>Quem somos?</strong></h3>\r\n<p>Uma empresa com estrutura e profissionais capacitados para fotografar eventos sociais de alto nível. Atendendo Joinville e região dispomos de equipamentos de qualidade e know-how de anos de mercado.</p>\r\n<h3><br /><strong>O Que fazemos?</strong></h3>\r\n<p>Eternizar sonhos. Registrar os momentos mais importantes e marcantes de uma vida. O instante mágico, o dia mais esperado, o nosso trabalho consiste em guardar e cuidar dessas emoções captadas com sensibilidade e profissionalismo.</p>\r\n<h3><br /><strong>Localização:</strong></h3>\r\n<p>Estamos situados a Rua Augusto Schmidt, ao lado da BKR Eventos.</p>\r\n<p><strong>Veja o mapa abaixo:</strong></p>\r\n<p></p>\r\n<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3575.461475629464!2d-48.84666528484017!3d-26.343932076066768!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjbCsDIwJzM4LjIiUyA0OMKwNTAnNDAuMSJX!5e0!3m2!1sen!2sbr!4v1479603201755" width="770" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>', '', 1, 0, 0, 0, '2010-09-12 18:51:11', 62, '', '2016-11-20 00:54:08', 62, 0, '0000-00-00 00:00:00', '2010-09-12 18:51:11', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 5, '', '', 0, 75, 'robots=\nauthor='),
(7, 'Produtos', 'produtos', '', '<div style="padding: 20px;">\r\n<h2><span class="componentheading">Produtos</span><br /><br /></h2>\r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%">\r\n<div><img alt="img_albuns" src="images/stories/img_albuns.png" height="131" width="126" /></div>\r\n</td>\r\n<td align="left" valign="top">\r\n<h3><strong>Álbuns Encadernados</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">Desenvolvendo uma tecnologia própria, conseguimos uma forma de montar fotos panorâmicas com até 30x64- cm, laminadas com um filme plástico especial fosco ou brilhante, sem cortes de página, encadernados com capa fotográfica ou vários acabamentos como couro e outros materiais. O resultado supera um livro de arte.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td align="right" valign="top">\r\n<h3><strong>Convites Diversos</strong></h3>\r\n</td>\r\n<td rowspan="2" align="right" valign="top" width="10%"><img alt="img_convites" src="images/stories/img_convites.png" height="133" width="126" /></td>\r\n</tr>\r\n<tr>\r\n<td align="right" valign="top">Convites personalizados criados sob medida para atender suas necessidades com tamanhos 10x15 e 15x21, fosco ou brilho.<br /> Próprios para diversas situações como casamentos, 15 anos e aniversários entre outros.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%"><img alt="img_poster" src="images/stories/img_poster.png" height="142" width="165" /></td>\r\n<td align="left" valign="top">\r\n<h3><strong>Pôster</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">Ampliações de pôster a partir 60x90 em mdf ou moldura.Imagens produzidas em nosso estúdio e tratadas por profissionais, impressas em papel fotográfico.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td align="right" valign="top">\r\n<h3><strong>Luminárias</strong></h3>\r\n</td>\r\n<td rowspan="2" align="right" valign="top" width="10%"><img alt="img_luminarias" src="images/stories/img_luminarias.png" height="207" width="110" /></td>\r\n</tr>\r\n<tr>\r\n<td align="right" valign="top">Luminárias personalizadas de tamanhos diversos, estilo redondo ou com pedestal, base mdf, não acompanha lâmpada. Imagens produzidas em estúdio.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%"><img alt="img_cd" src="images/stories/img_cd.png" height="119" width="142" /></td>\r\n<td align="left" valign="top">\r\n<h3><strong>CD Personalizado</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">CD´s para lembrança gravados com músicas que marcaram as vidas dos noivos. Cerca de 20 faixas gravadas em mídia de qualidade duráel com capa personalizada.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td align="right" valign="top">\r\n<h3><strong>Lembranças</strong></h3>\r\n</td>\r\n<td rowspan="2" align="right" valign="top" width="10%"><img alt="img_lembrancas" src="images/stories/img_lembrancas.png" height="73" width="149" /></td>\r\n</tr>\r\n<tr>\r\n<td align="right" valign="top">Lembranças de mesa ou de arranjo para casamentos, aniversários ou casamentos.<br /> Impressas em papel fotográfico com fotos produzidas e editadas.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%"><img alt="img_clipe" src="images/stories/img_clipe.png" height="94" width="152" /></td>\r\n<td align="left" valign="top">\r\n<h3><strong>Clipe Slideshow</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">Clipe editado de fotos contando a vida dos noivos ou do aniversariante, com trilha sonora e fotos de making of ou estúdio (opcional). Acompanha CD com capa personalizada.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td align="right" valign="top">\r\n<h3><strong>Projeção Em Telão</strong></h3>\r\n</td>\r\n<td rowspan="2" align="right" valign="top" width="10%"><img alt="img_projecao" src="images/stories/img_projecao.png" height="127" width="140" /></td>\r\n</tr>\r\n<tr>\r\n<td align="right" valign="top">Projeção simultânea em telão das fotos do evento descarregadas no local em um notebook e visualizadas pelos participantes no mesmo instante. Projetor de última geração ampliando as imagens sem perder qualidade ou resolução.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%"><img alt="img_foto" src="images/stories/img_foto.png" height="119" width="104" /></td>\r\n<td align="left" valign="top">\r\n<h3><strong>Foto Lembrança</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">Impressão de fotos no local do evento com templates personalizados no tema do evento para entrega imediata aos convidados e participantes. Papel fotográfico, impressora a laser e pessoal qualificado para execução das impressões.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '', 1, 0, 0, 0, '2010-09-12 20:38:16', 62, '', '2010-09-12 20:56:28', 62, 0, '0000-00-00 00:00:00', '2010-09-12 20:38:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 4, '', '', 0, 46, 'robots=\nauthor='),
(8, 'Serviços', 'servicos', '', '<div style="padding: 20px;">\r\n<p><span class="componentheading">Serviços</span></p>\r\n<p>A Von Muller Foto e Vídeo Digital empresa que atua no ramo de coberturas de eventos sociais, estúdio e publicidade com um know-how de anos de prática e experiência na área de fotojornalismo e books fotográficos, prioriza atingir excelência e qualidade em todos os serviços prestados para seu clientes.<br /> Atuando com uma equipe de profissionais qualificados e equipamentos de alta tecnologia oferecemos prestação de serviços com competência e eficiência, valorizando o seu evento ainda mais com a cobertura fotográfica dinâmica e ágil, sem perder nenhum detalhe.</p>\r\n<p> </p>\r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%"><img alt="img_fotografias" src="images/stories/img_fotografias.png" height="117" width="140" /></td>\r\n<td align="left" valign="top">\r\n<h3><strong>Fotografias Digitais</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">Fotografias de alta definição produzidas com equipamentos profissionais, disponíveis após 48 horas para visualização e conferência. Todas as imagens são tratadas através de softwares de edição gráfica aumentando ainda mais a qualidade do registro dos eventos.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td align="right" valign="top">\r\n<h3><strong>Filmagem Digital</strong></h3>\r\n</td>\r\n<td rowspan="2" align="right" valign="top" width="10%"><img alt="img_filmagem" src="images/stories/img_filmagem.png" height="140" width="146" /></td>\r\n</tr>\r\n<tr>\r\n<td align="right" valign="top">Filmagem digital com equipamentos de qualidade e pessoal treinado e capacitado para cobertura do evento. Edição profissional, personalização de dvd com menu interativo e capa personalizada.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td rowspan="2" align="left" valign="top" width="10%"><img alt="img_books" src="images/stories/img_books.png" height="234" width="237" /></td>\r\n<td align="left" valign="top">\r\n<h3><strong>Books Profissionais</strong></h3>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td align="left" valign="top">Fotos de alta qualidade produzidas em nosso estúdio. Com horário marcado, a sessão é feita sob a supervisão de um acompanhante e permite ao cliente uma variedade de possibilidades com acessórios e maquiagem incluídas. Todas as fotos são tratadas antes de impressas e o cliente conta com várias opções de tamanho e tipo de encadernação.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /> <br /> \r\n<table border="0" cellpadding="3" cellspacing="3" width="100%">\r\n<tbody>\r\n<tr>\r\n<td align="right" valign="top">\r\n<h3><strong>Making Of</strong></h3>\r\n</td>\r\n<td rowspan="2" align="right" valign="top" width="10%"><img alt="img_makingof" src="images/stories/img_makingof.png" height="250" width="169" /></td>\r\n</tr>\r\n<tr>\r\n<td align="right" valign="top">Um ensaio feito na praia, cidade ou campo. Fotos descontraídas e espontâneas capturadas de forma a manter a emoção do momento. Feitas para ocasiões especias como casamentos, as fotos são utilizadas para montagem de poster e clipes.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', '', 1, 0, 0, 0, '2010-09-12 21:00:10', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-09-12 21:00:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 14, 'robots=\nauthor='),
(9, 'Wander Von Muller', 'wander-von-muller', '', '<br />\r\n<p> </p>\r\n<p> </p>\r\n<p>Procuro contar história com as minhas fotografias as e as faço com muita paixão capturo o inusitado em cada sena que se segue busco a riqueza nos detalhes, com arte e emoção.</p>\r\n<p>A fotografia é arte, é a emoção de eternizar para sempre um momento espontâneo, é mais do que palavras, é o dom da percepção.</p>\r\n<p>Com conhecimento e técnica unidos a equipamentos tecnológicos adequados e uma boa equipe faço de cada serviço executado, uma excelência no resultado final para grande satisfação daquele que é a razão de minha existência como profissional O Cliente.</p>\r\n<p>Wander Von Muller&nbsp;</p>\r\n<p>BIOGRAFIA:</p>\r\n<p>O fotografo Wander Von Muller iniciou na atividade fotográfica aos 16 anos de idade no ano de 1990.</p>\r\n<p>Na cidade de Pato Branco sudoeste do Paraná/ e em São Lourenço do oeste interior do estado de Santa Catarina.</p>\r\n<p>Com uns dos mais bem sucedidos fotógrafos da época o Sr. Ney Veronense (Estúdio Ney Veronense). Na época especializada em book fotográfico e cobertura em eventos sociais.</p>\r\n<p>No ano de 1992 Mudei para Joinville onde permaneci por dois anos desenvolvendo trabalhos no seguimento fotográfico.</p>\r\n<p>Retornei ao sudoeste do Paraná onde tive a felicidade de trabalhar para uma das maiores e mais tradicional empresa fotográfica da região a foto Zanella, onde ganhei experiência a ampliei meu conhecimento e visão com relação ao mercado fotográfico.</p>\r\n<p>No ano de 1997 mudei definitivamente para Joinville onde permaneço desde então.</p>\r\n<p>Em Joinville, já fotografei em praticamente todos os clubes do simples ao belo São20 anos de trabalhos realizado em Santa Catarina e Paraná.</p>\r\n<p>Já vi e vivi de tudo momentos extraordinários e também tempos ruins.</p>\r\n<p>E se alguém me perguntasse hoje! Oque te move a ser um fotógrafo?</p>\r\n<p>- De Pronto responderia! Amor pelo oque faço, um amor que não acaba, paixão encantamento com oque o mundo da imagem pode proporcionar aos olhos do imaginário. Ter a possibilidade de criar perceber o inusitado na sena de um acontecimento.</p>\r\n<p>A fotografia pra mim é muito mais de que uma profissão é arte percepção técnica e conhecimento são estes os valores&nbsp;que fazem ser fotógrafo e ter optado pela fotografia como profissão.</p>', '', 1, 0, 0, 0, '2010-09-13 12:21:43', 62, '', '2011-01-12 14:10:18', 63, 0, '0000-00-00 00:00:00', '2010-09-13 12:21:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 2, '', '', 0, 35, 'robots=\nauthor='),
(10, 'Vilson Von Muller', 'vilson-von-muller', '', '<img width="200" src="images/stories/fotografo2.jpg" alt="fotografo2" height="150" style="margin: 6px; float: left;" />\r\n<p><span style="font-size: 18pt;">&nbsp;Vilson von muller.</span></p>\r\n<p><span style="font-size: 18pt;"></span>O fotografo Vilson Von Muller iniciou na fotografia no ano de 1996. Atualmente possui um no Hal de 15 anos dedicados a arte da fotografia profissional.</p>\r\n<p><span style="text-decoration: underline;"><a href="administrat"></a></span>&nbsp;</p>', '', 1, 0, 0, 0, '2010-09-13 12:21:43', 62, '', '2011-01-11 23:07:34', 63, 0, '0000-00-00 00:00:00', '2010-09-13 12:21:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 24, 'robots=\nauthor='),
(11, 'teste', 'teste', '', '<p>ygdufhjdhfljdshf</p>\r\n<p>bgfkjhhfajkdshfkl</p>', '', -2, 1, 0, 2, '2010-10-18 20:17:09', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2010-10-18 20:17:09', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'wander', 0),
(12, 'users', '64', 0, 'Silvana', 0),
(13, 'users', '65', 0, 'vini', 0),
(14, 'users', '66', 0, 'Leonardo Vicente', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10),
(25, '', 11),
(25, '', 12),
(25, '', 13),
(25, '', 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_extwebdav_locks`
--

CREATE TABLE IF NOT EXISTS `jos_extwebdav_locks` (
  `token` varchar(255) NOT NULL default '',
  `path` varchar(200) NOT NULL default '',
  `expires` int(11) NOT NULL default '0',
  `owner` varchar(200) default NULL,
  `recursive` int(11) default '0',
  `writelock` int(11) default '0',
  `exclusivelock` int(11) NOT NULL default '0',
  PRIMARY KEY  (`token`),
  UNIQUE KEY `token` (`token`),
  KEY `path` (`path`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_extwebdav_locks`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_extwebdav_properties`
--

CREATE TABLE IF NOT EXISTS `jos_extwebdav_properties` (
  `path` varchar(255) NOT NULL default '',
  `name` varchar(120) NOT NULL default '',
  `ns` varchar(120) NOT NULL default 'DAV:',
  `value` text,
  PRIMARY KEY  (`ns`(100),`path`(100),`name`(50)),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_extwebdav_properties`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_flippingbook_books`
--

CREATE TABLE IF NOT EXISTS `jos_flippingbook_books` (
  `id` int(11) NOT NULL auto_increment,
  `alias` text NOT NULL,
  `allow_pages_unload` tinyint(1) NOT NULL,
  `always_opened` tinyint(1) NOT NULL,
  `auto_flip_size` int(4) NOT NULL,
  `background_color` varchar(10) NOT NULL,
  `background_image` varchar(255) NOT NULL,
  `background_image_placement` varchar(10) NOT NULL,
  `book_height` varchar(6) NOT NULL,
  `book_width` varchar(6) NOT NULL,
  `category_id` int(6) NOT NULL,
  `center_book` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` int(11) NOT NULL default '0',
  `created` datetime NOT NULL,
  `description` text NOT NULL,
  `direction` varchar(6) NOT NULL,
  `download_size` varchar(100) NOT NULL,
  `download_title` varchar(100) NOT NULL,
  `download_url` varchar(255) NOT NULL,
  `dynamic_shadows_depth` varchar(5) NOT NULL,
  `emailIcon` tinyint(1) NOT NULL,
  `first_last_buttons` tinyint(1) NOT NULL,
  `first_page` int(4) NOT NULL,
  `flash_height` varchar(6) NOT NULL,
  `flash_width` varchar(6) NOT NULL,
  `flip_corner_style` varchar(20) NOT NULL,
  `frame_color` varchar(10) NOT NULL,
  `frame_width` int(4) NOT NULL,
  `fullscreen_enabled` tinyint(1) NOT NULL,
  `fullscreen_hint` text NOT NULL,
  `go_to_page_field` tinyint(1) NOT NULL,
  `hardcover` tinyint(1) NOT NULL,
  `hits` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `navigation_bar` varchar(255) NOT NULL,
  `navigation_bar_placement` varchar(10) NOT NULL,
  `new_window_height` int(4) NOT NULL,
  `new_window_width` int(4) NOT NULL,
  `open_book_in` int(4) NOT NULL,
  `ordering` int(6) NOT NULL,
  `page_background_color` varchar(10) NOT NULL,
  `preview_image` varchar(255) NOT NULL,
  `print_enabled` tinyint(1) NOT NULL,
  `printIcon` tinyint(1) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `scale_content` tinyint(1) NOT NULL,
  `show_book_description` tinyint(1) NOT NULL,
  `show_book_title` tinyint(1) NOT NULL,
  `show_pages_description` tinyint(1) NOT NULL,
  `show_slide_show_button` tinyint(4) NOT NULL,
  `show_zoom_hint` tinyint(1) NOT NULL,
  `slideshow_auto_play` tinyint(1) NOT NULL,
  `slideshow_button` tinyint(1) NOT NULL,
  `slideshow_display_duration` int(5) NOT NULL,
  `sound_control_button` int(1) NOT NULL,
  `static_shadows_depth` varchar(5) NOT NULL,
  `static_shadows_type` varchar(15) NOT NULL,
  `title` text NOT NULL,
  `transparent_pages` tinyint(1) NOT NULL,
  `zoom_enabled` tinyint(1) NOT NULL,
  `zoom_image_height` int(5) NOT NULL,
  `zoom_image_width` int(5) NOT NULL,
  `zoom_ui_color` varchar(10) NOT NULL,
  `zooming_method` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `jos_flippingbook_books`
--

INSERT INTO `jos_flippingbook_books` (`id`, `alias`, `allow_pages_unload`, `always_opened`, `auto_flip_size`, `background_color`, `background_image`, `background_image_placement`, `book_height`, `book_width`, `category_id`, `center_book`, `checked_out`, `checked_out_time`, `created`, `description`, `direction`, `download_size`, `download_title`, `download_url`, `dynamic_shadows_depth`, `emailIcon`, `first_last_buttons`, `first_page`, `flash_height`, `flash_width`, `flip_corner_style`, `frame_color`, `frame_width`, `fullscreen_enabled`, `fullscreen_hint`, `go_to_page_field`, `hardcover`, `hits`, `modified`, `navigation_bar`, `navigation_bar_placement`, `new_window_height`, `new_window_width`, `open_book_in`, `ordering`, `page_background_color`, `preview_image`, `print_enabled`, `printIcon`, `published`, `scale_content`, `show_book_description`, `show_book_title`, `show_pages_description`, `show_slide_show_button`, `show_zoom_hint`, `slideshow_auto_play`, `slideshow_button`, `slideshow_display_duration`, `sound_control_button`, `static_shadows_depth`, `static_shadows_type`, `title`, `transparent_pages`, `zoom_enabled`, `zoom_image_height`, `zoom_image_width`, `zoom_ui_color`, `zooming_method`) VALUES
(1, 'book-de-ana-maria', 0, 0, 75, '202020', '', 'fit', '400', '300', 1, 1, 0, 0, '2009-01-01 00:00:00', 'Book de muito bom gosto mostrando a feminilidade da mulher feminina.', 'LTR', '', '', '', '2', 0, 1, 1, '500', '100%', 'manually', 'FFFFFF', 0, 1, 'Tela cheia', 0, 1, 67, '2010-09-11 20:17:51', 'navigation.swf', 'bottom', 640, 640, 1, 1, '202020', 'book1.jpg', 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 5000, 0, '1', 'Asymmetric', 'Book de Ana Maria', 0, 0, 800, 600, '8f9ea6', 0),
(3, 'book-de-bruna', 0, 0, 75, '202020', '', 'fit', '400', '300', 2, 1, 0, 0, '2010-09-11 22:04:45', 'Book de muito bom gosto mostrando a feminilidade da mulher feminina.', 'LTR', '', '', '', '2', 0, 1, 1, '500', '100%', 'manually', 'FFFFFF', 0, 1, 'Tela cheia', 0, 1, 39, '2010-09-11 22:07:02', 'navigation.swf', 'bottom', 640, 640, 1, 1, '202020', 'gestante.jpg', 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 5000, 0, '1', 'Asymmetric', 'Book de Bruna', 0, 0, 800, 600, '8f9ea6', 0),
(5, 'franciele', 0, 0, 75, '202020', '', 'fit', '400', '300', 4, 1, 0, 0, '2011-01-20 22:17:07', 'Book de muito bom gosto mostrando a feminilidade da mulher feminina.', 'LTR', '', '', '', '2', 0, 1, 1, '500', '100%', 'manually', 'FFFFFF', 0, 1, 'Tela cheia', 0, 1, 69, '2011-01-20 22:18:40', 'navigation.swf', 'bottom', 640, 640, 1, 1, '202020', 'infantil.jpg', 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 5000, 0, '1', 'Asymmetric', 'Franciele', 0, 0, 800, 600, '8f9ea6', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_flippingbook_categories`
--

CREATE TABLE IF NOT EXISTS `jos_flippingbook_categories` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `alias` text NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `ordering` int(6) NOT NULL,
  `checked_out_time` int(11) NOT NULL default '0',
  `checked_out` int(11) NOT NULL,
  `emailIcon` tinyint(1) NOT NULL,
  `printIcon` tinyint(1) NOT NULL,
  `columns` int(2) NOT NULL,
  `preview_image` text NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `jos_flippingbook_categories`
--

INSERT INTO `jos_flippingbook_categories` (`id`, `title`, `alias`, `description`, `published`, `ordering`, `checked_out_time`, `checked_out`, `emailIcon`, `printIcon`, `columns`, `preview_image`, `show_title`) VALUES
(1, 'Femininos', 'femininos', 'Books Fotográficos Femininos<br />', 1, 1, 0, 0, 0, 0, 2, 'feminino.jpg', 0),
(2, 'Gestantes', 'gestantes', 'Books Fotográficos de Gestantes', 1, 4, 0, 0, 0, 0, 1, 'gestante.jpg', 0),
(3, 'Sensual', 'sensual', '', 0, 2, 0, 0, 0, 0, 1, 'feminino.jpg', 0),
(4, 'Infantil', 'infantil', 'Book fotografico infantil', 1, 3, 0, 0, 0, 0, 1, 'infantil.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_flippingbook_config`
--

CREATE TABLE IF NOT EXISTS `jos_flippingbook_config` (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Extraindo dados da tabela `jos_flippingbook_config`
--

INSERT INTO `jos_flippingbook_config` (`id`, `name`, `value`) VALUES
(1, 'categoryListTitle', ''),
(2, 'closeSpeed', '3'),
(3, 'columns', '3'),
(4, 'downloadComplete', 'Completo'),
(5, 'dropShadowEnabled', '1'),
(6, 'emailIcon', '0'),
(7, 'flipSound', 'newspaper.mp3'),
(8, 'gotoSpeed', '3'),
(9, 'hardcoverSound', 'photo_album.mp3'),
(10, 'moveSpeed', '2'),
(11, 'preloaderType', 'Progress Bar'),
(12, 'printIcon', '0'),
(13, 'printTitle', 'Imprimir+paginas'),
(14, 'rigidPageSpeed', '5'),
(15, 'theme', 'clear.css'),
(16, 'zoomHint', 'Clique+2x+para+Zoom'),
(17, 'zoomOnClick', '1'),
(18, 'version', '1.5.10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_flippingbook_pages`
--

CREATE TABLE IF NOT EXISTS `jos_flippingbook_pages` (
  `id` int(11) NOT NULL auto_increment,
  `file` varchar(255) NOT NULL,
  `book_id` int(4) NOT NULL default '0',
  `description` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '1',
  `link_url` text NOT NULL,
  `zoom_url` text NOT NULL,
  `zoom_height` int(4) NOT NULL default '800',
  `zoom_width` int(4) NOT NULL default '600',
  `checked_out_time` int(11) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- Extraindo dados da tabela `jos_flippingbook_pages`
--

INSERT INTO `jos_flippingbook_pages` (`id`, `file`, `book_id`, `description`, `ordering`, `published`, `link_url`, `zoom_url`, `zoom_height`, `zoom_width`, `checked_out_time`, `checked_out`) VALUES
(105, 'gestante/gestante_11.jpg', 3, '', 12, 1, '', '', 800, 600, 0, 0),
(106, 'gestante/gestante_12.jpg', 3, '', 13, 1, '', '', 800, 600, 0, 0),
(107, 'gestante/gestante_13.jpg', 3, '', 14, 1, '', '', 800, 600, 0, 0),
(108, 'gestante/gestante_14.jpg', 3, '', 15, 1, '', '', 800, 600, 0, 0),
(109, 'gestante/gestante_15.jpg', 3, '', 16, 1, '', '', 800, 600, 0, 0),
(100, 'gestante/gestante_06.jpg', 3, '', 7, 1, '', '', 800, 600, 0, 0),
(101, 'gestante/gestante_07.jpg', 3, '', 8, 1, '', '', 800, 600, 0, 0),
(102, 'gestante/gestante_08.jpg', 3, '', 9, 1, '', '', 800, 600, 0, 0),
(103, 'gestante/gestante_09.jpg', 3, '', 10, 1, '', '', 800, 600, 0, 0),
(104, 'gestante/gestante_10.jpg', 3, '', 11, 1, '', '', 800, 600, 0, 0),
(91, 'ana/ana_36.jpg', 1, '', 38, 1, '', '', 800, 600, 0, 0),
(92, 'ana/ana_37.jpg', 1, '', 39, 1, '', '', 800, 600, 0, 0),
(93, 'capa_book1.jpg', 1, '', 3, 1, '', '', 800, 600, 0, 0),
(94, 'capa_book2.jpg', 1, '', 40, 1, '', '', 800, 600, 0, 0),
(96, 'gestante/gestante_02.jpg', 3, '', 3, 1, '', '', 800, 600, 0, 0),
(97, 'gestante/gestante_03.jpg', 3, '', 4, 1, '', '', 800, 600, 0, 0),
(98, 'gestante/gestante_04.jpg', 3, '', 5, 1, '', '', 800, 600, 0, 0),
(99, 'gestante/gestante_05.jpg', 3, '', 6, 1, '', '', 800, 600, 0, 0),
(79, 'ana/ana_24.jpg', 1, '', 26, 1, '', '', 800, 600, 0, 0),
(80, 'ana/ana_25.jpg', 1, '', 27, 1, '', '', 800, 600, 0, 0),
(81, 'ana/ana_26.jpg', 1, '', 28, 1, '', '', 800, 600, 0, 0),
(82, 'ana/ana_27.jpg', 1, '', 29, 1, '', '', 800, 600, 0, 0),
(83, 'ana/ana_28.jpg', 1, '', 30, 1, '', '', 800, 600, 0, 0),
(84, 'ana/ana_29.jpg', 1, '', 31, 1, '', '', 800, 600, 0, 0),
(85, 'ana/ana_30.jpg', 1, '', 32, 1, '', '', 800, 600, 0, 0),
(86, 'ana/ana_31.jpg', 1, '', 33, 1, '', '', 800, 600, 0, 0),
(87, 'ana/ana_32.jpg', 1, '', 34, 1, '', '', 800, 600, 0, 0),
(88, 'ana/ana_33.jpg', 1, '', 35, 1, '', '', 800, 600, 0, 0),
(89, 'ana/ana_34.jpg', 1, '', 36, 1, '', '', 800, 600, 0, 0),
(90, 'ana/ana_35.jpg', 1, '', 37, 1, '', '', 800, 600, 0, 0),
(77, 'ana/ana_22.jpg', 1, '', 24, 1, '', '', 800, 600, 0, 0),
(78, 'ana/ana_23.jpg', 1, '', 25, 1, '', '', 800, 600, 0, 0),
(76, 'ana/ana_21.jpg', 1, '', 23, 1, '', '', 800, 600, 0, 0),
(75, 'ana/ana_20.jpg', 1, '', 22, 1, '', '', 800, 600, 0, 0),
(74, 'ana/ana_19.jpg', 1, '', 21, 1, '', '', 800, 600, 0, 0),
(56, 'ana/ana_01.jpg', 1, '', 4, 1, '', '', 800, 600, 0, 0),
(57, 'ana/ana_02.jpg', 1, '', 5, 1, '', '', 800, 600, 0, 0),
(58, 'ana/ana_03.jpg', 1, '', 6, 1, '', '', 800, 600, 0, 0),
(59, 'ana/ana_04.jpg', 1, '', 7, 1, '', '', 800, 600, 0, 0),
(60, 'ana/ana_05.jpg', 1, '', 8, 1, '', '', 800, 600, 0, 0),
(61, 'ana/ana_06.jpg', 1, '', 9, 1, '', '', 800, 600, 0, 0),
(62, 'ana/ana_07.jpg', 1, '', 10, 1, '', '', 800, 600, 0, 0),
(63, 'ana/ana_08.jpg', 1, '', 11, 1, '', '', 800, 600, 0, 0),
(64, 'ana/ana_09.jpg', 1, '', 12, 1, '', '', 800, 600, 0, 0),
(65, 'ana/ana_10.jpg', 1, '', 13, 1, '', '', 800, 600, 0, 0),
(66, 'ana/ana_11.jpg', 1, '', 14, 1, '', '', 800, 600, 0, 0),
(67, 'ana/ana_12.jpg', 1, '', 15, 1, '', '', 800, 600, 0, 0),
(95, 'gestante/gestante_01.jpg', 3, '', 2, 1, '', '', 800, 600, 0, 0),
(69, 'ana/ana_14.jpg', 1, '', 16, 1, '', '', 800, 600, 0, 0),
(70, 'ana/ana_15.jpg', 1, '', 17, 1, '', '', 800, 600, 0, 0),
(71, 'ana/ana_16.jpg', 1, '', 18, 1, '', '', 800, 600, 0, 0),
(72, 'ana/ana_17.jpg', 1, '', 19, 1, '', '', 800, 600, 0, 0),
(73, 'ana/ana_18.jpg', 1, '', 20, 1, '', '', 800, 600, 0, 0),
(155, 'franciele/img_29.jpg', 5, '', 30, 1, '', '', 800, 600, 0, 0),
(110, 'gestante/gestante_16.jpg', 3, '', 17, 1, '', '', 800, 600, 0, 0),
(154, 'franciele/img_28.jpg', 5, '', 29, 1, '', '', 800, 600, 0, 0),
(153, 'franciele/img_27.jpg', 5, '', 28, 1, '', '', 800, 600, 0, 0),
(152, 'franciele/img_26.jpg', 5, '', 27, 1, '', '', 800, 600, 0, 0),
(151, 'franciele/img_25.jpg', 5, '', 26, 1, '', '', 800, 600, 0, 0),
(150, 'franciele/img_24.jpg', 5, '', 25, 1, '', '', 800, 600, 0, 0),
(149, 'franciele/img_23.jpg', 5, '', 24, 1, '', '', 800, 600, 0, 0),
(138, 'franciele/img_12.jpg', 5, '', 13, 1, '', '', 800, 600, 0, 0),
(139, 'franciele/img_13.jpg', 5, '', 14, 1, '', '', 800, 600, 0, 0),
(144, 'franciele/img_18.jpg', 5, '', 19, 1, '', '', 800, 600, 0, 0),
(143, 'franciele/img_17.jpg', 5, '', 18, 1, '', '', 800, 600, 0, 0),
(140, 'franciele/img_14.jpg', 5, '', 15, 1, '', '', 800, 600, 0, 0),
(135, 'franciele/img_09.jpg', 5, '', 10, 1, '', '', 800, 600, 0, 0),
(133, 'franciele/img_07.jpg', 5, '', 8, 1, '', '', 800, 600, 0, 0),
(134, 'franciele/img_08.jpg', 5, '', 9, 1, '', '', 800, 600, 0, 0),
(131, 'franciele/img_05.jpg', 5, '', 6, 1, '', '', 800, 600, 0, 0),
(132, 'franciele/img_06.jpg', 5, '', 7, 1, '', '', 800, 600, 0, 0),
(148, 'franciele/img_22.jpg', 5, '', 23, 1, '', '', 800, 600, 0, 0),
(147, 'franciele/img_21.jpg', 5, '', 22, 1, '', '', 800, 600, 0, 0),
(146, 'franciele/img_20.jpg', 5, '', 21, 1, '', '', 800, 600, 0, 0),
(145, 'franciele/img_19.jpg', 5, '', 20, 1, '', '', 800, 600, 0, 0),
(142, 'franciele/img_16.jpg', 5, '', 17, 1, '', '', 800, 600, 0, 0),
(141, 'franciele/img_15.jpg', 5, '', 16, 1, '', '', 800, 600, 0, 0),
(137, 'franciele/img_11.jpg', 5, '', 12, 1, '', '', 800, 600, 0, 0),
(136, 'franciele/img_10.jpg', 5, '', 11, 1, '', '', 800, 600, 0, 0),
(111, 'gestante/gestante_17.jpg', 3, '', 18, 1, '', '', 800, 600, 0, 0),
(112, 'gestante/gestante_18.jpg', 3, '', 19, 1, '', '', 800, 600, 0, 0),
(113, 'gestante/gestante_19.jpg', 3, '', 20, 1, '', '', 800, 600, 0, 0),
(114, 'gestante/gestante_20.jpg', 3, '', 21, 1, '', '', 800, 600, 0, 0),
(115, 'gestante/gestante_21.jpg', 3, '', 22, 1, '', '', 800, 600, 0, 0),
(116, 'gestante/gestante_22.jpg', 3, '', 23, 1, '', '', 800, 600, 0, 0),
(117, 'gestante/gestante_23.jpg', 3, '', 24, 1, '', '', 800, 600, 0, 0),
(118, 'gestante/gestante_24.jpg', 3, '', 25, 1, '', '', 800, 600, 0, 0),
(119, 'capa_book1.jpg', 3, '', 1, 1, '', '', 800, 600, 0, 0),
(120, 'capa_book2.jpg', 3, '', 26, 1, '', '', 800, 600, 0, 0),
(121, 'capa_book1.jpg', 1, '', 2, 1, '', '', 800, 600, 0, 0),
(122, 'capa_book1.jpg', 1, '', 1, 1, '', '', 800, 600, 0, 0),
(130, 'franciele/img_04.jpg', 5, '', 5, 1, '', '', 800, 600, 0, 0),
(129, 'franciele/img_03.jpg', 5, '', 4, 1, '', '', 800, 600, 0, 0),
(128, 'franciele/img_02.jpg', 5, '', 3, 1, '', '', 800, 600, 0, 0),
(127, 'franciele/img_01.jpg', 5, '', 2, 1, '', '', 800, 600, 0, 0),
(156, 'franciele/img_30.jpg', 5, '', 31, 1, '', '', 800, 600, 0, 0),
(157, 'franciele/img_31.jpg', 5, '', 32, 1, '', '', 800, 600, 0, 0),
(158, 'franciele/img_32.jpg', 5, '', 33, 1, '', '', 800, 600, 0, 0),
(159, 'franciele/img_33.jpg', 5, '', 34, 1, '', '', 800, 600, 0, 0),
(160, 'franciele/img_34.jpg', 5, '', 35, 1, '', '', 800, 600, 0, 0),
(161, 'franciele/img_35.jpg', 5, '', 36, 1, '', '', 800, 600, 0, 0),
(162, 'franciele/img_36.jpg', 5, '', 37, 1, '', '', 800, 600, 0, 0),
(163, 'franciele/img_37.jpg', 5, '', 38, 1, '', '', 800, 600, 0, 0),
(164, 'franciele/img_38.jpg', 5, '', 39, 1, '', '', 800, 600, 0, 0),
(165, 'franciele/img_39.jpg', 5, '', 40, 1, '', '', 800, 600, 0, 0),
(166, 'franciele/img_40.jpg', 5, '', 41, 1, '', '', 800, 600, 0, 0),
(167, 'franciele/img_41.jpg', 5, '', 42, 1, '', '', 800, 600, 0, 0),
(168, 'franciele/img_42.jpg', 5, '', 43, 1, '', '', 800, 600, 0, 0),
(169, 'franciele/img_43.jpg', 5, '', 44, 1, '', '', 800, 600, 0, 0),
(170, 'franciele/img_44.jpg', 5, '', 45, 1, '', '', 800, 600, 0, 0),
(171, 'franciele/img_45.jpg', 5, '', 46, 1, '', '', 800, 600, 0, 0),
(172, 'franciele/img_46.jpg', 5, '', 47, 1, '', '', 800, 600, 0, 0),
(173, 'capa_book1.jpg', 5, '', 1, 1, '', '', 800, 600, 0, 0),
(174, 'capa_book2.jpg', 5, '', 48, 1, '', '', 800, 600, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_jce_groups`
--

CREATE TABLE IF NOT EXISTS `jos_jce_groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `types` varchar(255) NOT NULL,
  `components` text NOT NULL,
  `rows` text NOT NULL,
  `plugins` varchar(255) NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `jos_jce_groups`
--

INSERT INTO `jos_jce_groups` (`id`, `name`, `description`, `users`, `types`, `components`, `rows`, `plugins`, `published`, `ordering`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Default', 'Default group for all users with edit access', '', '19,20,21,23,24,25', '', '6,7,8,9,10,11,12,13,14,15,16,17,18,19;20,21,22,23,24,25,26,27,28,30,31,32,35,47;36,37,38,39,40,41,42,43,44,45,46;48,49,50,51,52,53,54,56,57', '1,2,3,4,5,6,20,21,36,37,38,39,40,41,48,49,50,51,52,53,54,56,57', 1, 1, 0, '0000-00-00 00:00:00', ''),
(2, 'Front End', 'Sample Group for Authors, Editors, Publishers', '', '19,20,21', '', '6,7,8,9,10,13,14,15,16,17,18,19,27,28;20,21,25,26,30,31,35,42,43,44,46,47,49,50;24,32,38,39,41,45,48,51,52,53,54,56,57', '6,20,21,49,50,1,3,5,38,39,41,48,51,52,53,54,56,57', 0, 2, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_jce_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_jce_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `row` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(3) NOT NULL,
  `editable` tinyint(3) NOT NULL,
  `iscore` tinyint(3) NOT NULL,
  `elements` varchar(255) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `plugin` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Extraindo dados da tabela `jos_jce_plugins`
--

INSERT INTO `jos_jce_plugins` (`id`, `title`, `name`, `type`, `icon`, `layout`, `row`, `ordering`, `published`, `editable`, `iscore`, `elements`, `checked_out`, `checked_out_time`) VALUES
(1, 'Context Menu', 'contextmenu', 'plugin', '', '', 0, 0, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(2, 'File Browser', 'browser', 'plugin', '', '', 0, 0, 1, 1, 1, '', 0, '0000-00-00 00:00:00'),
(3, 'Inline Popups', 'inlinepopups', 'plugin', '', '', 0, 0, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(4, 'Media Support', 'media', 'plugin', '', '', 0, 0, 1, 1, 1, '', 0, '0000-00-00 00:00:00'),
(5, 'Safari Browser Support', 'safari', 'plugin', '', '', 0, 0, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(6, 'Help', 'help', 'plugin', 'help', 'help', 1, 1, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(7, 'New Document', 'newdocument', 'command', 'newdocument', 'newdocument', 1, 2, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(8, 'Bold', 'bold', 'command', 'bold', 'bold', 1, 3, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(9, 'Italic', 'italic', 'command', 'italic', 'italic', 1, 4, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(10, 'Underline', 'underline', 'command', 'underline', 'underline', 1, 5, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(11, 'Font Select', 'fontselect', 'command', 'fontselect', 'fontselect', 1, 6, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(12, 'Font Size Select', 'fontsizeselect', 'command', 'fontsizeselect', 'fontsizeselect', 1, 7, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(13, 'Style Select', 'styleselect', 'command', 'styleselect', 'styleselect', 1, 8, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(14, 'StrikeThrough', 'strikethrough', 'command', 'strikethrough', 'strikethrough', 1, 9, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(15, 'Justify Full', 'full', 'command', 'justifyfull', 'justifyfull', 1, 10, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(16, 'Justify Center', 'center', 'command', 'justifycenter', 'justifycenter', 1, 11, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(17, 'Justify Left', 'left', 'command', 'justifyleft', 'justifyleft', 1, 12, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(18, 'Justify Right', 'right', 'command', 'justifyright', 'justifyright', 1, 13, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(19, 'Format Select', 'formatselect', 'command', 'formatselect', 'formatselect', 1, 14, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(20, 'Paste', 'paste', 'plugin', 'cut,copy,paste', 'paste', 2, 1, 1, 1, 1, '', 0, '0000-00-00 00:00:00'),
(21, 'Search Replace', 'searchreplace', 'plugin', 'search,replace', 'searchreplace', 2, 2, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(22, 'Font ForeColour', 'forecolor', 'command', 'forecolor', 'forecolor', 2, 3, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(23, 'Font BackColour', 'backcolor', 'command', 'backcolor', 'backcolor', 2, 4, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(24, 'Unlink', 'unlink', 'command', 'unlink', 'unlink', 2, 5, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(25, 'Indent', 'indent', 'command', 'indent', 'indent', 2, 6, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(26, 'Outdent', 'outdent', 'command', 'outdent', 'outdent', 2, 7, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(27, 'Undo', 'undo', 'command', 'undo', 'undo', 2, 8, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(28, 'Redo', 'redo', 'command', 'redo', 'redo', 2, 9, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(29, 'HTML', 'html', 'command', 'code', 'code', 2, 10, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(30, 'Numbered List', 'numlist', 'command', 'numlist', 'numlist', 2, 11, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(31, 'Bullet List', 'bullist', 'command', 'bullist', 'bullist', 2, 12, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(32, 'Anchor', 'anchor', 'command', 'anchor', 'anchor', 2, 13, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(33, 'Image', 'image', 'command', 'image', 'image', 2, 14, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(34, 'Link', 'link', 'command', 'link', 'link', 2, 15, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(35, 'Code Cleanup', 'cleanup', 'command', 'cleanup', 'cleanup', 2, 16, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(36, 'Directionality', 'directionality', 'plugin', 'ltr,rtl', 'directionality', 3, 1, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(37, 'Emotions', 'emotions', 'plugin', 'emotions', 'emotions', 3, 2, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(38, 'Fullscreen', 'fullscreen', 'plugin', 'fullscreen', 'fullscreen', 3, 3, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(39, 'Preview', 'preview', 'plugin', 'preview', 'preview', 3, 4, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(40, 'Tables', 'table', 'plugin', 'tablecontrols', 'buttons', 3, 5, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(41, 'Print', 'print', 'plugin', 'print', 'print', 3, 6, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(42, 'Horizontal Rule', 'hr', 'command', 'hr', 'hr', 3, 7, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(43, 'Subscript', 'sub', 'command', 'sub', 'sub', 3, 8, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(44, 'Superscript', 'sup', 'command', 'sup', 'sup', 3, 9, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(45, 'Visual Aid', 'visualaid', 'command', 'visualaid', 'visualaid', 3, 10, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(46, 'Character Map', 'charmap', 'command', 'charmap', 'charmap', 3, 11, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(47, 'Remove Format', 'removeformat', 'command', 'removeformat', 'removeformat', 2, 1, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(48, 'Styles', 'style', 'plugin', 'styleprops', 'style', 4, 1, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(49, 'Non-Breaking', 'nonbreaking', 'plugin', 'nonbreaking', 'nonbreaking', 4, 2, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(50, 'Visual Characters', 'visualchars', 'plugin', 'visualchars', 'visualchars', 4, 3, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(51, 'XHTML Xtras', 'xhtmlxtras', 'plugin', 'cite,abbr,acronym,del,ins,attribs', 'xhtmlxtras', 4, 4, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(52, 'Image Manager', 'imgmanager', 'plugin', 'imgmanager', 'imgmanager', 4, 5, 1, 1, 1, '', 0, '0000-00-00 00:00:00'),
(53, 'Advanced Link', 'advlink', 'plugin', 'advlink', 'advlink', 4, 6, 1, 1, 1, '', 0, '0000-00-00 00:00:00'),
(54, 'Spell Checker', 'spellchecker', 'plugin', 'spellchecker', 'spellchecker', 4, 7, 1, 1, 1, '', 0, '0000-00-00 00:00:00'),
(55, 'Layers', 'layer', 'plugin', 'insertlayer,moveforward,movebackward,absolute', 'layer', 4, 8, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(56, 'Advanced Code Editor', 'advcode', 'plugin', 'advcode', 'advcode', 4, 9, 1, 0, 1, '', 0, '0000-00-00 00:00:00'),
(57, 'Article Breaks', 'article', 'plugin', 'readmore,pagebreak', 'article', 4, 10, 1, 0, 1, '', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'A Empresa', 'a-empresa', 'index.php?option=com_content&view=article&id=6', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'mainmenu', 'A Equipe', 'a-equipe', '', 'separator', 1, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(4, 'mainmenu', 'Contato', 'contato', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 0, 7, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_contact_list=0\nshow_category_crumb=0\ncontact_icons=\nicon_address=\nicon_email=\nicon_telephone=\nicon_mobile=\nicon_fax=\nicon_misc=\nshow_headings=\nshow_position=\nshow_email=\nshow_telephone=\nshow_mobile=\nshow_fax=\nallow_vcard=\nbanned_email=\nbanned_subject=\nbanned_text=\nvalidate_session=\ncustom_reply=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(5, 'mainmenu', 'Eventos', 'eventos', 'index.php?option=com_phocagallery&view=categories', 'component', 1, 0, 56, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'image=-1\nimage_align=right\nshow_pagination_categories=0\nshow_pagination_category=1\nshow_pagination_limit_categories=0\nshow_pagination_limit_category=1\ndisplay_cat_name_title=1\ncategories_columns=\nequal_percentage_width=\ndisplay_image_categories=\ncategories_box_width=\nimage_categories_size=\ncategories_image_ordering=\ncategories_display_avatar=\ndisplay_subcategories=\ndisplay_empty_categories=\nhide_categories=9\nshow_categories=\ndisplay_access_category=\ndefault_pagination_categories=\npagination_categories=\nfont_color=\nbackground_color=\nbackground_color_hover=\nimage_background_color=\nimage_background_shadow=\nborder_color=\nborder_color_hover=\nmargin_box=\npadding_box=\ndisplay_new=\ndisplay_hot=\ndisplay_name=\ndisplay_icon_detail=\ndisplay_icon_download=\ndisplay_icon_folder=\nfont_size_name=\nchar_length_name=\ncategory_box_space=\ndisplay_categories_sub=\ndisplay_subcat_page=\ndisplay_category_icon_image=\ncategory_image_ordering=\ndisplay_back_button=\ndisplay_categories_back_button=\ndefault_pagination_category=\npagination_category=\ndisplay_img_desc_box=\nfont_size_img_desc=\nimg_desc_box_height=\nchar_length_img_desc=\ndisplay_categories_cv=\ndisplay_subcat_page_cv=\ndisplay_category_icon_image_cv=\ncategory_image_ordering_cv=\ndisplay_back_button_cv=\ndisplay_categories_back_button_cv=\ncategories_columns_cv=\ndisplay_image_categories_cv=\nimage_categories_size_cv=\ndetail_window=\ndetail_window_background_color=\nmodal_box_overlay_color=\nmodal_box_overlay_opacity=\nmodal_box_border_color=\nmodal_box_border_width=\nsb_slideshow_delay=\nsb_lang=\nhighslide_class=\nhighslide_opacity=\nhighslide_outline_type=\nhighslide_fullimg=\nhighslide_close_button=\nhighslide_slideshow=\njak_slideshow_delay=\njak_orientation=\njak_description=\njak_description_height=\ndisplay_description_detail=\ndisplay_title_description=\nfont_size_desc=\nfont_color_desc=\ndescription_detail_height=\ndescription_lightbox_font_size=\ndescription_lightbox_font_color=\ndescription_lightbox_bg_color=\nslideshow_delay=\nslideshow_pause=\nslideshow_random=\ndetail_buttons=\nphocagallery_width=\nphocagallery_center=\ncategory_ordering=6\nimage_ordering=\ngallery_metadesc=\ngallery_metakey=\nalt_value=\nenable_user_cp=\nenable_upload_avatar=\nenable_avatar_approve=\nenable_usercat_approve=\nenable_usersubcat_approve=\nuser_subcat_count=\nmax_create_cat_char=\nenable_userimage_approve=\nmax_upload_char=\nupload_maxsize=\nupload_maxres_width=\nupload_maxres_height=\nuser_images_max_size=\nenable_java=\nenable_java_admin=\njava_resize_width=\njava_resize_height=\njava_box_width=\njava_box_height=\ndisplay_rating=\ndisplay_rating_img=\ndisplay_comment=\ndisplay_comment_img=\ncomment_width=\nmax_comment_char=\nexternal_comment_system=\nenable_piclens=\nstart_piclens=\npiclens_image=\nswitch_image=\nswitch_width=\nswitch_height=\nswitch_fixed_size=\nenable_overlib=\nol_bg_color=\nol_fg_color=\nol_tf_color=\nol_cf_color=\noverlib_overlay_opacity=\noverlib_image_rate=\ncreate_watermark=\nwatermark_position_x=\nwatermark_position_y=\ndisplay_icon_vm=\ndisplay_category_statistics=\ndisplay_main_cat_stat=\ndisplay_lastadded_cat_stat=\ncount_lastadded_cat_stat=\ndisplay_mostviewed_cat_stat=\ncount_mostviewed_cat_stat=\ndisplay_camera_info=\nexif_information=\ndisplay_categories_geotagging=\ncategories_lng=\ncategories_lat=\ncategories_zoom=\ncategories_map_width=\ncategories_map_height=\ndisplay_icon_geotagging=\ndisplay_category_geotagging=\ncategory_map_width=\ncategory_map_height=\npagination_thumbnail_creation=\nclean_thumbnails=\nenable_thumb_creation=\ncrop_thumbnail=\njpeg_quality=\nenable_picasa_loading=\npicasa_load_pagination=\nicon_format=\nlarge_image_width=\nlarge_image_height=\nmedium_image_width=\nmedium_image_height=\nsmall_image_width=\nsmall_image_height=\nfront_modal_box_width=\nfront_modal_box_height=\nadmin_modal_box_width=\nadmin_modal_box_height=\nfolder_permissions=\njfile_thumbs=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(6, 'mainmenu', 'Books Fotográficos', 'books-fotograficos', 'index.php?option=com_flippingbook&view=categories', 'component', 1, 0, 67, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(10, 'mainmenu', 'Produtos', 'produtos', 'index.php?option=com_content&view=article&id=7', 'component', 1, 2, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=\npage_title=Produtos\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'mainmenu', 'Serviços', 'servicos', 'index.php?option=com_content&view=article&id=8', 'component', 1, 2, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=\npage_title=Produtos\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(12, 'mainmenu', 'Wander Von Muller', 'wander-von-muller', 'index.php?option=com_content&view=article&id=9', 'component', 1, 3, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(13, 'mainmenu', 'Vilson Von Muller', 'vilson-von-muller', 'index.php?option=com_content&view=article&id=10', 'component', 1, 3, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(7, 'mainmenu', 'Vilson Von Muller', 'vilson-von-muller', '', 'url', -2, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(8, 'mainmenu', 'Wander Von Muller', 'wander-von-muller', 'index.php?option=com_content&view=article&id=9', 'component', -2, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(9, 'mainmenu', 'Blog', 'blog', 'index.php?option=com_content&view=category&layout=blog&id=2', 'component', 1, 0, 20, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=1\nnum_links=0\norderby_pri=order\norderby_sec=rdate\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=1\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=Blog\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(14, 'mainmenu', 'Portfólio', 'portfolio', 'index.php?option=com_content&view=article&id=14', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_messages`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(22, 'Slideshow', '', 0, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_lofpiecemaker', 0, 0, 0, 'theme=basic\nmodule_height=330\nmodule_width=960\nmain_height=280\nmain_width=820\ngroup=image\nlof_added_time=1287676985\nimage_folder=images/slides\nimage_category=0\nimage_ordering=\nlimit_items=5\nautoplay=1\nduration=1.0\ntween_delay=1\neffect=easeInOutExpo\ncache_time=30\nauto_renderthumb=1\nauto_strip_tags=1\nopen_target=_parent\nmoduleclass_sfx=\ninner_bg=111111\ntext_bg=031933\nexpand=20\nsegments=7\nshadow=100\ntext_distance=25\nz_distance=0\n\n', 0, 0, ''),
(17, 'Rodapé', '<center>Rua Augusto Schimidt, 195 - Floresta - Joinville - Santa Catarina | Telefone: (47) 3465-2943 / (47) 3028-2943<br />Desenvolvido por <a href="http://www.devhouse.com.br" target="_blank">DevHouse</a></center>', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 0, 'moduleclass_sfx=\n\n', 0, 0, ''),
(18, 'Navegação', '', 0, 'breadcrumbs', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 0, 'showHome=1\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 0, 0, ''),
(19, 'Anúncios', '<img alt="parceiro1" src="images/stories/parceiro1.jpg" width="176" height="209" /><br /><br /><img alt="parceiro2" src="images/stories/parceiro2.jpg" width="176" height="148" /><br /><br /><img alt="parceiro3" src="images/stories/parceiro3.jpg" width="176" height="144" /><br />', 0, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(20, 'Enquete', '', 1, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_poll', 0, 0, 1, 'id=1\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(17, 0),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(18, 9),
(18, 10),
(18, 11),
(18, 12),
(18, 13),
(19, 2),
(19, 3),
(19, 4),
(19, 9),
(19, 10),
(19, 11),
(19, 12),
(19, 13),
(20, 2),
(20, 3),
(20, 4),
(20, 9),
(20, 10),
(20, 11),
(20, 12),
(20, 13),
(22, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `filename` varchar(250) NOT NULL default '',
  `description` text,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `latitude` varchar(20) NOT NULL default '',
  `longitude` varchar(20) NOT NULL default '',
  `zoom` int(3) NOT NULL default '0',
  `geotitle` varchar(255) NOT NULL default '',
  `videocode` text,
  `vmproductid` int(11) NOT NULL default '0',
  `imgorigsize` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `extlink1` text,
  `extlink2` text,
  `extid` varchar(255) NOT NULL default '',
  `extl` varchar(255) NOT NULL default '',
  `extm` varchar(255) NOT NULL default '',
  `exts` varchar(255) NOT NULL default '',
  `exto` varchar(255) NOT NULL default '',
  `extw` varchar(255) NOT NULL default '',
  `exth` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=395 ;

--
-- Extraindo dados da tabela `jos_phocagallery`
--

INSERT INTO `jos_phocagallery` (`id`, `catid`, `sid`, `title`, `alias`, `filename`, `description`, `date`, `hits`, `latitude`, `longitude`, `zoom`, `geotitle`, `videocode`, `vmproductid`, `imgorigsize`, `published`, `approved`, `checked_out`, `checked_out_time`, `ordering`, `params`, `metakey`, `metadesc`, `extlink1`, `extlink2`, `extid`, `extl`, `extm`, `exts`, `exto`, `extw`, `exth`) VALUES
(240, 7, 0, '01 28', '01-28', 'KarinaeGlauber/01 28.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 116980, 1, 1, 0, '0000-00-00 00:00:00', 27, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(239, 7, 0, '01 27', '01-27', 'KarinaeGlauber/01 27.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 132376, 1, 1, 0, '0000-00-00 00:00:00', 26, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(238, 7, 0, '01 26', '01-26', 'KarinaeGlauber/01 26.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 98703, 1, 1, 0, '0000-00-00 00:00:00', 25, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(237, 7, 0, '01 25', '01-25', 'KarinaeGlauber/01 25.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 88233, 1, 1, 0, '0000-00-00 00:00:00', 24, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(236, 7, 0, '01 24', '01-24', 'KarinaeGlauber/01 24.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 92904, 1, 1, 0, '0000-00-00 00:00:00', 23, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(235, 7, 0, '01 23', '01-23', 'KarinaeGlauber/01 23.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 94079, 1, 1, 0, '0000-00-00 00:00:00', 22, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(234, 7, 0, '01 22', '01-22', 'KarinaeGlauber/01 22.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 95728, 1, 1, 0, '0000-00-00 00:00:00', 21, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(233, 7, 0, '01 21', '01-21', 'KarinaeGlauber/01 21.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 102581, 1, 1, 0, '0000-00-00 00:00:00', 20, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(232, 7, 0, '01 20', '01-20', 'KarinaeGlauber/01 20.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 73915, 1, 1, 0, '0000-00-00 00:00:00', 19, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(231, 7, 0, '01 19', '01-19', 'KarinaeGlauber/01 19.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 86372, 1, 1, 0, '0000-00-00 00:00:00', 18, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(230, 7, 0, '01 18', '01-18', 'KarinaeGlauber/01 18.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 91858, 1, 1, 0, '0000-00-00 00:00:00', 17, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(229, 7, 0, '01 17', '01-17', 'KarinaeGlauber/01 17.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 63957, 1, 1, 0, '0000-00-00 00:00:00', 16, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(228, 7, 0, '01 16', '01-16', 'KarinaeGlauber/01 16.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 94852, 1, 1, 0, '0000-00-00 00:00:00', 15, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(227, 7, 0, '01 15', '01-15', 'KarinaeGlauber/01 15.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 115981, 1, 1, 0, '0000-00-00 00:00:00', 14, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(226, 7, 0, '01 14', '01-14', 'KarinaeGlauber/01 14.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 106402, 1, 1, 0, '0000-00-00 00:00:00', 13, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(225, 7, 0, '01 13', '01-13', 'KarinaeGlauber/01 13.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 73390, 1, 1, 0, '0000-00-00 00:00:00', 12, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(224, 7, 0, '01 12', '01-12', 'KarinaeGlauber/01 12.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 65666, 1, 1, 0, '0000-00-00 00:00:00', 11, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(223, 7, 0, '01 11', '01-11', 'KarinaeGlauber/01 11.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 95325, 1, 1, 0, '0000-00-00 00:00:00', 10, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(222, 7, 0, '01 10', '01-10', 'KarinaeGlauber/01 10.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 99730, 1, 1, 0, '0000-00-00 00:00:00', 9, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(221, 7, 0, '01 9', '01-9', 'KarinaeGlauber/01 9.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 81383, 1, 1, 0, '0000-00-00 00:00:00', 8, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(220, 7, 0, '01 7', '01-7', 'KarinaeGlauber/01 7.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 103989, 1, 1, 0, '0000-00-00 00:00:00', 7, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(219, 7, 0, '01 6', '01-6', 'KarinaeGlauber/01 6.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 88831, 1, 1, 0, '0000-00-00 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(218, 7, 0, '01 5', '01-5', 'KarinaeGlauber/01 5.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 81734, 1, 1, 0, '0000-00-00 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(217, 7, 0, '01 4', '01-4', 'KarinaeGlauber/01 4.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 123608, 1, 1, 0, '0000-00-00 00:00:00', 4, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(216, 7, 0, '01 3', '01-3', 'KarinaeGlauber/01 3.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 86461, 1, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(215, 7, 0, '01 2', '01-2', 'KarinaeGlauber/01 2.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 100099, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(211, 6, 0, '01 91', '01-91', 'solenircelso/01 91.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 255700, 1, 1, 0, '0000-00-00 00:00:00', 86, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(212, 6, 0, '01 92', '01-92', 'solenircelso/01 92.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 142059, 1, 1, 0, '0000-00-00 00:00:00', 87, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(213, 6, 0, '01', '01', 'solenircelso/01.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 74636, 1, 1, 0, '0000-00-00 00:00:00', 88, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(214, 7, 0, '01 1', '01-1', 'KarinaeGlauber/01 1.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 116846, 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(210, 6, 0, '01 90', '01-90', 'solenircelso/01 90.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 85189, 1, 1, 0, '0000-00-00 00:00:00', 85, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(209, 6, 0, '01 89', '01-89', 'solenircelso/01 89.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 73258, 1, 1, 0, '0000-00-00 00:00:00', 84, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(208, 6, 0, '01 88', '01-88', 'solenircelso/01 88.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 142059, 1, 1, 0, '0000-00-00 00:00:00', 83, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(207, 6, 0, '01 87', '01-87', 'solenircelso/01 87.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 151847, 1, 1, 0, '0000-00-00 00:00:00', 82, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(206, 6, 0, '01 86', '01-86', 'solenircelso/01 86.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 110044, 1, 1, 0, '0000-00-00 00:00:00', 81, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(205, 6, 0, '01 85', '01-85', 'solenircelso/01 85.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 101579, 1, 1, 0, '0000-00-00 00:00:00', 80, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(204, 6, 0, '01 84', '01-84', 'solenircelso/01 84.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 97834, 1, 1, 0, '0000-00-00 00:00:00', 79, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(203, 6, 0, '01 83', '01-83', 'solenircelso/01 83.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 91692, 1, 1, 0, '0000-00-00 00:00:00', 78, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(202, 6, 0, '01 82', '01-82', 'solenircelso/01 82.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 80415, 1, 1, 0, '0000-00-00 00:00:00', 77, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(201, 6, 0, '01 81', '01-81', 'solenircelso/01 81.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 75883, 1, 1, 0, '0000-00-00 00:00:00', 76, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(200, 6, 0, '01 80', '01-80', 'solenircelso/01 80.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 84089, 1, 1, 0, '0000-00-00 00:00:00', 75, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(199, 6, 0, '01 79', '01-79', 'solenircelso/01 79.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 87392, 1, 1, 0, '0000-00-00 00:00:00', 74, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(198, 6, 0, '01 78', '01-78', 'solenircelso/01 78.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 118331, 1, 1, 0, '0000-00-00 00:00:00', 73, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(197, 6, 0, '01 77', '01-77', 'solenircelso/01 77.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 141995, 1, 1, 0, '0000-00-00 00:00:00', 72, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(196, 6, 0, '01 76', '01-76', 'solenircelso/01 76.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 104431, 1, 1, 0, '0000-00-00 00:00:00', 71, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(195, 6, 0, '01 75', '01-75', 'solenircelso/01 75.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 73866, 1, 1, 0, '0000-00-00 00:00:00', 70, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(194, 6, 0, '01 74', '01-74', 'solenircelso/01 74.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 96601, 1, 1, 0, '0000-00-00 00:00:00', 69, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(193, 6, 0, '01 73', '01-73', 'solenircelso/01 73.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 73465, 1, 1, 0, '0000-00-00 00:00:00', 68, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(192, 6, 0, '01 72', '01-72', 'solenircelso/01 72.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 66803, 1, 1, 0, '0000-00-00 00:00:00', 67, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(191, 6, 0, '01 71', '01-71', 'solenircelso/01 71.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 114116, 1, 1, 0, '0000-00-00 00:00:00', 66, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(190, 6, 0, '01 70', '01-70', 'solenircelso/01 70.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 93224, 1, 1, 0, '0000-00-00 00:00:00', 65, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(189, 6, 0, '01 69', '01-69', 'solenircelso/01 69.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 56813, 1, 1, 0, '0000-00-00 00:00:00', 64, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(188, 6, 0, '01 68', '01-68', 'solenircelso/01 68.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 73700, 1, 1, 0, '0000-00-00 00:00:00', 63, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(187, 6, 0, '01 67', '01-67', 'solenircelso/01 67.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 101967, 1, 1, 0, '0000-00-00 00:00:00', 62, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(186, 6, 0, '01 66', '01-66', 'solenircelso/01 66.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 239667, 1, 1, 0, '0000-00-00 00:00:00', 61, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(185, 6, 0, '01 65', '01-65', 'solenircelso/01 65.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 255700, 1, 1, 0, '0000-00-00 00:00:00', 60, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(184, 6, 0, '01 62', '01-62', 'solenircelso/01 62.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 80067, 1, 1, 0, '0000-00-00 00:00:00', 59, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(183, 6, 0, '01 61', '01-61', 'solenircelso/01 61.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 77013, 1, 1, 0, '0000-00-00 00:00:00', 58, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(182, 6, 0, '01 60', '01-60', 'solenircelso/01 60.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 127215, 1, 1, 0, '0000-00-00 00:00:00', 57, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(181, 6, 0, '01 59', '01-59', 'solenircelso/01 59.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 124730, 1, 1, 0, '0000-00-00 00:00:00', 56, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(180, 6, 0, '01 58', '01-58', 'solenircelso/01 58.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 117374, 1, 1, 0, '0000-00-00 00:00:00', 55, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(179, 6, 0, '01 57', '01-57', 'solenircelso/01 57.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 121543, 1, 1, 0, '0000-00-00 00:00:00', 54, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(178, 6, 0, '01 56', '01-56', 'solenircelso/01 56.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 113596, 1, 1, 0, '0000-00-00 00:00:00', 53, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(177, 6, 0, '01 55', '01-55', 'solenircelso/01 55.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 101787, 1, 1, 0, '0000-00-00 00:00:00', 52, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(176, 6, 0, '01 54', '01-54', 'solenircelso/01 54.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 163556, 1, 1, 0, '0000-00-00 00:00:00', 51, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(175, 6, 0, '01 53', '01-53', 'solenircelso/01 53.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 165363, 1, 1, 0, '0000-00-00 00:00:00', 50, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(174, 6, 0, '01 52', '01-52', 'solenircelso/01 52.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 120850, 1, 1, 0, '0000-00-00 00:00:00', 49, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(173, 6, 0, '01 51', '01-51', 'solenircelso/01 51.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 173466, 1, 1, 0, '0000-00-00 00:00:00', 48, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(172, 6, 0, '01 50', '01-50', 'solenircelso/01 50.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 160085, 1, 1, 0, '0000-00-00 00:00:00', 47, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(171, 6, 0, '01 49', '01-49', 'solenircelso/01 49.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 181377, 1, 1, 0, '0000-00-00 00:00:00', 46, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(170, 6, 0, '01 48', '01-48', 'solenircelso/01 48.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 207078, 1, 1, 0, '0000-00-00 00:00:00', 45, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(169, 6, 0, '01 47', '01-47', 'solenircelso/01 47.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 208861, 1, 1, 0, '0000-00-00 00:00:00', 44, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(168, 6, 0, '01 46', '01-46', 'solenircelso/01 46.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 198031, 1, 1, 0, '0000-00-00 00:00:00', 43, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(167, 6, 0, '01 45', '01-45', 'solenircelso/01 45.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 132769, 1, 1, 0, '0000-00-00 00:00:00', 42, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(166, 6, 0, '01 44', '01-44', 'solenircelso/01 44.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 165067, 1, 1, 0, '0000-00-00 00:00:00', 41, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(165, 6, 0, '01 43', '01-43', 'solenircelso/01 43.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 218992, 1, 1, 0, '0000-00-00 00:00:00', 40, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(164, 6, 0, '01 42', '01-42', 'solenircelso/01 42.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 174097, 1, 1, 0, '0000-00-00 00:00:00', 39, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(163, 6, 0, '01 41', '01-41', 'solenircelso/01 41.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 146653, 1, 1, 0, '0000-00-00 00:00:00', 38, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(162, 6, 0, '01 40', '01-40', 'solenircelso/01 40.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 129057, 1, 1, 0, '0000-00-00 00:00:00', 37, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(161, 6, 0, '01 39', '01-39', 'solenircelso/01 39.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 125223, 1, 1, 0, '0000-00-00 00:00:00', 36, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(160, 6, 0, '01 38', '01-38', 'solenircelso/01 38.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 198720, 1, 1, 0, '0000-00-00 00:00:00', 35, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(159, 6, 0, '01 37', '01-37', 'solenircelso/01 37.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 73391, 1, 1, 0, '0000-00-00 00:00:00', 34, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(158, 6, 0, '01 36', '01-36', 'solenircelso/01 36.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 123803, 1, 1, 0, '0000-00-00 00:00:00', 33, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(157, 6, 0, '01 35', '01-35', 'solenircelso/01 35.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 118059, 1, 1, 0, '0000-00-00 00:00:00', 32, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(156, 6, 0, '01 34', '01-34', 'solenircelso/01 34.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 190485, 1, 1, 0, '0000-00-00 00:00:00', 31, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(155, 6, 0, '01 33', '01-33', 'solenircelso/01 33.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 180652, 1, 1, 0, '0000-00-00 00:00:00', 30, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(154, 6, 0, '01 32', '01-32', 'solenircelso/01 32.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 155102, 1, 1, 0, '0000-00-00 00:00:00', 29, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(153, 6, 0, '01 31', '01-31', 'solenircelso/01 31.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 141472, 1, 1, 0, '0000-00-00 00:00:00', 28, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(152, 6, 0, '01 30', '01-30', 'solenircelso/01 30.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 163936, 1, 1, 0, '0000-00-00 00:00:00', 27, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(151, 6, 0, '01 29', '01-29', 'solenircelso/01 29.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 171200, 1, 1, 0, '0000-00-00 00:00:00', 26, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(150, 6, 0, '01 28', '01-28', 'solenircelso/01 28.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 156246, 1, 1, 0, '0000-00-00 00:00:00', 25, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(149, 6, 0, '01 27', '01-27', 'solenircelso/01 27.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 188595, 1, 1, 0, '0000-00-00 00:00:00', 24, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(148, 6, 0, '01 26', '01-26', 'solenircelso/01 26.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 172818, 1, 1, 0, '0000-00-00 00:00:00', 23, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(147, 6, 0, '01 25', '01-25', 'solenircelso/01 25.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 178061, 1, 1, 0, '0000-00-00 00:00:00', 22, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(146, 6, 0, '01 24', '01-24', 'solenircelso/01 24.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 124161, 1, 1, 0, '0000-00-00 00:00:00', 21, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(145, 6, 0, '01 23', '01-23', 'solenircelso/01 23.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 201371, 1, 1, 0, '0000-00-00 00:00:00', 20, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(144, 6, 0, '01 22', '01-22', 'solenircelso/01 22.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 156557, 1, 1, 0, '0000-00-00 00:00:00', 19, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(143, 6, 0, '01 21', '01-21', 'solenircelso/01 21.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 182166, 1, 1, 0, '0000-00-00 00:00:00', 18, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(142, 6, 0, '01 20', '01-20', 'solenircelso/01 20.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 90555, 1, 1, 0, '0000-00-00 00:00:00', 17, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(141, 6, 0, '01 19', '01-19', 'solenircelso/01 19.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 109783, 1, 1, 0, '0000-00-00 00:00:00', 16, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(140, 6, 0, '01 18', '01-18', 'solenircelso/01 18.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 87443, 1, 1, 0, '0000-00-00 00:00:00', 15, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(139, 6, 0, '01 17', '01-17', 'solenircelso/01 17.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 80916, 1, 1, 0, '0000-00-00 00:00:00', 14, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(138, 6, 0, '01 16', '01-16', 'solenircelso/01 16.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 113204, 1, 1, 0, '0000-00-00 00:00:00', 13, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(137, 6, 0, '01 15', '01-15', 'solenircelso/01 15.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 95014, 1, 1, 0, '0000-00-00 00:00:00', 12, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(136, 6, 0, '01 14', '01-14', 'solenircelso/01 14.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 71034, 1, 1, 0, '0000-00-00 00:00:00', 11, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(135, 6, 0, '01 13', '01-13', 'solenircelso/01 13.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 70188, 1, 1, 0, '0000-00-00 00:00:00', 10, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(134, 6, 0, '01 12', '01-12', 'solenircelso/01 12.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 100788, 1, 1, 0, '0000-00-00 00:00:00', 9, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(133, 6, 0, '01 11', '01-11', 'solenircelso/01 11.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 72689, 1, 1, 0, '0000-00-00 00:00:00', 8, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(132, 6, 0, '01 9', '01-9', 'solenircelso/01 9.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 89722, 1, 1, 0, '0000-00-00 00:00:00', 7, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(131, 6, 0, '01 6', '01-6', 'solenircelso/01 6.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 149183, 1, 1, 0, '0000-00-00 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(130, 6, 0, '01 5', '01-5', 'solenircelso/01 5.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 195751, 1, 1, 0, '0000-00-00 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(129, 6, 0, '01 4', '01-4', 'solenircelso/01 4.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 178157, 1, 1, 0, '0000-00-00 00:00:00', 4, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(128, 6, 0, '01 3', '01-3', 'solenircelso/01 3.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 84799, 1, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(127, 6, 0, '01 2', '01-2', 'solenircelso/01 2.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 89902, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(126, 6, 0, '01 1', '01-1', 'solenircelso/01 1.jpg', NULL, '2011-01-18 23:30:58', 0, '', '', 0, '', NULL, 0, 99428, 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(241, 7, 0, '01 29', '01-29', 'KarinaeGlauber/01 29.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 128102, 1, 1, 0, '0000-00-00 00:00:00', 28, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(242, 7, 0, '01 30', '01-30', 'KarinaeGlauber/01 30.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 93153, 1, 1, 0, '0000-00-00 00:00:00', 29, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(243, 7, 0, '01 31', '01-31', 'KarinaeGlauber/01 31.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 87627, 1, 1, 0, '0000-00-00 00:00:00', 30, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(244, 7, 0, '01 32', '01-32', 'KarinaeGlauber/01 32.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 73008, 1, 1, 0, '0000-00-00 00:00:00', 31, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(245, 7, 0, '01 33', '01-33', 'KarinaeGlauber/01 33.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 106852, 1, 1, 0, '0000-00-00 00:00:00', 32, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(246, 7, 0, '01 34', '01-34', 'KarinaeGlauber/01 34.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 73905, 1, 1, 0, '0000-00-00 00:00:00', 33, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(247, 7, 0, '01 35', '01-35', 'KarinaeGlauber/01 35.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 78333, 1, 1, 0, '0000-00-00 00:00:00', 34, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(248, 7, 0, '01 36', '01-36', 'KarinaeGlauber/01 36.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 107365, 1, 1, 0, '0000-00-00 00:00:00', 35, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(249, 7, 0, '01 37', '01-37', 'KarinaeGlauber/01 37.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 143851, 1, 1, 0, '0000-00-00 00:00:00', 36, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(250, 7, 0, '01 38', '01-38', 'KarinaeGlauber/01 38.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 132247, 1, 1, 0, '0000-00-00 00:00:00', 37, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(251, 7, 0, '01 39', '01-39', 'KarinaeGlauber/01 39.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 105231, 1, 1, 0, '0000-00-00 00:00:00', 38, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(252, 7, 0, '01 40', '01-40', 'KarinaeGlauber/01 40.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 90831, 1, 1, 0, '0000-00-00 00:00:00', 39, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(253, 7, 0, '01 41', '01-41', 'KarinaeGlauber/01 41.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 76994, 1, 1, 0, '0000-00-00 00:00:00', 40, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(254, 7, 0, '01 42', '01-42', 'KarinaeGlauber/01 42.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 82757, 1, 1, 0, '0000-00-00 00:00:00', 41, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(255, 7, 0, '01 43', '01-43', 'KarinaeGlauber/01 43.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 80290, 1, 1, 0, '0000-00-00 00:00:00', 42, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(256, 7, 0, '01 44', '01-44', 'KarinaeGlauber/01 44.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 89444, 1, 1, 0, '0000-00-00 00:00:00', 43, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(257, 7, 0, '01 45', '01-45', 'KarinaeGlauber/01 45.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 80393, 1, 1, 0, '0000-00-00 00:00:00', 44, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(258, 7, 0, '01 46', '01-46', 'KarinaeGlauber/01 46.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 126540, 1, 1, 0, '0000-00-00 00:00:00', 45, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(259, 7, 0, '01 47', '01-47', 'KarinaeGlauber/01 47.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 109778, 1, 1, 0, '0000-00-00 00:00:00', 46, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(260, 7, 0, '01 48', '01-48', 'KarinaeGlauber/01 48.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 86988, 1, 1, 0, '0000-00-00 00:00:00', 47, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(261, 7, 0, '01 49', '01-49', 'KarinaeGlauber/01 49.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 99117, 1, 1, 0, '0000-00-00 00:00:00', 48, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(262, 7, 0, '01 50', '01-50', 'KarinaeGlauber/01 50.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 92955, 1, 1, 0, '0000-00-00 00:00:00', 49, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(263, 7, 0, '01 51', '01-51', 'KarinaeGlauber/01 51.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 132285, 1, 1, 0, '0000-00-00 00:00:00', 50, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(264, 7, 0, '01 52', '01-52', 'KarinaeGlauber/01 52.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 102284, 1, 1, 0, '0000-00-00 00:00:00', 51, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(265, 7, 0, '01 53', '01-53', 'KarinaeGlauber/01 53.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 79191, 1, 1, 0, '0000-00-00 00:00:00', 52, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(266, 7, 0, '01 54', '01-54', 'KarinaeGlauber/01 54.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 84434, 1, 1, 0, '0000-00-00 00:00:00', 53, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(267, 7, 0, '01 55', '01-55', 'KarinaeGlauber/01 55.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 77185, 1, 1, 0, '0000-00-00 00:00:00', 54, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(268, 7, 0, '01 57', '01-57', 'KarinaeGlauber/01 57.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 77139, 1, 1, 0, '0000-00-00 00:00:00', 55, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(269, 7, 0, '01 58', '01-58', 'KarinaeGlauber/01 58.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 98485, 1, 1, 0, '0000-00-00 00:00:00', 56, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(270, 7, 0, '01 59', '01-59', 'KarinaeGlauber/01 59.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 70923, 1, 1, 0, '0000-00-00 00:00:00', 57, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(271, 7, 0, '01 60', '01-60', 'KarinaeGlauber/01 60.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 116936, 1, 1, 0, '0000-00-00 00:00:00', 58, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(272, 7, 0, '01 61', '01-61', 'KarinaeGlauber/01 61.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 114519, 1, 1, 0, '0000-00-00 00:00:00', 59, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(273, 7, 0, '01 62', '01-62', 'KarinaeGlauber/01 62.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 78510, 1, 1, 0, '0000-00-00 00:00:00', 60, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(274, 7, 0, '01 63', '01-63', 'KarinaeGlauber/01 63.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 115133, 1, 1, 0, '0000-00-00 00:00:00', 61, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(275, 7, 0, '01 64', '01-64', 'KarinaeGlauber/01 64.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 77598, 1, 1, 0, '0000-00-00 00:00:00', 62, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(276, 7, 0, '01 65', '01-65', 'KarinaeGlauber/01 65.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 77585, 1, 1, 0, '0000-00-00 00:00:00', 63, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(277, 7, 0, '01 66', '01-66', 'KarinaeGlauber/01 66.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 136275, 1, 1, 0, '0000-00-00 00:00:00', 64, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(278, 7, 0, '01 67', '01-67', 'KarinaeGlauber/01 67.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 117339, 1, 1, 0, '0000-00-00 00:00:00', 65, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(279, 7, 0, '01 68', '01-68', 'KarinaeGlauber/01 68.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 118971, 1, 1, 0, '0000-00-00 00:00:00', 66, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(280, 7, 0, '01 69', '01-69', 'KarinaeGlauber/01 69.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 123564, 1, 1, 0, '0000-00-00 00:00:00', 67, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(281, 7, 0, '01 70', '01-70', 'KarinaeGlauber/01 70.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 78765, 1, 1, 0, '0000-00-00 00:00:00', 68, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(282, 7, 0, '01 71', '01-71', 'KarinaeGlauber/01 71.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 90502, 1, 1, 0, '0000-00-00 00:00:00', 69, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(283, 7, 0, '01 72', '01-72', 'KarinaeGlauber/01 72.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 72260, 1, 1, 0, '0000-00-00 00:00:00', 70, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(284, 7, 0, '01', '01', 'KarinaeGlauber/01.jpg', NULL, '2011-01-18 23:43:42', 0, '', '', 0, '', NULL, 0, 64170, 1, 1, 0, '0000-00-00 00:00:00', 71, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(285, 8, 0, 'vilson308', 'vilson308', 'ZenoeSimone/vilson308.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 92195, 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(286, 8, 0, 'vilson378', 'vilson378', 'ZenoeSimone/vilson378.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 185316, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(287, 8, 0, 'vilson393', 'vilson393', 'ZenoeSimone/vilson393.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 75847, 1, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(288, 8, 0, 'vilson396', 'vilson396', 'ZenoeSimone/vilson396.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 141667, 1, 1, 0, '0000-00-00 00:00:00', 4, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(289, 8, 0, 'vilson419', 'vilson419', 'ZenoeSimone/vilson419.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 180943, 1, 1, 0, '0000-00-00 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(290, 8, 0, 'vilson421', 'vilson421', 'ZenoeSimone/vilson421.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 172339, 1, 1, 0, '0000-00-00 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(291, 8, 0, 'vilson452', 'vilson452', 'ZenoeSimone/vilson452.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 83483, 1, 1, 0, '0000-00-00 00:00:00', 7, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(292, 8, 0, 'vilson465', 'vilson465', 'ZenoeSimone/vilson465.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 163956, 1, 1, 0, '0000-00-00 00:00:00', 8, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(293, 8, 0, 'vilson469', 'vilson469', 'ZenoeSimone/vilson469.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 168385, 1, 1, 0, '0000-00-00 00:00:00', 9, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(294, 8, 0, 'wander 1', 'wander-1', 'ZenoeSimone/wander 1.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 133748, 1, 1, 0, '0000-00-00 00:00:00', 10, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(295, 8, 0, 'wander 2', 'wander-2', 'ZenoeSimone/wander 2.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 61822, 1, 1, 0, '0000-00-00 00:00:00', 11, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(296, 8, 0, 'wander 25', 'wander-25', 'ZenoeSimone/wander 25.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 155801, 1, 1, 0, '0000-00-00 00:00:00', 12, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(297, 8, 0, 'wander 27', 'wander-27', 'ZenoeSimone/wander 27.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 159302, 1, 1, 0, '0000-00-00 00:00:00', 13, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(298, 8, 0, 'wander 30', 'wander-30', 'ZenoeSimone/wander 30.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 165099, 1, 1, 0, '0000-00-00 00:00:00', 14, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(299, 8, 0, 'wander 37', 'wander-37', 'ZenoeSimone/wander 37.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 144713, 1, 1, 0, '0000-00-00 00:00:00', 15, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(300, 8, 0, 'wander 40', 'wander-40', 'ZenoeSimone/wander 40.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 147587, 1, 1, 0, '0000-00-00 00:00:00', 16, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(301, 8, 0, 'wander 42', 'wander-42', 'ZenoeSimone/wander 42.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 151022, 1, 1, 0, '0000-00-00 00:00:00', 17, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(302, 8, 0, 'wander 44', 'wander-44', 'ZenoeSimone/wander 44.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 142860, 1, 1, 0, '0000-00-00 00:00:00', 18, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(303, 8, 0, 'wander 49', 'wander-49', 'ZenoeSimone/wander 49.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 175402, 1, 1, 0, '0000-00-00 00:00:00', 19, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(304, 8, 0, 'wander 50', 'wander-50', 'ZenoeSimone/wander 50.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 166456, 1, 1, 0, '0000-00-00 00:00:00', 20, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(305, 8, 0, 'wander 57', 'wander-57', 'ZenoeSimone/wander 57.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 258245, 1, 1, 0, '0000-00-00 00:00:00', 21, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(306, 8, 0, 'wander 66', 'wander-66', 'ZenoeSimone/wander 66.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 58251, 1, 1, 0, '0000-00-00 00:00:00', 22, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(307, 8, 0, 'wander 70', 'wander-70', 'ZenoeSimone/wander 70.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 70719, 1, 1, 0, '0000-00-00 00:00:00', 23, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(308, 8, 0, 'wander 72', 'wander-72', 'ZenoeSimone/wander 72.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 68925, 1, 1, 0, '0000-00-00 00:00:00', 24, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(309, 8, 0, 'wander 77', 'wander-77', 'ZenoeSimone/wander 77.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 85076, 1, 1, 0, '0000-00-00 00:00:00', 25, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(310, 8, 0, 'wander 84', 'wander-84', 'ZenoeSimone/wander 84.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 63797, 1, 1, 0, '0000-00-00 00:00:00', 26, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(311, 8, 0, 'wander 87', 'wander-87', 'ZenoeSimone/wander 87.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 61897, 1, 1, 0, '0000-00-00 00:00:00', 27, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(312, 8, 0, 'wander 89', 'wander-89', 'ZenoeSimone/wander 89.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 75716, 1, 1, 0, '0000-00-00 00:00:00', 28, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(313, 8, 0, 'wander 106', 'wander-106', 'ZenoeSimone/wander 106.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 84199, 1, 1, 0, '0000-00-00 00:00:00', 29, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(314, 8, 0, 'wander 118', 'wander-118', 'ZenoeSimone/wander 118.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 80622, 1, 1, 0, '0000-00-00 00:00:00', 30, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(315, 8, 0, 'wander 123', 'wander-123', 'ZenoeSimone/wander 123.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 63342, 1, 1, 0, '0000-00-00 00:00:00', 31, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(316, 8, 0, 'wander 138', 'wander-138', 'ZenoeSimone/wander 138.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 154786, 1, 1, 0, '0000-00-00 00:00:00', 32, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(317, 8, 0, 'wander 147', 'wander-147', 'ZenoeSimone/wander 147.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 90082, 1, 1, 0, '0000-00-00 00:00:00', 33, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(318, 8, 0, 'wander 149', 'wander-149', 'ZenoeSimone/wander 149.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 81036, 1, 1, 0, '0000-00-00 00:00:00', 34, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(319, 8, 0, 'wander 155', 'wander-155', 'ZenoeSimone/wander 155.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 67024, 1, 1, 0, '0000-00-00 00:00:00', 35, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(320, 8, 0, 'wander 156', 'wander-156', 'ZenoeSimone/wander 156.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 71510, 1, 1, 0, '0000-00-00 00:00:00', 36, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(321, 8, 0, 'wander 159', 'wander-159', 'ZenoeSimone/wander 159.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 132549, 1, 1, 0, '0000-00-00 00:00:00', 37, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(322, 8, 0, 'wander 161', 'wander-161', 'ZenoeSimone/wander 161.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 96298, 1, 1, 0, '0000-00-00 00:00:00', 38, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(323, 8, 0, 'wander 170', 'wander-170', 'ZenoeSimone/wander 170.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 83446, 1, 1, 0, '0000-00-00 00:00:00', 39, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(324, 8, 0, 'wander 171', 'wander-171', 'ZenoeSimone/wander 171.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 77900, 1, 1, 0, '0000-00-00 00:00:00', 40, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(325, 8, 0, 'wander 188', 'wander-188', 'ZenoeSimone/wander 188.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 102455, 1, 1, 0, '0000-00-00 00:00:00', 41, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(326, 8, 0, 'wander 189', 'wander-189', 'ZenoeSimone/wander 189.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 109288, 1, 1, 0, '0000-00-00 00:00:00', 42, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(327, 8, 0, 'wander 193', 'wander-193', 'ZenoeSimone/wander 193.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 144938, 1, 1, 0, '0000-00-00 00:00:00', 43, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(328, 8, 0, 'wander 197', 'wander-197', 'ZenoeSimone/wander 197.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 99884, 1, 1, 0, '0000-00-00 00:00:00', 44, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(329, 8, 0, 'wander 198', 'wander-198', 'ZenoeSimone/wander 198.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 83756, 1, 1, 0, '0000-00-00 00:00:00', 45, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(330, 8, 0, 'wander 210', 'wander-210', 'ZenoeSimone/wander 210.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 100032, 1, 1, 0, '0000-00-00 00:00:00', 46, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(331, 8, 0, 'wander 213', 'wander-213', 'ZenoeSimone/wander 213.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 95205, 1, 1, 0, '0000-00-00 00:00:00', 47, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(332, 8, 0, 'wander 220', 'wander-220', 'ZenoeSimone/wander 220.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 110447, 1, 1, 0, '0000-00-00 00:00:00', 48, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(333, 8, 0, 'wander 222', 'wander-222', 'ZenoeSimone/wander 222.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 113601, 1, 1, 0, '0000-00-00 00:00:00', 49, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(334, 8, 0, 'wander 233', 'wander-233', 'ZenoeSimone/wander 233.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 56637, 1, 1, 0, '0000-00-00 00:00:00', 50, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(335, 8, 0, 'wander 245', 'wander-245', 'ZenoeSimone/wander 245.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 122768, 1, 1, 0, '0000-00-00 00:00:00', 51, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(336, 8, 0, 'wander 251', 'wander-251', 'ZenoeSimone/wander 251.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 130949, 1, 1, 0, '0000-00-00 00:00:00', 52, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(337, 8, 0, 'wander 280', 'wander-280', 'ZenoeSimone/wander 280.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 196858, 1, 1, 0, '0000-00-00 00:00:00', 53, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(338, 8, 0, 'wander 283', 'wander-283', 'ZenoeSimone/wander 283.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 170228, 1, 1, 0, '0000-00-00 00:00:00', 54, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(339, 8, 0, 'wander 284', 'wander-284', 'ZenoeSimone/wander 284.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 86607, 1, 1, 0, '0000-00-00 00:00:00', 55, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(340, 8, 0, 'wander 291', 'wander-291', 'ZenoeSimone/wander 291.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 67502, 1, 1, 0, '0000-00-00 00:00:00', 56, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(341, 8, 0, 'wander 294', 'wander-294', 'ZenoeSimone/wander 294.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 66715, 1, 1, 0, '0000-00-00 00:00:00', 57, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(342, 8, 0, 'wander 335', 'wander-335', 'ZenoeSimone/wander 335.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 147175, 1, 1, 0, '0000-00-00 00:00:00', 58, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(343, 8, 0, 'wander 340', 'wander-340', 'ZenoeSimone/wander 340.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 98965, 1, 1, 0, '0000-00-00 00:00:00', 59, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(344, 8, 0, 'wander 346', 'wander-346', 'ZenoeSimone/wander 346.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 75755, 1, 1, 0, '0000-00-00 00:00:00', 60, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(345, 8, 0, 'wander 350', 'wander-350', 'ZenoeSimone/wander 350.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 90214, 1, 1, 0, '0000-00-00 00:00:00', 61, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(346, 8, 0, 'wander 364', 'wander-364', 'ZenoeSimone/wander 364.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 67172, 1, 1, 0, '0000-00-00 00:00:00', 62, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(347, 8, 0, 'wander 372', 'wander-372', 'ZenoeSimone/wander 372.jpg', NULL, '2011-01-19 00:03:41', 0, '', '', 0, '', NULL, 0, 174788, 1, 1, 0, '0000-00-00 00:00:00', 63, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(348, 9, 0, 'img_', 'img', 'franciele/img_.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 28717, 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(349, 9, 0, 'img_01', 'img01', 'franciele/img_01.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 28621, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(350, 9, 0, 'img_02', 'img02', 'franciele/img_02.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 24577, 1, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(351, 9, 0, 'img_03', 'img03', 'franciele/img_03.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 24656, 1, 1, 0, '0000-00-00 00:00:00', 4, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(352, 9, 0, 'img_04', 'img04', 'franciele/img_04.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 24017, 1, 1, 0, '0000-00-00 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(353, 9, 0, 'img_05', 'img05', 'franciele/img_05.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 21380, 1, 1, 0, '0000-00-00 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(354, 9, 0, 'img_06', 'img06', 'franciele/img_06.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 21846, 1, 1, 0, '0000-00-00 00:00:00', 7, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '');
INSERT INTO `jos_phocagallery` (`id`, `catid`, `sid`, `title`, `alias`, `filename`, `description`, `date`, `hits`, `latitude`, `longitude`, `zoom`, `geotitle`, `videocode`, `vmproductid`, `imgorigsize`, `published`, `approved`, `checked_out`, `checked_out_time`, `ordering`, `params`, `metakey`, `metadesc`, `extlink1`, `extlink2`, `extid`, `extl`, `extm`, `exts`, `exto`, `extw`, `exth`) VALUES
(355, 9, 0, 'img_07', 'img07', 'franciele/img_07.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 19555, 1, 1, 0, '0000-00-00 00:00:00', 8, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(356, 9, 0, 'img_08', 'img08', 'franciele/img_08.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 23994, 1, 1, 0, '0000-00-00 00:00:00', 9, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(357, 9, 0, 'img_09', 'img09', 'franciele/img_09.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 22665, 1, 1, 0, '0000-00-00 00:00:00', 10, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(358, 9, 0, 'img_10', 'img10', 'franciele/img_10.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 21452, 1, 1, 0, '0000-00-00 00:00:00', 11, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(359, 9, 0, 'img_11', 'img11', 'franciele/img_11.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 18572, 1, 1, 0, '0000-00-00 00:00:00', 12, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(360, 9, 0, 'img_12', 'img12', 'franciele/img_12.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 22885, 1, 1, 0, '0000-00-00 00:00:00', 13, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(361, 9, 0, 'img_13', 'img13', 'franciele/img_13.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 19353, 1, 1, 0, '0000-00-00 00:00:00', 14, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(362, 9, 0, 'img_14', 'img14', 'franciele/img_14.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 22619, 1, 1, 0, '0000-00-00 00:00:00', 15, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(363, 9, 0, 'img_15', 'img15', 'franciele/img_15.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 14288, 1, 1, 0, '0000-00-00 00:00:00', 16, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(364, 9, 0, 'img_16', 'img16', 'franciele/img_16.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 23262, 1, 1, 0, '0000-00-00 00:00:00', 17, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(365, 9, 0, 'img_17', 'img17', 'franciele/img_17.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 25796, 1, 1, 0, '0000-00-00 00:00:00', 18, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(366, 9, 0, 'img_18', 'img18', 'franciele/img_18.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 23759, 1, 1, 0, '0000-00-00 00:00:00', 19, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(367, 9, 0, 'img_19', 'img19', 'franciele/img_19.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 20410, 1, 1, 0, '0000-00-00 00:00:00', 20, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(368, 9, 0, 'img_20', 'img20', 'franciele/img_20.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 26265, 1, 1, 0, '0000-00-00 00:00:00', 21, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(369, 9, 0, 'img_21', 'img21', 'franciele/img_21.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 23595, 1, 1, 0, '0000-00-00 00:00:00', 22, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(370, 9, 0, 'img_22', 'img22', 'franciele/img_22.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 33301, 1, 1, 0, '0000-00-00 00:00:00', 23, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(371, 9, 0, 'img_23', 'img23', 'franciele/img_23.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 27359, 1, 1, 0, '0000-00-00 00:00:00', 24, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(372, 9, 0, 'img_24', 'img24', 'franciele/img_24.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 31217, 1, 1, 0, '0000-00-00 00:00:00', 25, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(373, 9, 0, 'img_25', 'img25', 'franciele/img_25.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 34297, 1, 1, 0, '0000-00-00 00:00:00', 26, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(374, 9, 0, 'img_26', 'img26', 'franciele/img_26.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 22587, 1, 1, 0, '0000-00-00 00:00:00', 27, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(375, 9, 0, 'img_27', 'img27', 'franciele/img_27.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 25304, 1, 1, 0, '0000-00-00 00:00:00', 28, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(376, 9, 0, 'img_28', 'img28', 'franciele/img_28.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 32322, 1, 1, 0, '0000-00-00 00:00:00', 29, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(377, 9, 0, 'img_29', 'img29', 'franciele/img_29.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 24835, 1, 1, 0, '0000-00-00 00:00:00', 30, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(378, 9, 0, 'img_30', 'img30', 'franciele/img_30.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 25012, 1, 1, 0, '0000-00-00 00:00:00', 31, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(379, 9, 0, 'img_31', 'img31', 'franciele/img_31.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 27924, 1, 1, 0, '0000-00-00 00:00:00', 32, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(380, 9, 0, 'img_32', 'img32', 'franciele/img_32.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 28324, 1, 1, 0, '0000-00-00 00:00:00', 33, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(381, 9, 0, 'img_33', 'img33', 'franciele/img_33.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 26761, 1, 1, 0, '0000-00-00 00:00:00', 34, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(382, 9, 0, 'img_34', 'img34', 'franciele/img_34.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 26383, 1, 1, 0, '0000-00-00 00:00:00', 35, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(383, 9, 0, 'img_35', 'img35', 'franciele/img_35.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 28887, 1, 1, 0, '0000-00-00 00:00:00', 36, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(384, 9, 0, 'img_36', 'img36', 'franciele/img_36.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 25891, 1, 1, 0, '0000-00-00 00:00:00', 37, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(385, 9, 0, 'img_37', 'img37', 'franciele/img_37.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 23399, 1, 1, 0, '0000-00-00 00:00:00', 38, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(386, 9, 0, 'img_38', 'img38', 'franciele/img_38.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 24869, 1, 1, 0, '0000-00-00 00:00:00', 39, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(387, 9, 0, 'img_39', 'img39', 'franciele/img_39.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 25447, 1, 1, 0, '0000-00-00 00:00:00', 40, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(388, 9, 0, 'img_40', 'img40', 'franciele/img_40.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 30738, 1, 1, 0, '0000-00-00 00:00:00', 41, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(389, 9, 0, 'img_41', 'img41', 'franciele/img_41.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 29909, 1, 1, 0, '0000-00-00 00:00:00', 42, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(390, 9, 0, 'img_42', 'img42', 'franciele/img_42.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 28133, 1, 1, 0, '0000-00-00 00:00:00', 43, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(391, 9, 0, 'img_43', 'img43', 'franciele/img_43.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 27213, 1, 1, 0, '0000-00-00 00:00:00', 44, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(392, 9, 0, 'img_44', 'img44', 'franciele/img_44.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 32877, 1, 1, 0, '0000-00-00 00:00:00', 45, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(393, 9, 0, 'img_45', 'img45', 'franciele/img_45.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 27830, 1, 1, 0, '0000-00-00 00:00:00', 46, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', ''),
(394, 9, 0, 'img_46', 'img46', 'franciele/img_46.jpg', NULL, '2011-01-20 23:36:08', 0, '', '', 0, '', NULL, 0, 30058, 1, 1, 0, '0000-00-00 00:00:00', 47, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_categories`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `owner_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `accessuserid` text,
  `uploaduserid` text,
  `deleteuserid` text,
  `userfolder` text,
  `latitude` varchar(20) NOT NULL default '',
  `longitude` varchar(20) NOT NULL default '',
  `zoom` int(3) NOT NULL default '0',
  `geotitle` varchar(255) NOT NULL default '',
  `extid` varchar(255) NOT NULL default '',
  `exta` varchar(255) NOT NULL default '',
  `extu` varchar(255) NOT NULL default '',
  `extauth` varchar(255) NOT NULL default '',
  `params` text,
  `metakey` text,
  `metadesc` text,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `jos_phocagallery_categories`
--

INSERT INTO `jos_phocagallery_categories` (`id`, `parent_id`, `owner_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `date`, `published`, `approved`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `hits`, `accessuserid`, `uploaduserid`, `deleteuserid`, `userfolder`, `latitude`, `longitude`, `zoom`, `geotitle`, `extid`, `exta`, `extu`, `extauth`, `params`, `metakey`, `metadesc`) VALUES
(8, 0, 0, 'Casamento de Simone e Zeno', '', 'casamento-de-simone-e-zeno', '', '', 'left', '', '2011-01-08 00:00:00', 1, 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, 13, '0', '-2', '-2', 'ZenoeSimone', '', '', 0, '', '', '', '', '', NULL, '', ''),
(9, 0, 0, 'Franciele', '', 'franciele', '', '', 'left', '', '2011-01-20 23:36:08', 1, 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, 1, '0', '-2', '-2', 'franciele', '', '', 0, '', '', '', '', '', NULL, '', ''),
(7, 0, 0, 'Casamento de Karina e Glauber', '', 'casamento-de-karina-e-glauber', '', '', 'left', '', '2010-12-18 00:00:00', 1, 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, 8, '0', '-2', '-2', 'KarinaeGlauber', '', '', 0, '', '', '', '', '', NULL, '', ''),
(6, 0, 0, 'Bodas de Prata de Solenir e Celso', '', 'bodas-de-prata-de-solenir-e-celso', '', '', 'left', '', '2011-01-07 00:00:00', 1, 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, 6, '0', '-2', '-2', 'solenircelso', '', '', 0, '', '', '', '', '', NULL, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_comments`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_comments` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL default '',
  `comment` text,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_comments`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_img_comments`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_img_comments` (
  `id` int(11) NOT NULL auto_increment,
  `imgid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL default '',
  `comment` text,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_img_comments`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_img_votes`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_img_votes` (
  `id` int(11) NOT NULL auto_increment,
  `imgid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_img_votes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_img_votes_statistics`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_img_votes_statistics` (
  `id` int(11) NOT NULL auto_increment,
  `imgid` int(11) NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `average` float(8,6) NOT NULL default '0.000000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_img_votes_statistics`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_user`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_user` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `avatar` varchar(40) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_user`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_votes`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_votes` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_votes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocagallery_votes_statistics`
--

CREATE TABLE IF NOT EXISTS `jos_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `average` float(8,6) NOT NULL default '0.000000',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_phocagallery_votes_statistics`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocamaps_map`
--

CREATE TABLE IF NOT EXISTS `jos_phocamaps_map` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `width` int(5) NOT NULL default '0',
  `height` int(5) NOT NULL default '0',
  `latitude` varchar(20) NOT NULL default '',
  `longitude` varchar(20) NOT NULL default '',
  `zoom` int(3) NOT NULL default '0',
  `lang` varchar(6) NOT NULL default '',
  `border` tinyint(1) NOT NULL default '0',
  `continuouszoom` tinyint(1) NOT NULL default '0',
  `doubleclickzoom` tinyint(1) NOT NULL default '0',
  `scrollwheelzoom` tinyint(1) NOT NULL default '0',
  `zoomcontrol` tinyint(1) NOT NULL default '0',
  `scalecontrol` tinyint(1) NOT NULL default '0',
  `typeid` tinyint(1) NOT NULL default '0',
  `typecontrol` tinyint(1) NOT NULL default '0',
  `typecontrolposition` tinyint(1) NOT NULL default '0',
  `collapsibleoverview` tinyint(1) NOT NULL default '0',
  `dynamiclabel` tinyint(1) NOT NULL default '0',
  `googlebar` tinyint(1) NOT NULL default '0',
  `displayroute` tinyint(1) NOT NULL default '0',
  `kmlfile` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_phocamaps_map`
--

INSERT INTO `jos_phocamaps_map` (`id`, `title`, `alias`, `width`, `height`, `latitude`, `longitude`, `zoom`, `lang`, `border`, `continuouszoom`, `doubleclickzoom`, `scrollwheelzoom`, `zoomcontrol`, `scalecontrol`, `typeid`, `typecontrol`, `typecontrolposition`, `collapsibleoverview`, `dynamiclabel`, `googlebar`, `displayroute`, `kmlfile`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `hits`, `params`) VALUES
(1, 'Localização', 'localizacao', 780, 400, '-26.3439369', '-48.8444766', 15, '', 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, '', '', 1, 62, '2016-11-20 00:49:59', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_phocamaps_marker`
--

CREATE TABLE IF NOT EXISTS `jos_phocamaps_marker` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `latitude` varchar(20) NOT NULL default '',
  `longitude` varchar(20) NOT NULL default '',
  `gpslatitude` varchar(50) NOT NULL default '',
  `gpslongitude` varchar(50) NOT NULL default '',
  `displaygps` tinyint(1) NOT NULL default '0',
  `icon` tinyint(1) NOT NULL default '0',
  `description` text NOT NULL,
  `contentwidth` varchar(8) NOT NULL default '',
  `contentheight` varchar(8) NOT NULL default '',
  `markerwindow` tinyint(1) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_phocamaps_marker`
--

INSERT INTO `jos_phocamaps_marker` (`id`, `catid`, `title`, `alias`, `latitude`, `longitude`, `gpslatitude`, `gpslongitude`, `displaygps`, `icon`, `description`, `contentwidth`, `contentheight`, `markerwindow`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `hits`, `params`) VALUES
(1, 1, 'VonMuller Estúdio Fotográfico', 'vonmuller-estudio-fotografico', '-26.3439369', '-48.8444766', '26° 20'' 38.173"S', '48° 50'' 40.116"W', 0, 0, 'Rua Augusto Schmidt, 195<br />Floresta, Joinville - SC, 89212-300<br />(47) 3465-2943', '380', '120', 0, 1, 0, '0000-00-00 00:00:00', 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Extraindo dados da tabela `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 8, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'Editor - JCE 1.5.7.4', 'jce', 'editors', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(36, 'Phoca Gallery Search Plugin', 'phocagallery', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n'),
(37, 'Phoca Gallery Plugin', 'phocagallery', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(38, 'Button - Phoca Gallery', 'phocagallery', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(39, 'Phoca Maps Plugin', 'phocamaps', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'modal_box_overlay_color=#000000\nmodal_box_overlay_opacity=0.3\nmodal_box_border_color=#6b6b6b\nmodal_box_border_width=2\n'),
(40, 'FlippingBook Plugin', 'flippingbook_plugin', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(1, 'O que você achou do novo site?', 'o-que-voce-achou-do-novo-site', 4, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 1, 'Ruim', 2),
(2, 1, 'Bom', 0),
(3, 1, 'Ótimo', 2),
(4, 1, '', 0),
(5, 1, '', 0),
(6, 1, '', 0),
(7, 1, '', 0),
(8, 1, '', 0),
(9, 1, '', 0),
(10, 1, '', 0),
(11, 1, '', 0),
(12, 1, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `jos_poll_date`
--

INSERT INTO `jos_poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2010-09-13 20:48:23', 1, 1),
(2, '2010-10-14 14:18:27', 3, 1),
(3, '2010-10-21 13:19:45', 1, 1),
(4, '2011-01-25 20:07:59', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'Blog', '', 'blog', '', 'content', 'left', '<p>Olá amigos expectadores &nbsp;do site von muller confiram aqui as fotos do ensaio fotgrafico feito em são&nbsp;Francisco do casal &nbsp;hugo e mariane</p>', 1, 0, '0000-00-00 00:00:00', 1, 0, 1, ''),
(2, 'Makingo of.', '', 'sessao', '', 'content', 'left', '<p>Olá meus amigos nesta semana estivemos em vila velha no Parana realizando mais um belo tarbalho fotografico da sessão making of.</p>\r\n<p>Com o lindo e maravilhoso casal Emerson E janaina.</p>\r\n<p>Confiram algumas das imgans capturadas por nossos profisionais.</p>', 1, 0, '0000-00-00 00:00:00', 2, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('admin', '1479603435', '3601e403c57ebc279c33277af9eebca3', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:26;s:19:"session.timer.start";i:1479602874;s:18:"session.timer.last";i:1479603431;s:17:"session.timer.now";i:1479603435;s:22:"session.client.browser";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:3:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":25:{s:2:"id";i:62;s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:22:"leo.lima.web@gmail.com";s:8:"password";s:65:"c4d2acd3fa1bc35476154f4ca8a028e5:iUuoAjmZdh5WMiqJHj2NwvYEO3K4WU6O";s:14:"password_clear";s:6:"123456";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2010-09-01 19:46:23";s:13:"lastvisitDate";s:19:"2016-11-20 00:48:58";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\ServidorWEB\\www\\vonmuller\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}s:9:"password2";s:6:"123456";s:3:"cid";a:1:{i:0;s:2:"62";}s:6:"option";s:9:"com_users";s:4:"task";s:4:"save";s:10:"contact_id";s:0:"";s:32:"05691eed3166f76b48ae95db3a9e2ae4";s:1:"1";}s:13:"session.token";s:32:"02eadd3ea415ba29053c436ebea2f5fb";}'),
('', '1479604257', '3ec5ae81660b9e11ea5c59649c8fc0f6', 1, 0, '', 0, 0, '__default|a:8:{s:15:"session.counter";i:41;s:19:"session.timer.start";i:1479602674;s:18:"session.timer.last";i:1479604216;s:17:"session.timer.now";i:1479604257;s:22:"session.client.browser";s:109:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.87 Safari/537.36";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\ServidorWEB\\www\\vonmuller\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"a47c504b403d5f77c212c8712febc8a3";}'),
('', '1479603655', '394406ee9e1cbedcc50fb959d6348f77', 1, 0, '', 0, 0, '__default|a:9:{s:15:"session.counter";i:41;s:19:"session.timer.start";i:1479603619;s:18:"session.timer.last";i:1479603655;s:17:"session.timer.now";i:1479603655;s:22:"session.client.browser";s:19:"Wget/1.18 (mingw32)";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:68:"C:\\ServidorWEB\\www\\vonmuller\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"35a0175c0cca03a1fc1ab7fd26d9a03a";s:19:"com_mailto.formtime";i:1479603634;}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('ja_norite', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Extraindo dados da tabela `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'leo.lima.web@gmail.com', 'c4d2acd3fa1bc35476154f4ca8a028e5:iUuoAjmZdh5WMiqJHj2NwvYEO3K4WU6O', 'Super Administrator', 0, 1, 25, '2010-09-01 19:46:23', '2016-11-20 00:48:58', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(63, 'wander', 'wander', 'von.muller@hotmail.com', '2106b95c9ff21b05c59c8720c74659c7:T0lUr61VCaKFYNxDSZHSHMBnBWeJfm2j', 'Super Administrator', 0, 1, 25, '2010-10-14 12:29:42', '2011-01-31 13:42:16', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(64, 'Silvana', 'silvana', 'wanderfotografias@hotmail.com', '8ab382499d2eef1f01318b0dbded8f23:rPGi5Q9y8pTJvL5BVfXeho9ZqmDVknkn', 'Super Administrator', 0, 1, 25, '2011-01-18 21:55:58', '2011-01-18 23:10:19', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(65, 'vini', 'vinix', 'vinix_muller@hotmail.com', '9aab93e5c2321f445bc0e9d397698cde:dcZHgSN16Nc9sGwn1z7kecf6Suc6Mc8h', 'Super Administrator', 0, 1, 25, '2011-01-18 22:48:54', '2011-01-19 16:11:07', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(66, 'Leonardo Vicente', 'leonardo', 'max.logan@hotmail.com', '9d7f2fcb67a00064e370788cb3cab773:ofafppfU626WdKCSMhJIpR35m7Dv43kc', 'Super Administrator', 0, 1, 25, '2011-01-20 22:01:23', '0000-00-00 00:00:00', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `jos_weblinks`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
