<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Aditional Cards</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

var typAcc;
typAcc = 'RT';


function CheckACC(){
if ( document.forms[0].E01CCRCRA.value.length < 1) {
  alert("A valid account number must be entered");
  document.forms[0].E01CCRCRA.value='';
  document.forms[0].E01CCRCRA.focus();
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body bgcolor="#FFFFFF">

<H3 align="center">Aditional Cards<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_enter_aditional_cards, ECC0060"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  </p>

  <table class="tbenter" HEIGHT="25%" width="100%" border="0">
    <tr>
      <td nowrap ALIGN=CENTER>
        Account Number :
        <INPUT type="text" name="E01CCRCRA" size="12" maxlength="9" onkeypress="enterInteger()">
        <a href="javascript:GetAccount('E01CCRCRA','',typAcc,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Help" border="0" ></a>
      </td>
    </tr>
  </table>
  <h4>Card Type</h4>
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0" >
   <tr>
      <td >
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap>
              <input type="radio" name="E01TARTYP" value="D" checked onClick="typAcc='RT'"> Debit Card
            </td>
            <td width="60%" nowrap>
            </td>
          </tr>
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="20%" nowrap>
              <input type="radio" name="E01TARTYP" value="C" onClick="typAcc='94'"> Credit Card
            </td>
            <td width="60%" nowrap>
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
  document.forms[0].E01CCRCRA.focus();
  document.forms[0].E01CCRCRA.select();
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
