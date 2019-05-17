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

function checkCust(){
	if(trim(document.forms[0].E01MIVCUN.value).length < 1){
		
		document.forms[0].E01MIVCUN.value='';
		document.forms[0].E01MIVCUN.focus();
		return false;
	}
}

</SCRIPT>
</HEAD>

<body>

<h3 align="center">Investments - Collaterals<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="inv_collaterals_enter_client, EIE0230"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0230" onSubmit="return(checkCust())">
  
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="FromRecord" VALUE="0">
    <table class="tbenter" cellspacing=0 cellpadding=2 height="30%" border="0">
      <tr> 
        <td></td>
      </tr>
    </table>
    <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
      <tr> 
        <td width="40%"> 
        	<div align="right">Customer Number :</div> 
        </td>
        <td nowrap> 
          <INPUT type="text" name="E01MIVCUN" size="9" maxlength="9" onkeypress="enterInteger()">
          <a href="javascript:GetCustomerDescId('E01MIVCUN','D01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
          <input type="text" name="D01CUSNA1" size="35" maxlength="35" readonly>
      </td>
      </tr>          
    </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].E01MIVCUN.focus();
  document.forms[0].E01MIVCUN.select();
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
 