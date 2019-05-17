<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Retail Account Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if ( document.forms[0].E01ACCTID.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01ACCTID.value='';
  document.forms[0].E01ACCTID.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Checkbook Order<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="account_enter, ECH1100"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH1100">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

  </p>
 <br>
 <br>
  <table class="tbenter" width="100%" border="0">

    <tr>
      <td nowrap ALIGN=CENTER>
        Account Number :
        <INPUT type="text" name="E01ACCTID" size="12" maxlength="9" onkeypress="enterInteger()">
        <a href="javascript:GetAccount('E01ACCTID','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
			<br>

      </td>
    </tr>
    <tr>
      <td nowrap ALIGN=CENTER>
        <br>
       <INPUT type="radio" name="E01ACTFLG" value="N" checked> New Order &nbsp;

        <INPUT type="radio" name="E01ACTFLG" value="R"> Re-Order Checkbook

      </td>
    </tr>
  </table>
  <br>
 <p align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </p>
<script language="JavaScript">
  document.forms[0].E01ACCTID.focus();
  document.forms[0].E01ACCTID.select();
</script>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
  <%
 }
%>
</form>
</body>
</html>
