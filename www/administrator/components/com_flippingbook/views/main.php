<?php 
defined( '_JEXEC') or die( 'Restricted access');
class Main {
function showMain( &$rows,$params )    {
jimport('joomla.html.pane');
$pane =&JPane::getInstance('sliders');
;echo '<table width="100%" border="0" cellspacing="0" cellpadding="5"> 
    <tr> 
        <td valign="top"> 
            <div style="background-color:#f0f0f0; padding:3px; border:1px solid #cccccc">FlippingBook Gallery Component v. <strong>';echo $params['version'];;echo '</strong></div> 
            <table width="384" border="0" cellpadding="0" cellspacing="0"> 
                <tr> 
                    <td width="128" height="150" align="center"><a href="index.php?option=com_flippingbook&task=configuration" style="text-decoration:none"><img src="components/com_flippingbook/images/m_config.png" alt="Configuration" align="top" border="0"><br /> 
                    ';echo JText::_( 'Configuration');;echo '</a> 
                    </td> 
                    <td width="128" height="150" align="center"><a href="index.php?option=com_flippingbook&task=category_manager" style="text-decoration:none"><img src="components/com_flippingbook/images/m_categories.png" alt="Categories Manager" align="top" border="0"><br /> 
                    ';echo JText::_( 'Manage Categories');;echo '</a> 
                    </td> 
                    <td width="128" height="150" align="center"><a href="index.php?option=com_flippingbook&task=book_manager" style="text-decoration:none"><img src="components/com_flippingbook/images/m_books.png" alt="Books Manager" align="top" border="0"><br /> 
                    ';echo JText::_( 'Book Manager');;echo '</a> 
                    </td> 
                </tr> 
                <tr> 
                    <td width="128" height="150" align="center"><a href="index.php?option=com_flippingbook&task=page_manager" style="text-decoration:none"><img src="components/com_flippingbook/images/m_pages.png" alt="Pages Manager" align="top" border="0" /><br /> 
                    ';echo JText::_( 'Page Manager');;echo '</a> 
                    </td> 
                    <td width="128" height="150" align="center"><a href="index.php?option=com_flippingbook&task=batch_add_pages" style="text-decoration:none"><img src="components/com_flippingbook/images/m_batch.png" alt="Batch Add Pages" align="top" border="0" /><br /> 
                    ';echo JText::_( 'Batch Add Pages');;echo '</a> 
                    </td> 
                    <td width="128" height="150" align="center"><a href="index.php?option=com_flippingbook&task=file_manager" style="text-decoration:none"><img src="components/com_flippingbook/images/m_filemanager.png" alt="File Manager" align="top" border="0" /><br /> 
                    ';echo JText::_( 'Simple File Manager');;echo '</a> 
                    </td> 
                </tr> 
            </table> 
        </td> 
        <td valign="top"> 
                <table class="adminlist"> 
                    <thead> 
                        <tr> 
                            <th> 
                                ';echo JText::_( 'Latest Books');;echo '                            </th> 
                            <th width="50"> 
                                ';echo JText::_( 'Hits');;echo '                            </th> 
                            <th width="150"> 
                                ';echo JText::_( 'Modified');;echo '                            </th> 
                        </tr> 
                    </thead> 
                    <tbody> 
';
for ($i=0,$n=count( $rows );$i <$n;$i++) {
$row = &$rows[$i];
;echo '                        <tr> 
                            <td> 
                                <a href="index.php?option=com_flippingbook&amp;task=edit_book&amp;cid%5B%5D=';echo $row->id;;echo '" title="';echo JText::_( 'Edit Book');;echo '">';echo $row->title;;echo '</a> 
                            </td> 
                            <td align="center"> 
                                ';echo $row->hits;;echo '                            </td> 
                            <td align="center"> 
                                ';echo $row->modified;;echo '                            </td> 
                        </tr> 
';
}
;echo '                    </tbody> 
                </table> 
            <br /> 
';
echo $pane->startPane("menu-pane");
echo $pane->startPanel('License FAQ',"license");
;echo '<div style="padding:5px"> 
    <strong>May I share the installation file with my colleagues?</strong><br /> 
    <span style="color:#FF0000; font-weight:bold;">No. It is not in your interests to share this product with third parties.</span> We keep a record of technical support requests. There may be a situation where a person with whom you shared the component sends a technical support request from a wrong address. We will consider it a transfer of the component to a third party, and your license will be revoked. As a result, you will no longer be able to receive free updates and technical support.<br /><br />
    <strong>What are the usage rights for this component?</strong><br /> 
    The product may be used as part of a personal or commercial site. You may not sell the product to third parties. The source code of the product may be modified for personal use as part of your project only. But in this case you will no longer be able to receive technical support. 
    <br /><br /> 
    <strong>A client for whom I developed a site has requested the original installation file of the component. May I hand it over?</strong><br /> 
    Yes. The installation file must be handed over to the client. 
</div> 
';
echo $pane->endPanel();
echo $pane->startPanel('Support / Contacts',"support");
;echo '<div style="padding:5px"> 
<strong>I experience problems while using the component.</strong><br /> 
    Please describe the nature of your problem in a letter and e-mail it along with screenshots (if available) to the technical support service. The letter must be sent from the e-mail address you specified upon registration. Please be sure to include the license number you received at the time of purchase and the URL of your site (with our component installed). The technical support service normally replies to e-mails within 24 hours.<br /> 
    <br /> 
    <strong>What is the maximum size of images and number of pages?</strong><br /> 
    The size and resolution of images should not be too large, as loading and flipping pages will take a long time on a PC with a slow CPU and Internet connection. For best results we recommend using images corresponding to the book size (book size is configured in its properties).
    The number of pages in a book is not limited, and the component works perfectly with hundreds of pages. The component does not store all pages in memory so that 30 pages will not consume 300 Mb of RAM. Usually, performance is affected when the number of pages exceeds 1,000.<br /><br />
    <strong>Contacts</strong><br /> 
    <span style="color:red;">Please, don\'t forget to provide us with your <strong>ORDER NUMBER</strong> and <strong>the URL of your site</strong> (with our component installed).</span><br>Technical support: <a href="http://page-flip-tools.com/support/" target="_blank">http://page-flip-tools.com/support/</a> 
</div> 
';
echo $pane->endPanel();
echo $pane->startPanel('Copyright',"copyrights");
;echo '<div style="padding:5px"> 
    Copyright &copy; 2007 Mediaparts Interactive.<br />All rights reserved. 
</div> 
';
echo $pane->endPanel();
echo $pane->endPane();
;echo '        </td> 
    </tr> 
</table> 
';
}
}
?>