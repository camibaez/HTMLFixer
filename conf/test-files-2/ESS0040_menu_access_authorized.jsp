<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.plugins.AccessSecurity"%>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>
Main Menu
</TITLE>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="request"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/e/javascripts/DynWrite.js"> </SCRIPT>

<SCRIPT Language="Javascript"> 

top.window.moveTo(0,0);

if (document.all) {
	top.window.resizeTo(screen.availWidth,screen.availHeight);

} else if (document.layers||document.getElementById) {

if (top.window.outerHeight<screen.availHeight||top.window.outerWidth<screen.availWidth){
	top.window.outerHeight = screen.availHeight;
	top.window.outerWidth = screen.availWidth;
}

}

	function switchOpt(id) {	
	 var oldid = document.forms[0].ACTIVEOPT.value;
		if ( oldid != "") {
			document.getElementById("suboption" + oldid).style.display = "none";
			document.getElementById("td" + oldid).className = "menuItem";
			if ( oldid != id ) {
				document.getElementById("suboption" + id).style.display = "";
				document.getElementById("suboption" + id).scrollIntoView(false);
				document.getElementById("td" + id).className = "selectedItem";
				document.forms[0].ACTIVEOPT.value = id;
			} else document.forms[0].ACTIVEOPT.value = "";
		} else {
			document.getElementById("suboption" + id).style.display = "";
			document.getElementById("suboption" + id).scrollIntoView(false);
			document.getElementById("td" + id).className = "selectedItem";
			document.forms[0].ACTIVEOPT.value = id;
		}
		
	}
	
	
  function setTableHeight() {
 	 var minValue= document.getElementById("mainTable").offsetTop + 30;
 	 var h = document.body.clientHeight - minValue ;
 	 document.getElementById("Container").style.height= h + ""; 
  }
  
 function ShowNow() {
  with (new Date()) { 
 	var Q=getTime();
 	Timer = setTimeout("ShowNow()", 1000-Q%1000);

	var h 	=  getHours();
	var m 	=  getMinutes();
	var s 	=  getSeconds();
	var sufix = '';
	
	if (h == 0) {
	  h = 12;
	  sufix = 'AM';
	} else if (h == 12) {
	  h = 12;
	  sufix = 'M';
	} else if (h > 12) {
	  h -= 12;
	  sufix = 'PM';
	} else {
	  sufix = 'AM';
	}

  	var St = '&nbsp;';
	St += h < 10 ? "0" + h  : h;
	St += ':';
	St += m < 10 ? "0" + m  : m;
	St += ':';
	St += s < 10 ? "0" + s  : s;
	St += '&nbsp;';
	St += sufix;

  	// var St = '&nbsp;' + getHours() + ':' + getMinutes() + ':' + getSeconds();
 	DynWrite('RunClock', St);
  }
 }
 
 function go(url, tg, menuOpt, subMenuOpt) {
   var frm = document.forms[0];
   frm.ServletName.value = url;
   frm.MenuOption.value = menuOpt;
   frm.MenuSubOption.value = subMenuOpt;
   frm.target = tg;
   frm.submit();
 }
</SCRIPT>

<STYLE>
 BODY {
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
  	scrollbar-arrow-color : #0C1C92;
  	scrollbar-base-color : #0C1C92;
  	scrollbar-darkshadow-color :#0C1C92;
  	scrollbar-face-color : #B0C4DE;
  	scrollbar-highlight-color :#CCD4DE;
  	scrollbar-shadow-color :#CCD4DE;
  	scrollbar-track-color :#CCD4DE;
 	}
 .menuItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:7.5pt;
 	padding:0;
 	background-Color:none;
 	color:#0C1C92;
 	cursor:hand;
 	border: none;
	padding-left:4px;
 	}
 .highlightItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:7.5pt;
 	padding:0;
 	color:#141AC6;
 	cursor:hand;
 	border-top-color : none;
	padding-left:4px;
	font-style: normal;
	text-decoration: none;
}
 .selectedItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:7.5pt;
 	padding:0;
 	background-Color:#4682B4;
 	color:#F0FFFF;
 	cursor:hand;
 	border: none;
	padding-left:4px;
	}
 .optSubMenu {
	background:transparent url('<%=request.getContextPath()%>/images/options_button.gif') no-repeat fixed center left;
	background-Color:none;
	padding-left:6px;
	font-family: Verdana,Arial, Helvetica, sans-serif;
	font-size: 6.5pt;
	font-color: #1519C3;
}
 .optSubMenu a:link {
	color: #1519C3;
	text-decoration: none;
	padding-left:6px;
}
 .optSubMenu a:hover {
	color: #62A7D4;
	text-decoration: none;
	padding-left:6px;
}
 .optSubMenu a:visited {
	color: #1519C3;
	text-decoration: none;
	padding-left:6px;
}
</STYLE>
</HEAD>

