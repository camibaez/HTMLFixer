<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Portfolio</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<SCRIPT Language="javascript">

function checkPort(){
	    if(trim(document.forms[0].E01PRFNUM.value).length > 0) {
	     	document.forms[0].OPCODE.value='0002'; 
	    }	
 		return true;
}

</SCRIPT>
</HEAD>

<body>

<h3 align="center">Customer Portfolio <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" alt="cus_enter_port_new, ESD0088"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088" onSubmit="return(checkPort())">
  
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="OPCODE" VALUE="0001">
    <INPUT TYPE=HIDDEN NAME="E01PRFCUN" VALUE="0">
    <table class="tbenter" cellspacing=0 cellpadding=2 height="30%" border="0">
      <tr> 
        <td></td>
      </tr>
    </table>
    <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
      <tr> 
        <td width="40%"> 
        	<div align="right">Portfolio :</div> 
        </td>
        <td nowrap align="left"> 
          <INPUT type="text" name="E01PRFNUM" size="10" maxlength="9" onkeypress="enterInteger()">
        <a href="javascript:GetCPortfolioNumDesc('E01PRFNUM','E01PRFCUN','','0')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
        (Blanks Automatic Numbering) </td>
      </tr>
          
    </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].E01PRFNUM.focus();
  document.forms[0].E01PRFNUM.select();
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
 