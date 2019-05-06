<%@ page import = "datapro.eibs.master.*" %>
<!-- Sample HTML file -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 //EN">
<HTML>
<HEAD>
<TITLE>
 Messages Checker
</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<%@page import="datapro.eibs.beans.UserPos"%>
<%@page import="datapro.eibs.beans.ESS0030DSMessage"%>

<SCRIPT SRC="<%=response.encodeURL(request.getContextPath()+"/pages/e/javascripts/eIBS.jsp")%>"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/plugins/jsplayer/jquery.jplayer.min.js"></script>

<SCRIPT language="JavaScript">
	setTimeout("document.forms[0].submit()", <%= datapro.eibs.master.JSEIBSProp.getChkMsgPeriod() %>);
	
	function showMsgViewer() {
		page = "<%=response.encodeURL(request.getContextPath()+"/pages/e/ESS0090_message_container.jsp")%>";
		CenterWindow(page, 800, 480, 2);
	}

	$(document).ready(function() { 
	 	$("#messageId").jPlayer( {
    		ready: function () {
      			$(this).jPlayer("setMedia", {
        			oga: "<%=request.getContextPath()%>/pages/e/media/msg_alert.ogg", 
        			mp3: "<%=request.getContextPath()%>/pages/e/media/msg_alert.mp3"
      			}).jPlayer("play"); // Attempts to Auto-Play the media
    		},
    		supplied: "oga, mp3",
    		swfPath: "<%=request.getContextPath()%>/jquery/plugins/jsplayer/Jplayer.swf"
  		});
	});
	
//    back
   function back() {
   	parent.main.history.back();
   }
      
//    forward
   
   function forward() {
	parent.main.history.forward();
   }
   
//    print
   
   function print_main() {
	parent.main.focus();parent.main.print();
   }

//    home
   
   function go_home() {
   	parent.main.window.location.href="<%=response.encodeURL(request.getContextPath()+"/pages/background.jsp")%>";
   }
								
//    eIBS help
   
   function eIBS_help() { 
	CenterWindow("<%=response.encodeURL(request.getContextPath()+"/pages/e/MISC_eIBS_about.jsp")%>",650,550,2);
   } 
   

//    eIBS about

   function eIBS_about() {
	CenterWindow("<%=response.encodeURL(request.getContextPath()+"/pages/e/MISC_eIBS_about.jsp")%>",340,340,2);
   }
    
//    Exit
   
   function log_out() {
    parent.main.window.location.href="<%=response.encodeURL(request.getContextPath()+"/servlet/datapro.eibs.menu.JSLogOff")%>";
   }
   
   function showText(idx) {
     document.getElementById("divtext" + idx).style.display="";
	 if(document.getElementById("divtext" + idx).filters) {
	     document.getElementById("divtext" + idx).style.filter="blendTrans(duration=1)";
	     if (document.getElementById("divtext" + idx).filters.blendTrans.status != 2) {
	     	document.getElementById("divtext" + idx).filters.blendTrans.Apply();
	     	document.getElementById("divtext" + idx).style.visibility="visible";
	     	document.getElementById("divtext" + idx).filters.blendTrans.Play();
	    }
     } else document.getElementById("divtext" + idx).style.visibility="visible";
   }
   
   function clearText(idx) {
     document.getElementById("divtext" + idx).style.visibility="hidden";
     document.getElementById("divtext" + idx).style.display="none";   
   }
   
</SCRIPT>

<BODY bgcolor="#000066" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
  	session = (javax.servlet.http.HttpSession) request.getSession(false);
  	ESS0030DSMessage currUser = (ESS0030DSMessage)session.getAttribute("currUser");
  	UserPos userPO = (UserPos)session.getAttribute("userPO");
  	String imagePath = request.getContextPath() + "/images/"
			+ (currUser.getH01SCR().startsWith("1") ? "dr" 
				: (currUser.getH01SCR().startsWith("2") ? "qa" 
					: (currUser.getH01SCR().startsWith("3") ? "ne" 
						: (currUser.getH01SCR().startsWith("4") ? "de" : "e"))));
	if (JSEIBSProp.getVoiceActive() && userPO.getThereIsMsg()) {
%>
		<div id="messageId"></div>
<%
	}
