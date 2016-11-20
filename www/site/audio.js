// This script determines correct code required to embed MEDIA files 
// for a large number of browsers, including AOL and WebTV
// Windows Media Player is required and always used, except for WebTV
// Written by Les Gorven, http://midistudio.com/ 
// Ver. 4.0 (simple) auto-start parameter is true - Created: February 2, 2008

function playMedia(mediaURL,rpt,height,width) {


var mediaURL,rpt,height,width


if (GetBrowser() == "IE")
	playAll(mediaURL,rpt,height,width) ;  
else if (GetBrowser() == "unknown")
	embedSource(mediaURL,rpt,height,width) ;
else if (navigator.appName.substring(0,5) == "WebTV")
	embedSource(mediaURL,rpt,height,width) ;
else
	playAll(mediaURL,rpt,height,width) ;
}

function embedSource(mediaURL,rpt,height,width) {

    var CodeGen = ""
    var mediaURL,rpt,height,width
 		 	
	 CodeGen = '<embed src="' + mediaURL + '"' + '\n' ;
	 CodeGen += ' height=' + height + ' width=' + width + ' autostart="true"' + '\n'
	 CodeGen += ' LOOP=' + rpt + '>'
	 
    document.write(CodeGen)

}

function playAll(mediaURL,rpt,height,width) {
		var CodeGen = "" 
					 	

		CodeGen = '<embed type="application/x-mplayer2" ' + '\n' ;
    	CodeGen += ' pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" ' + '\n' ;
	 	CodeGen += 'Name="Player" ' + 'src="' + mediaURL + '" ' + '\n' ;
	 	CodeGen += 'autoStart=1 ' ;
		if ((height == 24) && (width == 299)) 
			CodeGen = CodeGen + 'ShowStatusBar=1 '; 
		if ((height >= 50) && (height <= 75) && (width >= 200)) 
			CodeGen = CodeGen + 'ShowStatusBar=1 '; 
		if ((height > 75) && (width >= 200)) 
			CodeGen = CodeGen + 'ShowStatusBar=0 '; 
		if ((height <= 49) && (width != 299))
			CodeGen += 'ShowStatusBar=0 '; 
		CodeGen += 'enableContextMenu=1 cache=0' + '\n' ;
		CodeGen += 'playCount=' + rpt + ' ' ;
		CodeGen += 'volume=-1 ' ;
		CodeGen += 'HEIGHT=' + height + ' WIDTH=' + width + '>'
				
			document.write(CodeGen)
	
}

function GetBrowser()
{
   var agt=navigator.userAgent.toLowerCase();
   if( ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1)) )
       return "IE";
   else if( ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
         && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
         && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1)) )
       return "Netscape";
   else
       return "unknown";
}
