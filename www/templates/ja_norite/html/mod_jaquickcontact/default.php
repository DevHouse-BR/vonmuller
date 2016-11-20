<?php
defined('_JEXEC') or die('Restricted access');
?>
<div id="ja-ctForm">
	<div class="form-info">
	 <?php echo $params->get('intro_text','Contact Us') ;?>
	</div>
<!--	<form id="form1" name="form1" class="ja-gform" autocomplete="off"  method="post" action="#">-->
<form  action="#" name="contact" method="post" id="contact" class="form-validate">
		<div class="row_ct">
			<input  id="contact_name" type="text" name="name" class="inputbox" value="<?php if ($name!='')echo $name; else echo $senderlabel; ?>" maxlength="60" size="60" onblur="if(this.value=='')this.value='<?php $senderlabel?>';" onfocus="if(this.value=='<?php echo $senderlabel?>')this.value='';" />   
			<div id="error_name" class="class_suffix"><?php if(isset($error['name']))echo $error['name'] ?></div>
  	</div>
		<div class="row_ct">
			<input class="inputbox" id="contact_email" type="text" name="email" value="<?php if ($email!='')echo $email; else echo $email_label; ?>" maxlength="64" size="60" onblur="if(this.value=='')this.value='<?php echo $email_label ?>';" onfocus="if(this.value=='<?php echo $email_label?>')this.value='';" /> 
			<div id="error_email" class="class_suffix"><?php if(isset($error['email']))echo $error['email'] ?></div>
		</div>
		<div class="row_ct">
			<input class="inputbox" id="contact_subject" name="subject"  value="<?php echo @$subject?>" maxlength="64" size="60" onblur="if(this.value=='')this.value='Your Email Subject';" onfocus="if(this.value=='Your Email Subject')this.value='';" />
			<div id="error_subject" class="class_suffix"><?php if(isset($error['error_subject']))echo $error['error_subject'] ?></div>
		</div>
		<div class="row_ct">
			<textarea class="inputbox required" id="contact_text" name="text" rows="10" cols="40" onblur="if(this.value=='')this.value='<?php echo $message_label?>';" onfocus="if(this.value=='<?php echo $message_label;?>')this.value='';"><?php if($text!='') echo $text; else echo $message_label?></textarea>
			<div id="error_text" class="class_suffix"><?php if(isset($error['text']))echo $error['text'] ?></div>
		</div>
  	<?php if ($params->get( 'show_email_copy' ,0)) : ?>
  		<div class="row_ct">
  			<input type="checkbox" name="email_copy" id="contact_email_copy" value="1"  /> <label for="contact_email_copy"><?php echo JText::_('Send me a coppied email')?></label>
  		</div>
  	<?php endif; ?>
	<?php if ($captcha):?>
		<div class="row_ct">
			<?php $mainframe->triggerEvent('onAfterDisplayForm'); ?>
			<div id="error_captcha_code" class="class_suffix"><?php if(isset($error['captcha_code']))echo $error['captcha_code'] ?></div>
		</div>
	<?php endif; ?>
		<input type="submit" class="button validate" value="Send Email" id="ac-submit" name="submit">
		<input type="hidden" name="do_submit" value="1">
		<?php echo JHTML::_( 'form.token' ); ?>
	</form>
</div>
<script type="text/javascript">
	maxchars = <?php echo $params->get('max_chars',1000);?>;
	captcha = <?php echo intval($captcha)?>;
	var emailabel = '<?php echo $email_label?>';
	var senderlabel = '<?php echo $senderlabel?>';
	var messagelabel = '<?php echo $message_label?>';
	Window.onDomReady(function(){
		el = $('ac-submit');
	el.onclick = function()
	{
		var email = $('contact_email').value;
		var ck=true;
		var errors = $$('.error');
	    if (!errors || errors.length>0)
	    {
	        errors.removeClass('error');
	    }
		regex=/^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$/;
		if(!regex.test(email))
		{
			if((email=='')||(email==emailabel))
			{
				$('error_email').innerHTML ='<?php echo JText::_('ERROR EMAIL EMPTY')?>';
			}
			else
			{
				$('error_email').innerHTML ="<?php echo JText::_('ERROR EMAIL INVALID')?>";
			}
			ck=false;
		}
		else
		{
			$('error_email').innerHTML ='';
		}
		var name = $('contact_name').value;
		if((name=='')||(name==senderlabel))
		{
			$('error_name').innerHTML ='<?php echo  JText::_("ERROR NAME INVALID")?>';
			ck = false;
		}
		else
		{
			$('error_name').innerHTML ='';
		}
		var subject = $('contact_subject').value;
		if(subject=='')
		{
			$('error_subject').innerHTML ="<?php echo  JText::_("SUBJECT REQUIRE")?>";
			ck = false;
		}
		else
		{
			$('error_subject').innerHTML ='';
		}
		var message = $('contact_text').value;
		if((message.length>maxchars) ||(message.length<5)||(message==messagelabel))
		{
			$('error_text').innerHTML ='<?php echo JText::_('ERROR MESSAGE INVALID')?>';
			ck = false;
		}
		else
		{
			$('error_text').innerHTML ='';
		}
		if(captcha)
		{
			var captcha_code = $('captcha_code').value;
			if((captcha_code=='')||(captcha_code=='Type the code shown'))
			{
				$('error_captcha_code').innerHTML = "<?php echo JText::_('EMPTY CAPTCHA')?>";
				ck = false;
			}
			else $('error_captcha_code').innerHTML = "";
		}
		return ck;
	};
});
</script>