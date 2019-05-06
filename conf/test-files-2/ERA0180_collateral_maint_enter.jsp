<html>
<head>
<title>Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />



<body bgcolor="#FFFFFF">

<H3 align="center">Overdraft / Collaterals Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="collateral_maint_enter.jsp, ERA0180"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERA0180">

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  <h4>&nbsp;</h4>
  <table class="tableinfo" >
    <tr id="trdark">
      <td width="50%">
        <div align="right">Retail Account : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="E01ACMACC" onKeypress="enterInteger()" size="12" maxlength="12">
          <a href="javascript:GetAccount('E01ACMACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></div>
      </td>
    </tr>
    <tr id="trclear">
      <td width="50%">
        <div align="right">Certificate of Deposit : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="E01DEAACC" size="12" maxlength="12">
          <a href="javascript:GetAccount('E01DEAACC','','CD','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></div>
      </td>
    </tr>
    <tr id="trdark">
      <td width="50%">
        <div align="right">Credit Limit Amount : </div>
      </td>
      <td width="50%">
        <div align="left">
          <input type="text" name="E01CREDLM"  size="15" maxlength="15" onkeypress="enterInteger()">
          <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="absbottom"></div>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </p>
<script language="JavaScript">
  document.forms[0].E01ACMACC.focus();
  document.forms[0].E01ACMACC.select();
</script>

</form>
</body>
</html>
