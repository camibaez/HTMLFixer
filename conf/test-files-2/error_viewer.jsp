<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.*" %>
<html>
<head>
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<title>Errors - Warnings</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jsplayer/jquery.jplayer.min.js"></script>

<SCRIPT LANGUAGE="JavaScript">

$(document).ready(function() { 
 	/* Your Code */
 	$("#jpId").jPlayer( {
		ready: function () {
  			$(this).jPlayer("setMedia", {
    			oga: "<%=request.getContextPath()%>/pages/e/media/phrase_01.ogg", 
    			mp3: "<%=request.getContextPath()%>/pages/e/media/phrase_01.mp3"
  			}).jPlayer("play"); // Attempts to Auto-Play the media
		},
		supplied: "oga, mp3",
		swfPath: "<%=request.getContextPath()%>/jquery/plugins/jsplayer/Jplayer.swf"
		});
});

$(document).ready(function () {
	$(".error-code").each(function() {
	    $(this).click(function() {
			//var parent = window.open("", window.opener.name);
			var parent = top.opener;
			if (isValidObject(parent)){
				parent.focus();
			}
	    });
	});
});

	function select(elem) {
		try {
		    elem.focus();
	    	elem.select();
		} catch (e) {
		}
	}
	
	function setFocus(focusItem, focusRow) {
		if ( focusItem == "" ) {
			return;
 		}
 		if ( !(focusRow == "" || focusRow == "0") ) {
			focusRow--;
       		focusItem = focusItem + "_" + focusRow;
 		}
 		
 		//focusItem = focusItem.toUpperCase();
 
		var form = top.opener.document.forms[0];
		var elem = top.opener.document.getElementsByName(focusItem)[0];
		if (isValidObject(elem)){
			if (elem.length > 0) {
				var offset = 0; 
				for (var i=0;i < elem.length; i++) {
  					if (elem[i].checked) {
    					offset = i;
    					break;
  					}
				}
    			select(elem[offset]);
			} else if (elem.style.visibility != "hidden" && !elem.disabled) {
				if (elem.type == "select"
					|| elem.type == "select-one"
					|| elem.type == "select-multiple") {
					select(elem);
				} else if (elem.type == "radio") {
					select(elem);
				} else if (elem.type == "text" || elem.type == "textarea") {
					select(elem);
				}
				self.blur();
			}
		}
	}

</SCRIPT>

</head>

<body>

<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader ("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");
  	
  	if ( JSEIBSProp.getVoiceActive() ) {
%>

		<div id="jpId"></div>

<%
	}
%>

<table id="tbhelp" width=100% align=center>
	<tr>
    	<td align=center colspan=3 >
      		<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter">
        		<tr>
          			<td width="75">
          				<div align="right">
          					<font color="red"><img src="<%=request.getContextPath()%>/images/warning.gif"></font>
          				</div>
          			</td>
          			<td>
            			<div align="center">
            				<font color="#FF3333" face="Verdana, Arial, Helvetica, Sans-serif" size="3"><b>Errors - Warnings</b></font>
            			</div>
          			</td>
          			<td width="75">
          				<div align="left">
          					<font color="red"><img src="<%=request.getContextPath()%>/images/warning.gif"></font>
          				</div>	
          			</td>
        		</tr>
				<tr>
					<td width="75" align="right" valign="top">
						<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="middle" name="EIBS_GIF" title="error_viewer">
					</td>
					<td colspan="2" align="left" valign="bottom">
						<hr size="4" align="right">
					</td>
				</tr>
      		</table>
   		</td>
	</tr>

<%
	int size = error.getBigDecimalERRNUM().intValue();
	if ("".equals(error.getERNU01())) {
		for (int i = 1; i <= size; i++) {
			String sufix = i < 10 ? "0" + i : "" + i;
%>	
			<tr>
			  <td colspan=3><%= error.getField("ERDS" + sufix).getString().trim() %></td>
			</tr>
<%	
		}
	} else { 
		String field = "";
		String row = "";
%>
	<tr>
    	<td align=center colspan=3 >
      		<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter">
<%		
		for (int i = 1; i <= 10; i++) {
			String sufix = i < 10 ? "0" + i : "" + i;
			if (!error.getField("ERNU" + sufix).getString().trim().equals("")) {
%>
			<tr>
	  			<td nowrap="nowrap" align="right" width="75">
<% 
				if (error.getField("ERWF" + sufix).getString().trim().equals("Y")) { 
%>
					<IMG src="<%=request.getContextPath()%>/images/warning01.gif" title="Warning!!!">
<% 
				} else { 
%>
					<IMG src="<%=request.getContextPath()%>/images/error01.gif" title="Error!!!">
<% 
				}
%>
	  			</td>
<%				
				field = error.getField("ERDF" + sufix) == null ? "" : error.getField("ERDF" + sufix).getString();
				row = error.getField("ERDR" + sufix).getString();	 
%>
	  			<td align="center">
	  				<a class="error-code" href="javascript:setFocus('<%= field %>', <%= row %>)">
	  					<b><%= error.getField("ERNU" + sufix).getString().trim()%></b></a>
	  			</td>
	  			<td nowrap="nowrap" align="left">
	  				<a class="error-code" href="javascript:setFocus('<%= field %>', <%= row %>)">
	  					<%= error.getField("ERDS" + sufix).getString().trim() %></a>
	  			</td>
  			</tr>	
<%			
			} else {
				field = "";
				row = "";
				break;
			}
		}			
	} 
%>
      		</table>
   		</td>
	</tr>

</table>

<br>

  <p align="center"> 
    <input id="EIBSBTN" type="button" name="close" value="Close" onclick="checkClose()">
  </p>

<SCRIPT LANGUAGE="JavaScript" >
	self.focus();
</SCRIPT>
</body>
</html>

