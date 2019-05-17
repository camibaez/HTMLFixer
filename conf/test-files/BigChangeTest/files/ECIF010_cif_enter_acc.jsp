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

<SCRIPT Language="Javascript">
  function goAction(op) {

     document.forms[0].opt.value = op;
     document.forms[0].submit();

  }
</SCRIPT>

</head>

<body nowrap bgcolor="#FFFFFF" onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/exit_over.gif','<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif','<%=request.getContextPath()%>/images/e/AVERAGE_OVER.gif','<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT_OVER.gif')">

<h3 align="center">Account Statement<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cif_enter_acc, ECIF010" width="32" height="32"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','<%=request.getContextPath()%>/images/e/INQUIRY_OVER.gif',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/e/INQUIRY.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT_OVER.gif',1)"><img name="Image2" border="0" src="<%=request.getContextPath()%>/images/e/STATEMENT_ACCOUNT.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','<%=request.getContextPath()%>/images/e/AVERAGE_OVER.gif',1)"><img name="Image3" border="0" src="<%=request.getContextPath()%>/images/e/AVERAGE.gif" ></a>
      </TD>
      <TD ALIGN=CENTER width="20%">
  			<a href="<%=request.getContextPath()%>/pages/background.jsp"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/e/exit_over.gif',1)"><img name="Image5" border="0" src="<%=request.getContextPath()%>/images/e/exit.gif" ></a>
      </TD>
    </TR>
  </TABLE>
  <p>&nbsp;</p>
  <table width="100%" border="0" bordercolor="#000000" cellspacing=0 cellpadding=0>

	<tr bordercolor="#FFFFFF">
      <td>
        <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>

		    <tr><td>&nbsp;</td></tr>
	  <tr><td>&nbsp;</td></tr>
	  <tr><td>&nbsp;</td></tr>
		  <tr><td>&nbsp;</td></tr>
		  <tr>
            <td width="50%">

            <div align="right">Please enter the account number : </div>
            </td>
            <td width="50%">
              <INPUT type="text" name="ACCNUM" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('ACCNUM','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<script language="JavaScript">
  document.forms[0].ACCNUM.focus();
  document.forms[0].ACCNUM.select();
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