%>
     <FORM METHOD="post" ACTION="<%=response.encodeURL(request.getContextPath()+"/servlet/datapro.eibs.products.JSESS0090")%>">
       <INPUT TYPE="hidden" NAME="SCREEN" VALUE="3">
		
  <table border="0" cellspacing="0" cellpadding="0" width="100%" height="66" border=0 style="background: url('<%=imagePath%>/topbar_background.jpg')">
  			<tr>
    			<td width="578" height="40" align="left" valign="top" style="background: url('<%=imagePath%>/topbar_1.jpg') no-repeat;">&nbsp;</td> 
            	<td width="171" colspan= 6 height="40" align="left" valign="top" style="background: url('<%=imagePath%>/topbar_3.jpg')">
            	   <div id="dMsg" align="center" style="color: white; font-size:8pt; padding:4;">
            	   	 <%
          			if (!userPO.getThereIsMsg() ) {
          			%>
          			 <IMG border="0" src="<%=request.getContextPath()%>/images/e/no_message.gif" align=middle>
          			 &nbsp;<A href="javascript:document.forms[0].submit()"><b>NO messages</b></A>
          			<%
          			}
          			else {
          			%> 
          			  <a href="javascript:showMsgViewer()"><IMG border="0" src="<%=request.getContextPath()%>/images/e/new_message.gif" align=middle></a>
          			  &nbsp;<A href="javascript:document.forms[0].submit()"><b>NEW messages</b></A>
          			<%
          			}
          			%>
            	   </div>
            	</td> 
            	<td rowspan=2 background="<%=imagePath%>/topbar_background.jpg" height="66">&nbsp;</td>
            </tr>
            <tr style="background: url('<%=imagePath%>/topbar_background.jpg')">
				<td nowrap width="578" height="25" align=right valign="middle" style="background: url('<%=imagePath%>/topbar_2.jpg') no-repeat;">
					<div id="divtext1" style="display:none; visibility:hidden; color: yellow; font-size:8pt "><b>print  &nbsp;</b></div>
					<div id="divtext2" style="display:none; visibility:hidden; color: yellow; font-size:8pt"><b>home  &nbsp;</b></div>
					<%-- <div id="divtext3" style="display:none; visibility:hidden; color: yellow; font-size:8pt"><b>help  &nbsp;</b></div> --%>
					<div id="divtext4" style="display:none; visibility:hidden; color: yellow; font-size:8pt"><b>about e-IBS  &nbsp;</b></div>
					<div id="divtext5" style="display:none; visibility:hidden; color: yellow; font-size:8pt"><b>exit  &nbsp;</b></div>					
				</td>
    			<td nowrap width="25" height="25" style ="cursor:pointer;" align="left" valign="top" background="<%=imagePath%>/topbar_print.jpg" onmouseover = "showText(1)" onmouseout = "clearText(1)" onclick="print_main()">&nbsp;</td>
    			<td nowrap width="26" height="25" style ="cursor:pointer;" align="left" valign="top" background="<%=imagePath%>/topbar_home.jpg" onmouseover = "showText(2)" onmouseout = "clearText(2)" onclick="go_home()">&nbsp;</td>
    			<%-- <td nowrap width="17" height="25" style ="cursor:pointer;" align="left" valign="top" background="<%=imagePath%>/topbar_help.jpg" onmouseover = "showText(3)" onmouseout = "clearText(3)" onclick="eIBS_help()">&nbsp;</td> --%>
    			<td nowrap width="19" height="25" style ="cursor:pointer;" align="left" valign="top" background="<%=imagePath%>/topbar_about.jpg" onmouseover = "showText(4)" onmouseout = "clearText(4)" onclick="eIBS_about()">&nbsp;</td>
    			<td nowrap width="23" height="25" style ="cursor:pointer;" align="left" valign="top" background="<%=imagePath%>/topbar_exit.jpg" onmouseover = "showText(5)" onmouseout = "clearText(5)" onclick="log_out()">&nbsp;</td>
    		    <td nowrap width="61" height="25" align="left" valign="top" style="background: url('<%=imagePath%>/topbar_4.jpg')">
    		    	<span style="width: 78; vertical-align: -5; font-size: 8pt; font-weight:bold; color: <%= 
    		    		imagePath.endsWith("qa") || imagePath.endsWith("ne") ? "black" : "yellow" %>;">
    		    		&nbsp;<%=currUser.getH01USR()%>
    		    	</span>
    		    </td>    		
    		</tr>
		</table>
     </FORM>
    
    </BODY>
</HTML>