<BODY onload="ShowNow();">
<form METHOD=POST ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSESS0040Redirector" TARGET="body">
  <INPUT TYPE=HIDDEN NAME="MenuOption" VALUE="">
  <INPUT TYPE=HIDDEN NAME="MenuSubOption" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ServletName" VALUE="">
  <input type=hidden name="ACTIVEOPT" value="">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
      <td colspan=2 width="178" align="right" valign="bottom"><img src="<%=request.getContextPath()%>/images/e/options_up.gif" vspace="0" hspace="0" border="0" width="178" height="40"></td>
   </tr>
   <tr>
    <td nowrap width="81" align="left" height="24" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1pt" color="#003399">
      <div ID=RunClock></div>
      </font> 
    </td>
    <td nowrap width="80" align="right" height="24" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="1pt" color="#003399">
<%
	if ( currUser.getE01DTF().equals("MDY") ) {
		out.print(Util.formatDate(currUser.getE01RDM(), currUser.getE01RDD(), currUser.getE01RDY()));
	}
	else if ( currUser.getE01DTF().equals("DMY") ) {
		out.print(Util.formatDate(currUser.getE01RDD(), currUser.getE01RDM(), currUser.getE01RDY()));
	}
	else {
		out.print(Util.formatDate(currUser.getE01RDD(), currUser.getE01RDY(), currUser.getE01RDM()));
	}
%>
      &nbsp;&nbsp;
      </font> 
    </td>
  </tr>
  </table>
  
  <table width="100%" id=mainTable cellspacing="0" cellpadding="0">
	<tr>	    
      <td width="1%" align="right" valign="bottom"><img src="<%=request.getContextPath()%>/images/ltcorner.gif" border="0"></td>
      <td style="background-image :url('<%=request.getContextPath()%>/images/bkmiddle.gif'); background-repeat:repeat-x"> </td>
      <td width="1%" align="left" valign="bottom"><img src="<%=request.getContextPath()%>/images/rtcorner.gif" border="0"></td>
    </tr>
    <tr>	    
        <td style="background-image :url('<%=request.getContextPath()%>/images/lmiddle.gif'); background-repeat:repeat-y"></td>
		<td style="background-image :url('<%=request.getContextPath()%>/images/bkmiddle.gif') ;background-repeat:repeat;">
		<div id=Container style="overflow-y:auto">
			<div id=Menu>
			<%
			 String path = request.getParameter("WEBPATH") == null ? "" : request.getParameter("WEBPATH");
			 Iterator itMenu = AccessSecurity.sortMenu(((Map)request.getAttribute("mainMenu")).values(), "ESSDSC").listIterator();
			 while (itMenu.hasNext()) {
			 	datapro.eibs.beans.ESS0040DSMessage optMainMenu = (datapro.eibs.beans.ESS0040DSMessage) itMenu.next();
			 %>
			 	<div id="mainoption<%= optMainMenu.getESSSID() %>">
					<table cellspacing="2" width="100%">
						<tr>   
							<td align="LEFT" class="menuItem" id="td<%= optMainMenu.getESSSID() %>"
							 onmouseover="if (this.className!='selectedItem') this.className='highlightItem';" 
							 onmouseout="if (this.className!='selectedItem') this.className='menuItem';" 
							 onclick="switchOpt('<%= optMainMenu.getESSSID() %>');">  												
						 	  <b><%= optMainMenu.getESSDSC() %></b>
							</td>
						</tr>
					</table>
                </div>
                <div id="suboption<%= optMainMenu.getESSSID() %>" style="display:none">
			 		<table width="100%" cellspacing="0">
			 <%
				List subList = (List)((Map)request.getAttribute("subMenu")).get(optMainMenu.getESSSID());
				if(subList != null){
				 	Iterator itSubMenu = subList.listIterator();
				 	while (itSubMenu.hasNext()) {
			 			datapro.eibs.beans.ESS0040DSMessage optSubMenu = (datapro.eibs.beans.ESS0040DSMessage) itSubMenu.next();
			 			if (optSubMenu.getESSSID().equals(optMainMenu.getESSSID())) {
			 %>
			 			<tr >
			 				<td class="optSubMenu">  
  							 		<a href="javascript:go('<%= optSubMenu.getESSTAD() %>', '<%= optSubMenu.getESSTPO() %>', '<%= optSubMenu.getESSSID() %>', '<%= optSubMenu.getESSIDE() %>')">
  							 			<%= optSubMenu.getESSDSC() %></a>
							</td>
						</tr>
			 <%			}
			 		} 
			 	}
			 %>
					</table>
                </div>
			 <%
			 }
			 %>
			</div>
		</div>
		</td>
		<td style="background-image :url('<%=request.getContextPath()%>/images/rmiddle.gif'); background-repeat:repeat-y"></td>
	</tr>
	<tr>
      <td width="1%" align="right" valign="bottom"><img src="<%=request.getContextPath()%>/images/lbcorner.gif" border="0"></td>
      <td style="background-image :url('<%=request.getContextPath()%>/images/bbkmiddle.gif'); background-repeat:repeat-x"></td>
      <td width="1%" align="left" valign="bottom"><img src="<%=request.getContextPath()%>/images/rbcorner.gif" border="0"></td>
    </tr>
  </table>
</form>
<SCRIPT language="JavaScript">  
  setTableHeight();  
  window.onresize=setTableHeight;     
</SCRIPT>
</BODY>
</HTML>
