<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Collaterals</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<body bgcolor="#FFFFFF">

<h3 align="center">Collaterals Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="collateral_none_acc_enter.jsp,ERA0100"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100" >
  <CENTER>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
      <tr valign="middle">
        <td nowrap colspan="2" align="bottom" height="120">&nbsp;</td>
      </tr>
      <tr valign="middle">
        <td nowrap width=40% align="right" height="17" > Enter Customer Number:</td>
        <td nowrap width=40% align="left" height="17" >
          <input type=TEXT name="CUSNUM" value="" size=15 maxlength=9>
          <a href="javascript:GetCustomerDescId('CUSNUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" align="absmiddle" border="0" ></a>
          &nbsp; </td>
      </tr>
      <tr valign="middle">
        <td nowrap width=40% align="right" height="8">Enter Reference: </td>
        <td nowrap width=40% align="left" height="8" >
          <input type=TEXT name="REF" value="" size=15 maxlength=9  onkeypress="enterInteger()">
          <a href="javascript:GetAccount('REF','','91','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"  ></a>
        </td>
      </tr>
      <tr>
        <td nowrap colspan="2" valign="middle" height="120">
          <div align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </div>
        </td>
      </tr>
      <tr>
        <td nowrap colspan="2" valign="middle">&nbsp;</td>
      </tr>
    </table>
  </CENTER>
<script language="JavaScript">
  document.forms[0].CUSNUM.focus();
  document.forms[0].CUSNUM.select();
</script>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
