<html>
<head>
<title>Document Selection</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<H3 align="center">Document Selection<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="pay_enter,EDL0825"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0825">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    
    <tr> 
      <td align="right">Loan Number : </td>
	  <td nowrap width="50%"> 
        <input type="text" name="E01SELLNS" size="12" maxlength="12" onKeypress="enterInteger()">
        <a href="javascript:GetAccount('E01SELLNS','','10','G')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Acceptant Identification Number : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" name="E01SELIDE" size="14" maxlength="14">
        <a href="javascript:GetAcceptantId('E01SELIDE')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
      </td>
    </tr>
  </table>
  
  <div align="center"> 
    <p><input id="EIBSBTN" type=submit name="Submit" value="Submit"></p>
  </div>

<script language="JavaScript">
  document.forms[0].E01SELLNS.focus();
  document.forms[0].E01SELLNS.select();
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
