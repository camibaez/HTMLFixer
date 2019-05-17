<html>
<head>
<title>Fixed Assets</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<H3 align="center">Fixed Assets/ Amortization Cross Reference Table<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="fix_enter_cross.jsp,EFIX030"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX030">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Bank : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" name="E01FIXBNK" size="3" maxlength="2" onKeypress="enterInteger()">
      </td>
    </tr>
    <tr>
      <td nowrap width="50%">
        <div align="right">Currency :</div>
      </td>
      <td nowrap width="50%">
        <input type="text" name="E01FIXCCY" size="4" maxlength="3" >
		<a href="javascript:GetCurrency('E01FIXCCY',document.forms[0].E01FIXBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a> 
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">General Ledger Account : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" name="E01FIXGLN" size="17" maxlength="12" onKeypress="enterInteger()">
		<a href="javascript:GetLedger('E01FIXGLN',document.forms[0].E01FIXBNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a></td>
      
    </tr>
  </table>
  <br>
          <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Submit">
          </p>
<script language="JavaScript">
  document.forms[0].E01FIXGLN.focus();
  document.forms[0].E01FIXGLN.select();
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
