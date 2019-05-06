<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<body>

<h3 align="center">Incoming File
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="enter_import_file, ESII010"></h3>
<hr size="4">

<FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSESII010" ENCTYPE="multipart/form-data">	
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    
    <table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center">File Name : 
            	<input type=file id="NAME" name="FILENAME" size="50" maxlength="255" >
            	<p align="center"><input id="EIBSBTN" type="button" name="Submit" value="Submit" onClick="CheckFile()"></p> 
     		</td>        
    	</tr>
  </table>

<script language="JavaScript">
	function CheckFile() {
		if (document.getElementById("NAME").value.length < 1) {
	  		alert("A valid file name must be entered");
	  		document.getElementById("NAME").value='';
	  		document.getElementById("NAME").focus();
		} else {
			document.forms[0].SCREEN.value = '1';	
	  		document.forms[0].submit();
	  	}
	}
	
  	document.getElementById("NAME").focus();
</script>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
      	error.setERRNUM("0");
 %>
    	 <SCRIPT Language="Javascript">
            showErrors();
     	</SCRIPT>
<% 	} %>

 </FORM>
</BODY>
</HTML>
 