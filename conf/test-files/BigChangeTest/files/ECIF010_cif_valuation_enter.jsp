<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Portfolio</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<%--
<SCRIPT Language="Javascript">

function PrintWritePDF() {
	CUSNUM = document.forms[0].CUSNUM.value
	CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=501&CUSNUM='+CUSNUM+'&Pos=' + 1,600,500,4);
  
}

</SCRIPT>
--%>

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
</HEAD>

<body>

<h3 align="center">Customer Portfolio Valuation<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" alt="cif_valuation_enter, ECIF010"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010">  
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
	<INPUT TYPE=HIDDEN NAME="Pos" VALUE ="1,600,500,4">
	
    <table class="tbenter" cellspacing=0 cellpadding=2 height="30%" border="0">
      <tr> 
        <td></td>
      </tr>
    </table>
    <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
      <tr> 
        <td width="40%"> 
        	<div align="center">Customer / Portfolio :  
        	<INPUT type="text" name="CUSNUM" size="10" maxlength="9" onkeypress="enterInteger()">  
        	<A href="javascript:GetCustomerDescId('CUSNUM','','')"><IMG	src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></A> </div>
        </td>
      </tr>
    </table>
    
    <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
	<tr> 
		<td nowrap align="center"> 
		    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
   		</td>
   		<%--
  		<td nowrap align="left">
		  	<INPUT id="EIBSBTN" type="button" name="printer" value="Print" OnClick="PrintWritePDF();">
		</td>
		--%>
  	</tr>
   </table>
  	
<script language="JavaScript">
  document.forms[0].CUSNUM.focus();
  document.forms[0].CUSNUM.select();
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
 