<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Charge Off/Recovery</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].E01DEAACC.value.length < 1){
alert("A loan valid number must be entered");
document.forms[0].E01DEAACC.value='';
document.forms[0].E01DEAACC.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>




<body>

<h3 align="center">Charge Off/Recovery<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="ln_enter_chargeoff.jsp , EDL0950"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950" >

  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="900">
  </p>
  <p>&nbsp;</p>
 <!-- <h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
  <table  class="tbenter" width="100%"  border="0" cellspacing=0 cellpadding=2>
	<tr>
     <td align="center">
              Account Number :
              <INPUT type="text" name="E01DEAACC" size="12" maxlength="9" onkeypress="enterInteger()">
              <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>

            </td>
          </tr>
        </table>
  <h4></h4>
  <p>&nbsp;</p><p>&nbsp;</p>
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr>
      <td >
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="40%" nowrap >

            </td>

            <td width="60%" nowrap >
              <input type="radio" name="H01FLGWK1" value="1" checked >Charge-Off
            </td>
          </tr>
          <tr>
             <td width="40%" nowrap >

            </td>

            <td width="60%" nowrap >
              <input type="radio" name="H01FLGWK1" value="2" >Charge-Off Reversal
            </td>
          </tr>
          <tr>
            <td width="40%" nowrap >

            </td>

            <td width="60%" nowrap >
              <input type="radio" name="H01FLGWK1" value="3"  >Recovery
            </td>
           </tr>
          <tr>
            <td width="40%" nowrap >

            </td>

            <td width="60%" nowrap >
              <input type="radio" name="H01FLGWK1" value="4" >Recovery Reversal
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <br>
  <p>&nbsp;</p><p>&nbsp;</p>
  <p align="center">
      <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </p>


<script language="JavaScript">
  document.forms[0].E01DEAACC.focus();
  document.forms[0].E01DEAACC.select();
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
