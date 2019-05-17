<html>
<head>
<title>Account Statement</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01DCMACC.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01DCMACC.value='';
  document.forms[0].E01DCMACC.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Collections Account Statement
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="coll_enter_stat.jsp,ESD0817">
</H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSESD0817C">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  <table  class="tbenter" width="100%" height="75%" border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center">
        Account Number :
        <input type="text" name="E01DCMACC" size="12" maxlength="9" onkeypress="enterInteger()">
        <a href="javascript:GetAccount('E01DCMACC','','CL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
      <p align="center">
						<input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
 				 </p>
     </td>
    </tr>
  </table>
<script language="JavaScript">
  document.forms[0].E01DCMACC.focus();
  document.forms[0].E01DCMACC.select();
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
