<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Account Statement</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01DEAACC.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01DEAACC.value='';
  document.forms[0].E01DEAACC.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

</head>

<body>

<H3 align="center">Account Statement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="st_enter_stat,EDL0300"></H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
<table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center">
        Account Number :
        <INPUT type="text" name="E01DEAACC" size="12" maxlength="9" onkeypress="enterInteger()">
        <a href="javascript:GetAccount('E01DEAACC','','CD','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
         <br>
  <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>

      </td>
    </tr>
  </table>

  <script language="JavaScript">
  document.forms[0].E01DEAACC.focus();
  document.forms[0].E01DEAACC.select();
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
</form>
</body>
</html>
