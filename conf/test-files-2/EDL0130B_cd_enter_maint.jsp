<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Maintenance of Deals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].E01DEAACC.value.length < 1){
alert("A Certificate valid number must be entered");
document.forms[0].E01DEAACC.value='';
document.forms[0].E01DEAACC.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "cdMant" class= "datapro.eibs.beans.EDL013001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<h3 align="center">Account Maintenance<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cd_enter_maint, EDL0130"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  </p>
  <!--<h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
  <table class="tbenter" height="75%" width="100%" border="0">
    <tr>
          <td nowrap align="center">
              Account Number :
              <INPUT type="text" name="E01DEAACC" size="12" maxlength="9" onkeypress="enterInteger()" value="<%= cdMant.getE01DEAACC() %>">
        <a href="javascript:GetDealsAcc('E01DEAACC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
        <p align="center">
			<%
			if (error.getERWRNG().equals("Y")) {
				error.setERWRNG(" ");
			%>
				<input type="checkbox" name="H01FLGWK2" value="A">
      				Reactivate Account.
			<%
			}
			%>
		</p>
		 <br>
  <div align="center">
	   <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </div>
            </td>
          </tr>
        </table>

  </form>
<script language="JavaScript">
document.forms[0].E01DEAACC.focus();
document.forms[0].E01DEAACC.select();
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
</body>
</html>
