<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckFile(){
if ( document.forms[0].FILENAME.value.length < 1) {
  alert("A valid file name must be entered");
  document.forms[0].FILENAME.value='';
  document.forms[0].FILENAME.focus();
}
else {
  document.forms[0].SCREEN.value = '600';	
  document.forms[0].submit();
  }
}

</SCRIPT>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

 <h3 align="center">ACH Incoming<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="enter_file_ACH, EPR0020"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEPR0020ACH" ENCTYPE="multipart/form-data">	
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
    </p>
    <table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center"> 
             File Name : 
            <input type=file name="FILENAME" size="50" maxlength="255" >
            <p align="center"> 
			  <input id="EIBSBTN" type="button" name="Submit" value="Submit" onClick="CheckFile()"> 
 			</p> 
     </td>        
    </tr>
  </table>

<script language="JavaScript">
  document.forms[0].FILENAME.focus();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
 