<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Collection Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

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
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<h3 align="center">Collection Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="coll_enter_inquiry, EDC0100"></h3>
<hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSEDC0100">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
 <!--<h4 align="center">Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->

        <table  class="tbenter" width="100%" border="0" height="75%">

		  <tr>
            <td nowrap align="center">
    				 Account Number :
              	<input type="text" name="E01DCMACC" size="12" maxlength="9" onkeypress="enterInteger()">
              	<a href="javascript:GetAccount('E01DCMACC','','CL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
				<br>
              	<div align="center">
	              <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
            </div>
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
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
