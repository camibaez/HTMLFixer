<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Commercial Paper Transactions Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].E03DEAACC.value.length < 1){
alert("A Account valid number must be entered");
document.forms[0].E03DEAACC.value='';
document.forms[0].E03DEAACC.focus();
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

<h3 align="center">Commercial Paper Transactions Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_enter_transac,EDL0130"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2200">
  </p>

 <!-- <h4>Por favor Ingrese el n&uacute;mero
    del Certificado de Dep&oacute;sito</h4>-->
  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          <td nowrap align="center">
          Account Number :
              <INPUT type="text" name="E03DEAACC" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E03DEAACC','','13','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
             <br>
  <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
            </td>
          </tr>
        </table>

<script language="JavaScript">
  document.forms[0].E03DEAACC.focus();
  document.forms[0].E03DEAACC.select();
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
