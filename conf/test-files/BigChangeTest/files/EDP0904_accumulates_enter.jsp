<html>
<head>
<title>Tabla de M�dulos de Clasificaci�n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
</head>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
<H3 align="center">Actualizaci�n Consolidados por Instituci�n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="accumulates_enter,EDP0904"></H3>
<hr size="4">
<p>&nbsp;</p>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0904">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  <h4>&nbsp;</h4>
  <table class="tbenter" cellspacing=0 cellpadding=3 width="100%" border="0">
    <tr>
      <td width="30%"> 
		<div align="right">Cliente :</div>
	  </td>
      <td width="70%">
	<INPUT type="text" name="E01MVCCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" onKeypress="enterInteger()">
	<INPUT type="text" name="E01CUSNA1" size="35" maxlength="35" value="<%= userPO.getCusName().trim()%>" readonly>
	<a href="javascript:GetCustomerDescId('E01MVCCUN','E01CUSNA1','')">
	<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absmiddle" border="0">
      </td>
    </tr>


    <tr>
      <td width="30%"> 
		<div align="right">Codigo Instituci�n :</div>
	  </td>
      <td width="70%">
        <input type="text" name="E01MVCINS" size="5" maxlength="4" >
		<INPUT type="text" name="D01MVCINS" size="30" maxlength="30" readonly>
<%-- FONDO COMUN: TABLA 41
		<A href="javascript:GetCodeDescCNOFC('E01MVCINS','D01MVCINS','41')">
--%>
		<A href="javascript:GetCodeDescCNOFC('E01MVCINS','D01MVCINS','CC')">
		<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></A>
      </td>
    </tr>
    <tr>
      <td width="30%"> 
		<div align="right">N�mero Cuenta :</div>
	  </td>
      <td width="70%">
        <input type="text" name="E01MVCACC" size="14" maxlength="12" value="<%= userPO.getAccNum().trim()%>" onkeypress=enterInteger()>
		<A href="javascript:GetSelInst('E01MVCINS','D01MVCINS','E01MVCTAC','E01MVCACC','E01MVCYEA',document.forms[0].E01MVCCUN.value)">
		<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></A>
      </td>
    </tr>
    <tr>
      <td width="30%"> 
		<div align="right">A�o :</div>
	  </td>
      <td width="70%">
        <input type="text" name="E01MVCYEA" size="5" maxlength="4" onkeypress=enterInteger()>
      </td>
    </tr>
    <tr>
      <td width="30%"> 
        <div align="right">Tipo de Cuenta : </div>
      </td>
      <td width="70%"> 
	    <input type="radio" name="E01MVCTAC"  value="R" >
			Corriente<BR>
	    <input type="radio" name="E01MVCTAC"  value="S" >
			Ahorros<BR>
      </td>
    </tr>
  </table>
  
  <div align="center"> 
    <p><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
  </div>

<script language="JavaScript">

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