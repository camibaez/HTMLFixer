<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Loans Transactions</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">

function CheckNum(){
if(document.forms[0].E03DEAACC.value.length < 1){
alert("Please, enter valid Certificate Number");
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
<%
 boolean acceptWarning = false;
 if (!error.getERRNUM().equals("0")) {
 	if (error.getERNU01().equals("0225") || error.getERNU02().equals("0225") || error.getERNU03().equals("0225") || error.getERNU04().equals("0225") ||
 		error.getERNU05().equals("0225") || error.getERNU06().equals("0225") || error.getERNU07().equals("0225") || error.getERNU08().equals("0225") ||
 		error.getERNU09().equals("0225") || error.getERNU10().equals("0225")) {
 		acceptWarning = true;
 	}
 }
%>
<h3 align="center">Loans Transactions<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_enter_transac,EDL0150"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
  </p>
 <!-- <h4>Por favor Ingrese el n&uacute;mero
    del Certificado de Dep&oacute;sito</h4>-->

    <table cellspacing=0 class="tbenter" cellpadding=2 width="100%"  height="75%" border="0">
      <tr >
            <td nowrap align="center">
              Reference Number :
               <INPUT type="text" name="E03DEAACC" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E03DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            	 <br>
         <%if (acceptWarning == true) {%>
        <div align="center">
          <input type="checkbox" name="H03FLGWK2" value="A" "checked">
          Reactivate Account </div>
				<br>
		<%}%>
  <div align="center">
	   <input id="EIBSBTN" type=submit name="Submit" value="Submit" onClick="CheckNum();">
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
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
