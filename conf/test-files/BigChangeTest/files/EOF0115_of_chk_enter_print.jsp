<html>
<head>
<title>Cheques Oficiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
if(document.forms[0].E01OFMCKN.value.length < 1){
alert("A valid check number must be entered");
document.forms[0].E01OFMCKN.value='';
document.forms[0].E01OFMCKN.focus();
}
else {
  document.forms[0].submit();
}
}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body  nowrap bgcolor="#FFFFFF">

<h3 align="center">Official Checks Print<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="of_chk_enter_print, EOF0115"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  </p>
 <!-- <h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="50%">
              <div align="right">Currency Code : </div>
            </td>
            <td nowrap width="50%">
              <input type="text" name="E01OFMCCY" size="4" maxlength="3">
              <a href="javascript:GetCurrency('E01OFMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absbottom" border="0" alt="help"></a>
            </td>
          </tr>
          <tr>
            <td nowrap width="50%">
              <div align="right">Check Number :</div>
            </td>
            <td nowrap width="50%">
              <input type="text" name="E01OFMCKN" size="12" maxlength="9">
              <a href="javascript:GetCheck('E01OFMCKN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">
        <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="CheckACC()">
  </p>
  <script language="JavaScript">
  document.forms[0].E01OFMCCY.focus();
  document.forms[0].E01OFMCCY.select();
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
