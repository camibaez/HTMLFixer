<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Account Statement</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>



</head>

<body nowrap>

<h3 align="center">Test Help<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_enter_acc, ECIF010" width="32" height="32"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">


  <table width="100%" border="0" bordercolor="#000000" cellspacing=0 cellpadding=0>

	<tr bordercolor="#FFFFFF">
      <td>
        <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>

		  <tr>
            <td width="50%">

            <div align="right">Please enter the issuer code : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD1" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetIssuerCode('FIELD1','N')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>

		  <tr>
            <td width="50%">

            <div align="right">Please enter the portfolio number : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD2" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetPortfolioNum('FIELD2','P')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>

		  <tr>
            <td width="50%">
            <div align="right">Please enter the commission table : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD3" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetCommTable('FIELD3','01')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>

		  <tr>
            <td width="50%">
            <div align="right">Please enter the document type : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD4" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetDocumentType('FIELD4','C')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>

		  <tr>
            <td width="50%">
            <div align="right">Please enter the income model : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD5" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetIncome('FIELD5','C')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>

		  <tr>
            <td width="50%">
            <div align="right">Please enter the broker : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD6" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetBrokerBooth('FIELD6','N')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>

	     <tr>
            <td width="50%">
            <div align="right">Please enter the portfolio code : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="FIELD7" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetPortfolioCode('FIELD7','N')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
