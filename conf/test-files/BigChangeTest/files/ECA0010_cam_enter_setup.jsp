<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Customer Accounts Management</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />



<body bgcolor="#FFFFFF">

<h3 align="center">Customer Accounts Management Module - Setup Accounts Relationship<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cam_enter_params, ECA0010"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECA0010">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <!--<h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>

      <td nowrap align="center"> Account Number : <input type="text" name="E01CAMPAC" size="12" maxlength="9" value="">
          <a href="javascript:GetAccount('E01CAMPAC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0"></a>
<div align="center">
	      <input id="EIBSBTN" type=submit name="Submit" value="Submit">
  </div>
            </td>
          </tr>
        </table>

  </form>

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
</body>
</html>
