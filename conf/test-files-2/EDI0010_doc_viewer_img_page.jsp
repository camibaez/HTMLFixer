<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Blank</TITLE>

<%@ page import="datapro.eibs.master.JSEIBSProp" %>

<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<% 		
	String document = (request.getParameter("PAGE_NAME") == null) ? "" : request.getParameter("PAGE_NAME");
	String imageURL = null;
	if(JSEIBSProp.getImageRemote()){
		imageURL = JSEIBSProp.getScanURL()+"?SCREEN=4&DOC_NAME="+document;
	} else {
		imageURL = request.getContextPath()+"/servlet/datapro.eibs.tools.JSScanDocViewer?DOC_NAME="+document;
	}
%>

<SCRIPT LANGUAGE="JavaScript">

function loadImage(onViewer) {
    if (onViewer) {
		document.location.href="<%= imageURL %>";
    }
}

function loadPage(h, w) {
	document.getElementById("canvas").width = w;
	document.getElementById("canvas").height = h;
}

function viewer_exit() {
	if ( window.name !="main" ) top.close(); 
	else window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

//    zoom_in
function viewer_zoom_in() {
	var h = document.getElementById("canvas").height + 50;
   	var w = document.getElementById("canvas").width + 50;
  	loadPage(h, w);
}

//    zoom_out
function viewer_zoom_out() {
	var h = document.getElementById("canvas").height - 50;
   	var w = document.getElementById("canvas").width - 50;
  	loadPage(h, w);
}

//    Print
function viewer_print() {
  	focus();
  	print();
}
 
</SCRIPT>
</HEAD>

<% 		
	String type = (request.getParameter("TYPE") == null) ? "" : request.getParameter("TYPE");
	boolean onViewer = type.toUpperCase().equals("PDF") 
		|| type.toUpperCase().startsWith("DOC") 
		|| type.toUpperCase().startsWith("TIF");
%>
<BODY onload="loadImage(<%= ""+onViewer %>)">
<% 
		if (onViewer) {
			//Nothing to do...
		} else {
%>
			<TABLE class="tbenter" width="100%">
		    	<TR> 
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_zoom_in()"><b>Zoom In</b></a></TD>
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_zoom_out()"><b>Zoom Out</b></a></TD>
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_print()"><b>Print</b></a></TD>
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_exit()" ><b>Exit</b></a></TD>
		    	</TR>
		  	</TABLE>
		  
			<div align="center">
				<IMG name="img" id="canvas" src="<%= imageURL %>" 
					width = "100%" border="0" align="middle">
		   	</div>
<%
		}
%>		   	
</BODY>
</HTML>
